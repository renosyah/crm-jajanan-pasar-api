<?php

session_start();

include("../model/user.php");
include("../model/db.php");

if (!isset($_POST["username"]) || !isset($_POST["password"])){
    header("Location: ../index.php?message=invalid");
    exit;
}

$usr = new user();
$usr->username = $_POST["username"];
$usr->password = $_POST["password"];
$result = $usr->login(get_connection(include("../api/config.php")));
if ($result->error != ""){
    header("Location: ../index.php?message=invalid");
    exit;
}
$_SESSION["session"] = $result->data->id;

header("Location: ../index.php");


?>