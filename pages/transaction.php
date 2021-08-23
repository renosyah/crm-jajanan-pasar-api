<?php

include_once("model/transaction.php");
include_once("model/db.php");

$transaction = new transaction();
$transactiont_query = (object) ['search_by' => 'ref_id','search_value' => '','order_by' => 'id','order_dir'=> 'asc','offset' => 0,'limit' => 100];
$result_transaction = $transaction->all_basic(get_connection(include("api/config.php")),$transactiont_query);

?>
<div class="row">
    <?php if ($result_transaction->error != ""){ ?>
    <div class="col s12">
        <p class="center" style="height:300px">Kosong</p>
    </div>
    <?php return; } ?>

    <?php foreach ($result_transaction->data as $value) { ?>
        <div class="col s12">
            <div class="card">
                <div class="card-content" style="height:200px">
                    <div class="top right">
                        <p><?php  echo date_format(date_create($value->transaction_date),"Y/m/d") ?></p>
                    </div>
                    <h4><?php echo "Rp ". number_format($value->total,2,",",".") ?></h4>
                    <p><?php  echo "Code Refrensi : ". $value->ref_id ?></p>
                </div>
                <div class="card-action">
                    <a class="waves-effect waves-light btn red darken-1 white-text" style="text-transform:none;"  href="?menu=detail_transaction&transaction_id=<?php echo $value->id ?>">
                        <b>
                            <span>Detail</span>
                        </b>    
                    </a>
                </div>
            </div>
        </div>
    <?php } ?>
</div>