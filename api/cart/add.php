<?php 

header("Content-Type: application/json; charset=UTF-8");
include_once "../handler.php";

// menggabungkan kode dari file kota.php
// yg mana model kota dibutuhkan
// untuk query
include("../../model/cart.php");

// menggabungkan kode dari file db.php
// yg mana db digunakan untuk memanggil koneksi
// ke database
include("../../model/db.php");


// fungsi yg akan dipanggil untuk
// menghandle request yg dikirim client
$data = handle_request();

$usr = new cart();
$usr->set($data);

$check = $usr->one_by_product(get_connection(include("../config.php")));
if ($check->data != null){
    $check->data->quantity += $usr->quantity;
    $check->data->sub_total = $check->data->quantity * $check->data->price;
    $usr->set($check->data);
    $result = $usr->update(get_connection(include("../config.php")));

    echo json_encode($result, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
    exit;
}

$result = $usr->add(get_connection(include("../config.php")));

echo json_encode($result, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
?>