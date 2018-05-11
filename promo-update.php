<html lang="en">

<?php require "component/header.php" ?>

<body>
    
    <div id="wrapper">
        <!-- Navigation -->
        <?php require "component/navigation.php" ?>
        <!-- Sidebar -->
        <?php require "component/sidebar.php" ?>

        <?php require "component/connection.php" ?>
        
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Promo</h4> 
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <?php 
                    $res = exec_query("exec select_promo_by_id ".$_GET['id']);
                    $result = $res[0];                
                ?>
                <!--row -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="white-box">
                            <form method="post" action="promo_update.php">
                                <div class="row">
                                    <?php
                                    echo '
                                        <input type="hidden" name="ID" value="'.$_GET['id'].'">

                                        <div class="col-md-12" style="margin-bottom: 20px;">
                                            <input type="text" name="name" value="'.$result['name'].'" class="form-control" placeholder="Promo Name">  
                                        </div>
                        
                                        <div class="col-md-12" style="margin-bottom: 20px;">
                                            <input type="number" name="discount" value="'.$result['discount'].'" class="form-control" placeholder="Discount">
                                        </div>
                                    ';
                                    ?>
                                    <div class="col-md-12" style="margin-bottom: 20px;">
                                        <select class="form-control" name='promo_status' >
                                            <?php 
                                                if($result['promo_status']==1){
                                                    echo "<option selected value='1'>Active</option>";
                                                    echo "<option value='0'>Inactive</option>";
                                                } else {
                                                    echo "<option value='1'>Active</option>";
                                                    echo "<option selected value='0'>Inactive</option>";
                                                }
                                            ?>
                                        </select>
                                    </div>
                                    <center>
                                        <button class="btn btn-success btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">UPDATE</button>
                                    </center>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="white-box">
                            <table class="table table-striped">
                                <tr>
                                    <th colspan="2">Current Promo Toppings </th>
                                </tr>
                                <?php
                                    $res = exec_query("exec select_topping_by_promo_id ".$_GET['id']);
                                    foreach($res as $topping){
                                        echo '
                                            <tr>
                                                <td class="col-md-9">'.$topping["name"].'</td>
                                                <td class="col-md-3">
                                                    <form action="promo_topping_remove.php" method="post">
                                                        <input type="hidden" name="promo_id" value="'.$result['ID'].'">
                                                        <input type="hidden" name="topping_id" value="'.$topping['ID'].'">
                                                        <center><button class="btn btn-danger btn-rounded pull-left"><i class="fa fa-times" aria-hidden="true"></i></button></center>
                                                    </form>
                                                </td>
                                            </tr>
                                        ';
                                    }
                                ?>
                            </table>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="white-box">
                            <h4>Add More Toppings</h3>
                            <form method="post" action="promo_topping_add.php">
                                <div class="row">
                                    <?php
                                        echo '<input type="hidden" name="ID" value="'.$_GET['id'].'">';
                                    ?>
                                    <select multiple class="form-control" name='topping_ids[]' size="15" style="margin-bottom: 20px;">
                                        <?php 
                                            $result = exec_query("exec select_topping 'active' ");
                                            foreach ($result as $topping){
                                                echo "<option  value='".$topping['ID']."'>".$topping['name']."</option>";
                                            }
                                        ?>
                                    </select>
           
                                    <center>
                                        <button class="btn btn-success btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">ADD</button>
                                    </center>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2018 &copy; P - Mie </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper 12321321-->
    <!-- jQuery -->
    <?php require "component/script.php" ?>
</body>

</html>
