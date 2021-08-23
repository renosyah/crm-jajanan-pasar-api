<?php

include("../model/product.php");
include("../model/db.php");

if (!isset($_POST["product_id"]) || !isset($_POST["name"]) || !isset($_POST["price"]) || !isset($_POST["detail"]) || !isset($_POST["stock"])|| !isset($_POST["exp_date"])){
    header("Location: ../index.php?message=invalid form");
    exit;
}

$usr = new product();
$usr->id = $_POST["product_id"];
$result = $usr->one(get_connection(include("../api/config.php")));
if ($result->error != ""){
    header("Location: ../index.php?message=invalid product");
    exit;
}

$usr = $result->data;

$usr->name = $_POST["name"];
$usr->price = $_POST["price"];
$usr->detail = $_POST["detail"];
$usr->stock = $_POST["stock"];
$usr->exp_date = $_POST["exp_date"];

$result_update = $usr->update(get_connection(include("../api/config.php")));
if ($result_update->error != ""){
    header("Location: ../index.php?message=invalid product");
    exit;
}

header("Location: ../index.php");

?>