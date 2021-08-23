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
            <div class="center card-image" style="height:400px">
                <img src="<?php echo $result_product->data->image_url ?>" style="max-height:800px ">
            </div>
            <div class="card-content">
                <h4><?php echo $result_product->data->name ?></h4>
                <p><?php echo $result_product->data->detail ?></p>
            </div>
            <div class="card-action">
                <!-- <a class="black-text" href="?menu=edit_product&product_id=<?php echo $result_product->data->id ?>">Edit</a> -->
            </div>
        </div>
        <div class="card-panel">
            <table class="responsive-table">
                <thead>
                <tr>
                    <th>Stok Tersedia</th>
                    <th>Total Terjual</th>
                    <th>Tanggal Expire</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td> <?php echo $result_product->data->stock ?> </td>
                    <td><?php 

                            $result_product_sum = $product->sum_sold(get_connection(include("api/config.php")));
                            echo isset($result_product_sum->data->count_sold) ? $result_product_sum->data->count_sold : "0";
                        ?> </td>
                    <td><?php  echo $result_product->data->exp_date ?> </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

