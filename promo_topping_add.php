<?php
	require "component/connection.php"; 
	$topping_ids = $_POST['topping_ids'];
	foreach ($topping_ids as $id) {
		exec_query("exec insert_promo_topping ".$_POST['ID'].",".$id);
	}

	header('Location: http://localhost/PBD/promo-update.php?id='.$_POST['ID']);
    die();
?>
