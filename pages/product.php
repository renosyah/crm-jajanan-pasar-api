<?php

include_once("model/product.php");
include_once("model/db.php");

$product = new product();
$product_query = (object) ['category_id' => 1,'search_by' => 'name','search_value' => '','order_by' => 'name','order_dir'=> 'asc','offset' => 0,'limit' => 11];
$result_product = $product->all(get_connection(include("api/config.php")),$product_query,$product_query->category_id);

?>
<div class="fixed-action-btn">
    <a class="btn-floating btn-large waves-effect waves-light red" href="?menu=add_product"><i class="material-icons">add</i></a>
</div>
<div class="row">
    <?php if ($result_product->error != ""){ ?>
    <div class="col s12">
        <p class="center" style="height:300px">Kosong</p>
    </div>
    <?php return; } ?>

    <?php foreach ($result_product->data as $value) { ?>
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-image">
                    <img src="<?php echo $value->image_url ?>" width="200" hight="100">
                </div>
                <div class="card-content">
                    <h4><?php echo $value->name ?></h4>
                    <p><?php echo $value->detail ?></p>
                </div>
                <div class="card-action">
                    <a class="black-text" href="?menu=detail_product&product_id=<?php echo $value->id ?>">Detail</a>
                    <a class="black-text" href="?menu=edit_product&product_id=<?php echo $value->id ?>">Edit</a>
                </div>
            </div>
        </div>
    <?php } ?>
</div>
