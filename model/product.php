<?php

// menggabungkan kode dari file result_query.php
// yg mana result_query digunakan sebagai
// object yg digunakan untuk hasil
include_once("result_query.php");

class product {
    public $id;
    public $category_id;
    public $name;
    public $price;
    public $stock;
    public $rating;
    public $image_url;
    public $detail;
    public $product_type;
    public $default_qty;
    public $exp_date;

    public function __construct(){
    }

    public function set($data){
        $this->id = (int) $data->id;
        $this->category_id = (int) $data->category_id;
        $this->name = $data->name;
        $this->price = (int) $data->price;
        $this->stock = (int) $data->stock;
        $this->rating = (int) $data->rating;
        $this->image_url = $data->image_url;
        $this->detail = $data->detail;
        $this->product_type = $data->product_type;
        $this->default_qty = $data->default_qty;
        $this->exp_date = $data->exp_date;
    }

    public function add($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "INSERT INTO product (name,category_id,price,stock,rating,image_url,detail,product_type,default_qty,exp_date) VALUES (?,?,?,?,?,?,?,?,?,?)";
        $stmt = $db->prepare($query);
        $stmt->bind_param('siiiissiis', $this->name,$this->category_id,$this->price,$this->stock,$this->rating,$this->image_url,$this->detail,$this->product_type,$this->default_qty,$this->exp_date);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error =  "error at add new product : ".$stmt->error;
            $result_query->data = "not ok";
        }
        $stmt->close();
        return $result_query;
    }
    
    public function one($db) {
        $result_query = new result_query();
        $one = new product();
        $query = "SELECT id,name,category_id,price,stock,rating,image_url,detail,product_type,default_qty,exp_date FROM product WHERE id=? LIMIT 1";
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
        $one->category_id = $result['category_id'];
        $one->name = $result['name'];
        $one->price = $result['price'];
        $one->stock = $result['stock'];
        $one->rating = $result['rating'];
        $one->image_url = $result['image_url'];
        $one->detail = $result['detail'];
        $one->product_type = $result['product_type'];
        $one->default_qty = $result['default_qty'];
        $one->exp_date = $result['exp_date'];
        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }

    public function all($db,$list_query,$category_id) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    id,name,category_id,price,stock,rating,image_url,detail,product_type,default_qty,exp_date
                FROM 
                    product
                WHERE
                    ".$list_query->search_by." LIKE ?
                AND
                    category_id = ?
                AND
                    product_type = 0
                ORDER BY
                    ".$list_query->order_by." ".$list_query->order_dir." 
                LIMIT ? 
                OFFSET ?";
        $stmt = $db->prepare($query);
        $search = "%".$list_query->search_value."%";
        $offset = $list_query->offset;
        $limit =  $list_query->limit;
        $stmt->bind_param('siii',$search ,$category_id ,$limit, $offset);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all product : ".$stmt->error;
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
            $one = new product();
            $one->id = $result['id'];
            $one->category_id = $result['category_id'];
            $one->name = $result['name'];
            $one->price = $result['price'];
            $one->stock = $result['stock'];
            $one->rating = $result['rating'];
            $one->image_url = $result['image_url'];
            $one->detail = $result['detail'];
            $one->product_type = $result['product_type'];
            $one->default_qty = $result['default_qty'];
            $one->exp_date = $result['exp_date'];
            array_push($all,$one);
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function count_recomended($db) {
        $result_query = new result_query();
        $query = "SELECT 
                    COUNT(DISTINCT t.customer_id) as recomended_value
                FROM 
                    product p
                INNER JOIN
                    detail_transaction dt
                ON
                    dt.product_id = p.id
                INNER JOIN
                    transaction t
                ON
                    t.id = dt.transaction_id
                WHERE
                    EXISTS (
                        SELECT 1 FROM  validate_transaction vt WHERE vt.transaction_id = t.id
                    )
                AND
                    p.id = ?
                AND
                    p.product_type = 0
                GROUP BY
                    p.id
                ORDER BY
                    COUNT(DISTINCT t.customer_id) DESC
                LIMIT 1";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all product : ".$stmt->error;
            $stmt->close();
            return $result_query;
        }
        $rows = $stmt->get_result();
        if($rows->num_rows == 0){
            $stmt->close();
            return $result_query;
        }
        $result = $rows->fetch_assoc();
        $one = (object) ['recomended_value' => $result['recomended_value']];
        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }

    public function sum_sold($db) {
        $result_query = new result_query();
        $query = "SELECT 
                    SUM(dt.sub_total) as sum_sold,
                    COUNT(dt.product_id) as count_sold
                FROM 
                    product p
                INNER JOIN
                    detail_transaction dt
                ON
                    dt.product_id = p.id
                INNER JOIN
                    transaction t
                ON
                    t.id = dt.transaction_id
                WHERE
                    EXISTS (
                        SELECT 1 FROM  validate_transaction vt WHERE vt.transaction_id = t.id
                    )
                AND
                    p.id = ?
                AND
                    p.product_type = 0
                GROUP BY
                    p.id
                LIMIT 1";

        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all product : ".$stmt->error;
            $stmt->close();
            return $result_query;
        }
        $rows = $stmt->get_result();
        if($rows->num_rows == 0){
            $stmt->close();
            return $result_query;
        }
        $result = $rows->fetch_assoc();
        $one = (object) ['sum_sold' => $result['sum_sold'],'count_sold' => $result['count_sold']];
        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }

    public function all_recomended($db,$list_query,$recomended_value) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    p.id as id,
                    COUNT(DISTINCT t.customer_id) as recomended_value
                FROM 
                    product p
                INNER JOIN
                    detail_transaction dt
                ON
                    dt.product_id = p.id
                INNER JOIN
                    transaction t
                ON
                    t.id = dt.transaction_id
                WHERE
                    EXISTS (
                        SELECT 1 FROM  validate_transaction vt WHERE vt.transaction_id = t.id
                    )
                AND
                    p.product_type = 0
                GROUP BY
                    p.id
                HAVING 
                    COUNT(DISTINCT t.customer_id) >= ?    
                ORDER BY
                    COUNT(DISTINCT t.customer_id) DESC
                LIMIT ? 
                OFFSET ?";
        $stmt = $db->prepare($query);
        $offset = $list_query->offset;
        $limit =  $list_query->limit;
        $stmt->bind_param('iii',$recomended_value, $limit, $offset);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all product : ".$stmt->error;
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
            $one = new product();
            $one->id = $result['id'];
            $p = $one->one($db)->data;
            array_push($all,$p);
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function all_favourite($db,$list_query,$customer_id,$favourite_value) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    p.id as id,
                    COUNT(p.id) as favourite_value
                FROM 
                    product p
                INNER JOIN
                    detail_transaction dt
                ON
                    dt.product_id = p.id
                INNER JOIN
                    transaction t
                ON
                    t.id = dt.transaction_id
                WHERE
                    t.customer_id = ?
                AND
                    EXISTS (
                        SELECT 1 FROM  validate_transaction vt WHERE vt.transaction_id = t.id LIMIT 1
                    )
                AND
                    p.product_type = 0
                GROUP BY
                    p.id
                HAVING 
                    COUNT(p.id) >= ?
                ORDER BY
                    COUNT(p.id) DESC
                LIMIT ? 
                OFFSET ?";
        $stmt = $db->prepare($query);
        $offset = $list_query->offset;
        $limit =  $list_query->limit;
        $stmt->bind_param('iiii',$customer_id,$favourite_value, $limit, $offset);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all product : ".$stmt->error;
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
            $one = new product();
            $one->id = $result['id'];
            $p = $one->one($db)->data;
            array_push($all,$p);
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function all_promo($db,$list_query,$customer_id,$current_date) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    p.id as id
                FROM 
                    product p
                WHERE
                    p.product_type = 1
                LIMIT ? 
                OFFSET ?";
        $stmt = $db->prepare($query);
        $offset = $list_query->offset;
        $limit =  $list_query->limit;
        $stmt->bind_param('ii', $limit, $offset);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query-> error = "error at query all product : ".$stmt->error;
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
            $one = new product();
            $one->id = $result['id'];
            if ($this->validate_promo_transaction($db,$one->id,$customer_id,$current_date) && $this->validate_promo_cart($db,$one->id,$customer_id)) {
                $p = $one->one($db)->data;
                array_push($all,$p);
            }
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function validate_promo_transaction($db,$product_id,$customer_id,$current_date) {
        $result_query = true;
        $query = "SELECT 
                    COUNT(*) as result 
                FROM 
                    detail_transaction dt 
                INNER JOIN 
                    transaction t 
                ON 
                    t.id = dt.transaction_id 
                WHERE
                    dt.product_id = ?
                AND
                    t.customer_id = ?
                AND
                    t.transaction_date = ?
                AND
                    EXISTS (
                        SELECT 1 FROM validate_transaction vt WHERE vt.transaction_id = t.id LIMIT 1
                )";
        $stmt = $db->prepare($query);
        $stmt->bind_param('iis',$product_id, $customer_id,$current_date);
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
        $result_query = (int) $result['result'] == 0;
        $stmt->close();
        return $result_query;
    }


    public function validate_promo_cart($db,$product_id,$customer_id) {
        $result_query = true;
        $query = "SELECT 
                    COUNT(*) as result 
                FROM 
                    cart
                WHERE
                    product_id = ?
                AND
                    customer_id = ?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('ii',$product_id, $customer_id);
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
        $result_query = (int) $result['result'] == 0;
        $stmt->close();
        return $result_query;
    }


    public function update($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "UPDATE product SET name = ?,category_id = ?,price = ?,stock = ?,rating = ?,image_url = ?,detail = ?,product_type = ?,default_qty = ?,exp_date = ? WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('siiiissiisi', $this->name,$this->category_id,$this->price,$this->stock,$this->rating,$this->image_url,$this->detail,$this->product_type,$this->default_qty,$this->exp_date,$this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at update one product : ".$stmt->error;
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
        $query = "DELETE FROM product WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at delete one product : ".$stmt->error;
            $result_query->data = "not ok";
            $stmt->close();
            return $result_query;
        }
        $stmt->close();
        return $result_query;
    }
}


?>