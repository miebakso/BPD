<?php
	require "component/connection.php";
	
	
	$id = $_POST['id'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $status = $_POST['status'];

	$result = $conn->query("exec update_topping ".$id.",'".$name."',".$price.",".$status);
    $result->nextRowset();
    
    $final = $result->fetch();
    header('Location: http://localhost/PBD/topping-update.php?id='.$id.'&result='.$final['state']);
    die();

?>