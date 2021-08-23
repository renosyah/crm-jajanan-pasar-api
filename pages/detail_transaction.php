<div class="row">
    <?php
        include_once("model/transaction.php");
        include_once("model/detail_transaction.php");
        include_once("model/validate_transaction.php");
        include_once("model/product.php");
        include_once("model/db.php");
        
        $transaction = new transaction();
        $transaction->id = $_GET['transaction_id'];
        $result_transaction = $transaction->one(get_connection(include("api/config.php")));

        $detail_transaction = new detail_transaction();
        $detail_transactiont_query = (object) ['search_by' => 'id','search_value' => '','order_by' => 'id','order_dir'=> 'asc','offset' => 0,'limit' => 100];
        $result_detail_transaction = $detail_transaction->all(get_connection(include("api/config.php")),$detail_transactiont_query,$_GET['transaction_id']);

        $validate_transaction = new validate_transaction();
        $validate_transaction_query = (object) ['search_by' => 'id','search_value' => '','order_by' => 'id','order_dir'=> 'asc','offset' => 0,'limit' => 100];
        $result_validate_transaction = $validate_transaction->all(get_connection(include("api/config.php")),$validate_transaction_query,$_GET['transaction_id']);

    ?>
    <?php if (!isset($_GET['transaction_id']) || $result_transaction->error != ""){ ?>
    <div class="col s12">
        <p class="center" style="height:300px">Tidak ditemukan</p>
    </div>
    <?php return; } ?>

    <div class="col s12">
        <div class="card">
            <div class="card-image" style="height:100px">
            <span class="card-title red-text"> </span>
            </div>
            <div class="card-content" style="height:200px">
                <div class="top right">
                    <p><?php echo date_format(date_create($result_transaction->data->transaction_date),"Y/m/d") ?></p>
                </div>
                <h4><?php echo "Rp ". number_format($result_transaction->data->total,2,",",".") ?></h4>
                <p><?php echo "Code Refrensi : ".$result_transaction->data->ref_id ?></p>
                <p><?php echo "Alamat COD : ". ($result_transaction->data->address == "" ? "-" : $result_transaction->data->address) ?></p>
            </div>
        </div>
        <div class="card-panel">
            <?php if ($result_detail_transaction->error != "") { ?>
            <div class="col s12">
                <p class="center" style="height:300px">Detail Product dibeli Tidak ditemukan</p>
            </div>
            <?php return; } ?>
            <table class="responsive-table">
                <thead>
                <tr>
                    <th>Produk</th>
                    <th>Harga</th>
                    <th>Kuantitas</th>
                    <th>Sub total</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach($result_detail_transaction->data as $value){ ?>
                    <tr>
                        <td> <?php 
                            $product = new product();
                            $product->id = $value->product_id;
                            $result_product = $product->one(get_connection(include("api/config.php")));
                            echo $result_product->data->name;

                        ?> </td>
                        <td> <?php echo "Rp ". number_format($value->price,2,",",".")?> </td>
                        <td> <?php echo $value->quantity ?> </td>
                        <td> <?php echo "Rp ". number_format($value->sub_total,2,",",".")?> </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
        <div class="card-panel">
            <?php if ($result_validate_transaction->error != "") { ?>
            <div class="col s12">
                <p class="center" style="height:300px">Validasi gambar bukti Tidak ditemukan</p>
            </div>
            <?php return; } ?>
            <table class="responsive-table">
                <thead>
                <tr>
                    <th>Bukti</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach($result_validate_transaction->data as $value){ ?>
                    <tr>
                        <td> <img src="<?php echo "https://japas-api.000webhostapp.com" . $value->image_url ?>" width="200" hight="100"> </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

