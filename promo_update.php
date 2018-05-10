<?php
	require "component/connection.php"; 
	$result = exec_query("exec update_promo_by_id ".$_POST['ID'].",'".$_POST['name']."',".$_POST['discount'].",".$_POST['promo_status']);
	header('Location: http://localhost/PBD/promo-update.php?id='.$_POST['ID']);
    die();
?>