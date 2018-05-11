<?php
	require "component/connection.php"; 
	$result = exec_query("exec insert_promo '".$_POST['name']."',".$_POST['discount']);
	$p_id = $result[0]['ID'];
	$topping_ids = $_POST['topping_ids'];
	foreach ($topping_ids as $id) {
		exec_query("exec insert_promo_topping ".$p_id.",".$id);
	}

	header('Location: http://localhost/PBD/promo.php');
    die();
?>