<?php
    include_once("model/product.php");
    include_once("model/db.php");
    
    $product = new product();
    $product->id = $_GET['product_id'];
    $result_product = $product->one(get_connection(include("api/config.php")));

?>
<div class="row">
    <?php if (!isset($_GET['product_id']) || $result_product->error != ""){ ?>
        <div class="col s12">
            <p class="center" style="height:300px">Tidak ditemukan</p>
        </div>
    <?php return; } ?>
    <div class="col s12">
        <form action="../handler/edit_product.php" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="input-field col s6">
                    <input type="hidden" name="product_id" value="<?php echo $_GET['product_id'] ?>">
                    <input type="text" class="validate" placeholder="Nama Produk" name="name" value="<?php echo $result_product->data->name ?>">
                </div>
                <div class="input-field col s6">
                    <input type="number" class="validate" placeholder="Harga Satuan" name="price" value="<?php echo $result_product->data->price ?>">
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input type="text" class="validate" placeholder="Detail" name="detail" value="<?php echo $result_product->data->detail ?>">
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <h5>Stok Produk</h5>
                </div>
                <div class="input-field col s6">
                    <h5>Tanggal Expired Produk</h5>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <input type="number" class="validate" placeholder="Stok" name="stock" value="<?php echo $result_product->data->stock ?>">
                </div>
                <div class="input-field col s6">
                    <input type="date" class="validate" placeholder="Tanggal Expire" name="exp_date" value="<?php echo $result_product->data->exp_date ?>">
                </div>
            </div>
            <div class="center card-action">
                <br /><br />
                <button class="waves-effect waves-light btn-large btn red darken-1 white-text" style="text-transform:none;width:98%;" type="submit">
                    <b>
                        <span>Simpan</span>
                    </b>    
                </button>
            </div>
        </form>
    </div>
</div>