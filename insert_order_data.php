<?php
    require "component/connection.php";

    $name = $_POST['customer_name'];
    $total_price = $_POST['total_price'];
    $total_discounted = $_POST['total_discounted'];

    $result = exec_query("exec insert_customerOrder '".$name."',".$total_price.",".$total_discounted);
    //exit(var_dump($result));

    $id = $result[0]['ID'];

    $topping_id = $_POST['topping_id'];
    $topping_price = $_POST['topping_price'];
    $topping_discount = $_POST['topping_discount'];
    // exit(var_dump($topping_id));

    $i = 0;
    $length = sizeof($topping_id);
    //exit(var_dump($length));
    for($i = 0 ; $i < $length; $i++){
        if($topping_discount[$i] == null){
            $topping_discount[$i] = 0;
        }
        echo $id.",".$topping_id[$i].",".$topping_price[$i].",".$topping_discount[$i]."</br>";
        exec_query("exec insert_orderTopping '".$id."',".$topping_id[$i].",".$topping_price[$i].",".$topping_discount[$i]);
    }

    header('Location: http://localhost/PBD/order.php');
    die();
?>