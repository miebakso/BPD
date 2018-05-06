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
                        <h4 class="page-title">Topping</h4> 
                    </div>
                </div>

                <!--row -->
                <div class="row">
               
                        <div class="col-sm-6 col-md-offset-3">
                            <div class="white-box">
                                <?php 
                                    if(!empty($_GET['result'])){
                                        echo '
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                          <strong>'.$_GET['result'].'</strong>
                                        </div>
                                        ';
                                    }
                                ?>
                                <?php 
                                    if(empty($_GET['id'])){
                                        echo '
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                          <strong>No such topping found</strong>
                                        </div>
                                        ';
                                    } else {
                                        $result = $conn->query("exec find_topping_by_id ".$_GET['id']);
                                        $final = $result->fetch();

                                        echo ' 
                                            <center>
                                                <form action="topping_update.php"  method="post" style="margin-bottom: 0px;">
                                                    <input type="hidden" name="id" value="'.$_GET['id'].'">

                                                    <div class="input-group col-md-12" >
                                                        <input type="text" class="form-control" name="name" placeholder="Topping Name" value="'.$final['name'].'">
                                                    </div>

                                                    <div class="input-group col-md-12" style="margin-top: 20px;">
                                                        <input type="number" class="form-control" name="price" placeholder="Topping Price" value="'.$final['price'].'">
                                                    </div>
                                                  
                                                    <select  class="form-control col-md-12" name="status" style="margin-top: 20px;">
                                        ';
                                                        if($final['status']==1){
                                                            echo '<option value="1" selected>Active</option>';
                                                            echo '<option value="0">Inactive</option>';
                                                        } else {
                                                            echo '<option value="1">Active</option>';
                                                            echo '<option value="0" selected>Inactive</option>';
                                                        }
                                        echo '      
                                                    </select>
                                                    
                                                    <button class="btn btn-success btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light" style="margin-top: 20px;">UPDATE</button>
                                                </form>
                                            </center>
                                        ';
                                    } 
                                ?>
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
