<div class="row">
    <?php
        include_once("model/product.php");
        include_once("model/db.php");
        
        $product = new product();
        $product->id = $_GET['product_id'];
        $result_product = $product->one(get_connection(include("api/config.php")));

    ?>
    <?php if (!isset($_GET['product_id']) || $result_product->error != ""){ ?>
    <div class="col s12">
        <p class="center" style="height:300px">Tidak ditemukan</p>
    </div>
    <?php return; } ?>

    <div class="col s12">
        <div class="card">
            <div class="card-image" style="height:400px">
                <img src="<?php echo $result_product->data->image_url ?>" style="max-height:800px ">
            </div>
            <div class="card-content">
                <h4><?php echo $result_product->data->name ?></h4>
                <p><?php echo $result_product->data->detail ?></p>
            </div>
        </div>
        <div class="card-panel">
            <table class="responsive-table">
                <thead>
                <tr>
                    <th>Nilai Rekomendasi</th>
                    <th>Total Terjual</th>
                    <th>Total Penjualan</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td> <?php 
                            $product = new product();
                            $product->id = $_GET['product_id'];

                            $result_product = $product->count_recomended(get_connection(include("api/config.php")));
                            echo $result_product->data->recomended_value;
                        ?> </td>
                    <td><?php 

                            $result_product_sum = $product->sum_sold(get_connection(include("api/config.php")));
                            echo isset($result_product_sum->data->count_sold) ? $result_product_sum->data->count_sold : "0";
                        ?> </td>
                    <td><?php 
                            echo isset($result_product_sum->data->count_sold) ? "Rp ". number_format($result_product_sum->data->sum_sold,2,",",".") : "Rp 0.0";
                        ?> </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

