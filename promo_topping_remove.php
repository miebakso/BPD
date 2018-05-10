<?php
	require "component/connection.php"; 
	$result = exec_query("exec delete_promo_topping ".$_POST['promo_id'].",".$_POST['topping_id']);
	header('Location: http://localhost/PBD/promo-update.php?id='.$_POST['promo_id']);
    die();
?>