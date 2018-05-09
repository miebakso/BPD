<?php
    require "component/connection.php";

    $name = $_POST['name'];
    $price = $_POST['price'];

    $result = exec_query("exec insert_topping '".$name."',".$price);
    $result->nextRowset();
    
    $final = $result->fetch();

    header('Location: http://localhost/PBD/topping.php?option=active&result='.$final['state']);
    die();
?>