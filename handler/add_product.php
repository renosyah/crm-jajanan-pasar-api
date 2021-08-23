<?php

include("../model/product.php");
include("../model/db.php");
include("../util/generator.php");

if (!isset($_POST["name"]) || !isset($_POST["price"]) || !isset($_POST["detail"]) || !isset($_POST["stock"])|| !isset($_POST["exp_date"])){
    header("Location: ../index.php?message=invalid form");
    exit;
}

$file_name		 = $_FILES['file']['name'];
$tmp_file	 	 = $_FILES['file']['tmp_name'];
$type_file		 = $_FILES['file']['type'];
$file_size		 = $_FILES['file']['size'];

$maxsize_file = 1000000;
$allowed_ext =  array('image/png', 'image/jpg','image/jpeg');

if ($file_size > $maxsize_file) {
    header("Location: ../index.php?message=invalid size");
	exit;
}

$ext = pathinfo($file_name, PATHINFO_EXTENSION);
$rand_file_name = generate_random_string(10).".".$ext;

$dir_file = "../img/".$rand_file_name;
$move = move_uploaded_file($tmp_file, $dir_file);
if (!$move){
    header("Location: ../index.php?message=failed upload");
	exit;
}

$usr = new product();
$usr->id = 0;
$usr->category_id = 1;
$usr->name = $_POST["name"];
$usr->price = $_POST["price"];
$usr->stock = $_POST["stock"];
$usr->exp_date = $_POST["exp_date"];
$usr->rating = 0;
$usr->image_url = "/img/".$rand_file_name;
$usr->detail = $_POST["detail"];
$usr->product_type = 0;
$usr->default_qty = 1;
$result = $usr->add(get_connection(include("../api/config.php")));
if ($result->error != ""){
    header("Location: ../index.php?message=invalid product");
    exit;
}

header("Location: ../index.php");

?>