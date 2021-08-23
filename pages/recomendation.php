<?php

include_once("model/product.php");
include_once("model/db.php");

$recomended = new product();
$recomended_query = (object) ['recomended_value'=> 3,'category_id' => 1,'offset' => 0,'limit' => 100];
$result_recomended = $recomended->all_recomended(get_connection(include("api/config.php")),$recomended_query,$recomended_query->recomended_value);

?>
<div class="row">
    <?php if ($result_recomended->error != ""){ ?>
    <div class="col s12">
        <p class="center" style="height:300px">Kosong</p>
    </div>
    <?php return; } ?>

    <?php foreach ($result_recomended->data as $value) { ?>
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-image" style="height:300px">
                    <img src="<?php echo $value->image_url ?>" width="200" hight="100">
                </div>
                <div class="card-content"  style="height:100px">
                    <h4><?php echo $value->name ?></h4>
                   
                </div>
                <div class="card-action">
                    <a class="black-text" href="?menu=detail_recomendation&product_id=<?php echo $value->id ?>">Detail</a>
                </div>
            </div>
        </div>
    <?php } ?>
</div>
    