<?php

include_once("model/user.php");
include_once("model/db.php");

$user = new user();
$usert_query = (object) ['search_by' => 'username','search_value' => '','order_by' => 'id','order_dir'=> 'asc','offset' => 0,'limit' => 100];
$result_user = $user->all(get_connection(include("api/config.php")),$usert_query);

?>
<div class="fixed-action-btn">
    <a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
</div>
<div class="row">
    <?php if ($result_user->error != ""){ ?>
    <div class="col s12">
        <p class="center" style="height:300px">Kosong</p>
    </div>
    <?php return; } ?>

    <?php foreach ($result_user->data as $value) { ?>
        <div class="col s12 m6 l3">
            <div class="card">
                <div class="card-content">
                    <h4><?php echo $value->name ?></h4>
                    <p><?php echo $value->username ?></p>
                </div>
                <div class="card-action">
                    <!-- <a class="black-text" href="#">Edit</a> -->
                    <!-- <a class="red-text" href="#">Delete</a> -->
                </div>
            </div>
        </div>
    <?php } ?>
</div>