<?php
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];

    $result = $conn->query("select datediff('$start_date','$end_date')");
    $result->nextRowset();
    
    if($result<0){
        $state = 'SHOW failed! because end date less than start date';
    }
    else{
        $state = 'SUCCESS!';
    }

    header('Location: http://localhost/PBD/index.php?&result='.$state);
    die();
?>