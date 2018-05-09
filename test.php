<?php
    require "component/connection.php";

   

    $result = exec_query("exec update_topping ".$id.",'".$name."',".$price.",".$status);
    $result->nextRowset();
    
    $final = $result->fetch();

    header('Location: http://localhost/PBD/topping.php?option=active&result='.$final['state']);
    die();
?>