<?php

include_once("model/user.php");
include_once("model/db.php");

$usr = new user();
$usr->id = $_SESSION["session"];
$result = $usr->one(get_connection(include("api/config.php")));
if ($result->error != ""){
    header("Location: /index.php?message=user not found");
    exit;
}
$name = "Login As : ".$result->data->name;

?>

<nav class="red darken-1" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo"></a>
        <ul class="right hide-on-med-and-down">
        <li><a><?php echo $name; ?></a></li>
        </ul>

        <ul id="nav-mobile" class="sidenav">
        <li><a><?php echo $name; ?></a></li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><?php echo $name; ?></a>
    </div>
</nav>
<div class="row">
    <div class="col s12 m4 l3">
        <div id="menu">
            <ul class="collapsible expandable">
                <li>
                    <div class="collapsible-header"><i class="material-icons">arrow_drop_down</i>
                        <h6> Dashboard </h6>
                    </div>
                    <div class="collapsible-body"><span>
                        <a href="?menu=recomendations">Laporan Rekomendasi</a>
                    </span></div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">arrow_drop_down</i>
                        <h6> Produk</h6>
                    </div>
                    <div class="collapsible-body"><span>
                        <a href="?menu=products">Daftar Produk</a>
                    </span>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">arrow_drop_down</i>
                        <h6> Transaksi</h6>
                    </div>
                    <div class="collapsible-body"><span>
                        <a href="?menu=transactions">Daftar Transaksi</a>
                    </span>
                    </div>
                </li>
                <li>
                    <div class="collapsible-header"><i class="material-icons">arrow_drop_down</i>
                        <h6> Pengguna</h6>
                    </div>
                    <div class="collapsible-body"><span>
                        <a href="?menu=users">Daftar Pengguna</a>
                    </span></div>
                    <div class="collapsible-body"><span>
                        <a href="/handler/logout_action.php">Logout</a>
                        </span></div>
                </li>
            </ul>
        </div>
    </div>
    <div class="col s12 m8 l9">
        <div id="container" style="min-height:800px">
            <div id="content">

            <?php
            
            $menu = "";
            if (isset($_GET['menu']) && !empty($_GET['menu'])) {
                $menu = $_GET['menu'];

                if ($menu == "recomendations"){
                    echo "<h2> Produk Rekomendasi </h2>";
                    include_once "pages/recomendation.php";

                } else if ($menu == "products"){
                    echo "<h2> Daftar Produk </h2>";
                    include_once "pages/product.php";

                } else if ($menu == "transactions"){
                    echo "<h2> Daftar Transaksi </h2>";
                    include_once "pages/transaction.php";

                } else if ($menu == "users"){
                    echo "<h2> Pengguna </h2>";
                    include_once "pages/user.php";

                } else if ($menu == "detail_recomendation"){
                    echo "<h2> Detail Produk Rekomendasi</h2>";
                    include_once "pages/detail_recomendation.php";

                } else if ($menu == "detail_product"){
                    echo "<h2> Detail Produk </h2>";
                    include_once "pages/detail_product.php";

                } else if ($menu == "detail_transaction"){
                    echo "<h2> Detail Transaksi </h2>";
                    include_once "pages/detail_transaction.php";

                } else if ($menu == "add_product"){
                    echo "<h2> Tambah Produk </h2>";
                    include_once "pages/add_product.php";

                } else if ($menu == "edit_product"){
                    echo "<h2> Edit Produk </h2>";
                    include_once "pages/edit_product.php";

                } else {
                    header("location: /index.php?message=menu tidak ditemukan");
                    exit;
                }

            } else {
            ?>

                <br><br>
                    <h1 class="header center red-text">Selamat Datang <?php echo $result->data->name; ?></h1>
                    <div class="row center">
                    <h5 class="header col s12 light">ini adalah portal admin untuk aplikasi jajanan pasar</h5>
                    </div>
                    <br><br>

            <?php  } ?>
            </div>
        </div>
    </div>
</div>
