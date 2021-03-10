<?php

// menggabungkan kode dari file result_query.php
// yg mana result_query digunakan sebagai
// object yg digunakan untuk hasil
include_once("product.php");

class recipe {
    public $id;
    public $product_id;
    public $product;

    public function __construct(){
    }

    public function set($data){
        $this->id = (int) $data->id;
        $this->product_id = (int) $data->product_id;
    }

    public function add($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "INSERT INTO recipe (product_id) VALUES (?)";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->product_id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error =  "error at add new recipe : ".$stmt->error;
            $result_query->data = "not ok";
        }
        $stmt->close();
        return $result_query;
    }
    
    public function one($db) {
        $result_query = new result_query();
        $one = new recipe();
        $query = "SELECT id,product_id FROM recipe WHERE id=? LIMIT 1";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();      
        if ($stmt->error != ""){
            $result_query-> error = "error at query one product: ".$stmt->error;
            $stmt->close();
            return $result_query;
        }
        $rows = $stmt->get_result();
        if($rows->num_rows == 0){
            $stmt->close();
            return $result_query;
        }
        $result = $rows->fetch_assoc();
        $one->id = $result['id'];
        $one->product_id = $result['product_id'];

        $p = new product();
        $p->id = $one->product_id;
        $one->product =  $p->one($db)->data;

        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }

    public function all($db,$list_query) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    id,product_id
                FROM 
                    recipe 
                WHERE
                    ".$list_query->search_by." LIKE ?
                ORDER BY
                    ".$list_query->order_by." ".$list_query->order_dir." 
                LIMIT ? 
                OFFSET ?";
        $stmt = $db->prepare($query);
        $search = "%".$list_query->search_value."%";
        $offset = $list_query->offset;
        $limit =  $list_query->limit;
        $stmt->bind_param('sii',$search ,$limit, $offset);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all recipe : ".$stmt->error;
            $stmt->close();
            return $result_query;
        }
        $rows = $stmt->get_result();
        if($rows->num_rows == 0){
            $stmt->close();
            $result_query->data = $all;
            return $result_query;
        }

        while ($result = $rows->fetch_assoc()){
            $one = new recipe();
            $one->id = $result['id'];
            $one->product_id = $result['product_id'];

            $p = new product();
            $p->id = $one->product_id;
            $one->product =  $p->one($db)->data;

            array_push($all,$one);
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function update($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "UPDATE recipe SET product_id = ? WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('ii', $this->product_id,$this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at update one recipe : ".$stmt->error;
            $result_query->data = "not ok";
            $stmt->close();
            return $result_query;
        }
        $stmt->close();
        return $result_query;
    }
    
    public function delete($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "DELETE FROM recipe WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at delete one recipe : ".$stmt->error;
            $result_query->data = "not ok";
            $stmt->close();
            return $result_query;
        }
        $stmt->close();
        return $result_query;
    }
}


?>