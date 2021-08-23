<?php

// menggabungkan kode dari file result_query.php
// yg mana result_query digunakan sebagai
// object yg digunakan untuk hasil
include_once("result_query.php");

class recipe_detail {
    public $id;
    public $recipe_id;
    public $step;
    public $text;

    public function __construct(){
    }

    public function set($data){
        $this->id = (int) $data->id;
        $this->recipe_id = (int) $data->recipe_id;
        $this->step = $data->step;
        $this->text = $data->text;
    }

    public function add($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "INSERT INTO recipe_detail (recipe_id,step,text) VALUES (?,?,?)";
        $stmt = $db->prepare($query);
        $stmt->bind_param('iis', $this->recipe_id,$this->step,$this->text);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error =  "error at add new recipe_detail : ".$stmt->error;
            $result_query->data = "not ok";
        }
        $stmt->close();
        return $result_query;
    }
    
    public function one($db) {
        $result_query = new result_query();
        $one = new recipe_detail();
        $query = "SELECT id,recipe_id,step,text FROM recipe_detail WHERE id=? LIMIT 1";
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
        $one->recipe_id = $result['recipe_id'];
        $one->step = $result['step'];
        $one->text = $result['text'];
        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }

    public function all($db,$list_query) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    id,recipe_id,step,text
                FROM 
                    recipe_detail 
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
            $result_query-> error = "error at query all recipe_detail : ".$stmt->error;
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
            $one = new recipe_detail();
            $one->id = $result['id'];
            $one->recipe_id = $result['recipe_id'];
            $one->step = $result['step'];
            $one->text = $result['text'];
            array_push($all,$one);
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function update($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "UPDATE recipe_detail SET recipe_id = ?,step = ?,text = ? WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('iisi', $this->recipe_id,$this->step,$this->text,$this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at update one recipe_detail : ".$stmt->error;
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
        $query = "DELETE FROM recipe_detail WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at delete one recipe_detail : ".$stmt->error;
            $result_query->data = "not ok";
            $stmt->close();
            return $result_query;
        }
        $stmt->close();
        return $result_query;
    }
}


?>