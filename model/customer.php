<?php

// menggabungkan kode dari file result_query.php
// yg mana result_query digunakan sebagai
// object yg digunakan untuk hasil
include_once("result_query.php");

class customer {
    public $id;
    public $name;
    public $username;
    public $email;
    public $password;

    public function __construct(){
    }

    public function set($data){
        $this->id = (int) $data->id;
        $this->name = $data->name;
        $this->username = $data->username;
        $this->email =  $data->email;
        $this->password = $data->password;
    }

    public function add($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "INSERT INTO customer (name,username,email,password) VALUES (?,?,?,?)";
        $stmt = $db->prepare($query);
        $stmt->bind_param('ssss', $this->name, $this->username, $this->email, $this->password);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error =  "error at add new customer : ".$stmt->error;
            $result_query->data = "not ok";
        }
        $stmt->close();
        return $result_query;
    }
    
    public function one($db) {
        $result_query = new result_query();
        $one = new customer();
        $query = "SELECT id,name,username,email,password FROM customer WHERE id=? LIMIT 1";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();      
        if ($stmt->error != ""){
            $result_query-> error = "error at query one customer: ".$stmt->error;
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
        $one->name = $result['name'];
        $one->username = $result['username'];
        $one->email = $result['email'];
        $one->password = $result['password'];
        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }
 
    public function one_by_email($db) {
        $result_query = new result_query();
        $one = new customer();
        $query = "SELECT id,name,username,email,password FROM customer WHERE email=? LIMIT 1";
        $stmt = $db->prepare($query);
        $stmt->bind_param('s', $this->email);
        $stmt->execute();      
        if ($stmt->error != ""){
            $result_query-> error = "error at query one customer: ".$stmt->error;
            $stmt->close();
            return $result_query;
        }
        $rows = $stmt->get_result();
        if($rows->num_rows == 0){
            $result_query->error = "username or password invalid";
            $stmt->close();
            return $result_query;
        }
        $result = $rows->fetch_assoc();
        $one->id = $result['id'];
        $one->name = $result['name'];
        $one->username = $result['username'];
        $one->email = $result['email'];
        $one->password = $result['password'];
        $result_query->data = $one;
        $stmt->close();
        return $result_query;
    }

    public function all($db,$list_query) {
        $result_query = new result_query();
        $all = array();
        $query = "SELECT 
                    id,name,username,email,password
                FROM 
                    customer
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
            $result_query-> error = "error at query all kota : ".$stmt->error;
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
            $one = new customer();
            $one->id = $result['id'];
            $one->name = $result['name'];
            $one->username = $result['username'];
            $one->email = $result['email'];
            $one->password = $result['password'];
            array_push($all,$one);
        }
        $result_query->data = $all;
        $stmt->close();
        return $result_query;
    }

    public function update($db) {
        $result_query = new result_query();
        $result_query->data = "ok";
        $query = "UPDATE customer SET name = ?,username = ?,email = ?,password = ? WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('ssssi', $this->name, $this->username, $this->email, $this->password,$this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at update one customer : ".$stmt->error;
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
        $query = "DELETE FROM customer WHERE id=?";
        $stmt = $db->prepare($query);
        $stmt->bind_param('i', $this->id);
        $stmt->execute();
        if ($stmt->error != ""){
            $result_query->error = "error at delete one customer : ".$stmt->error;
            $result_query->data = "not ok";
            $stmt->close();
            return $result_query;
        }
        $stmt->close();
        return $result_query;
    }
}


?>