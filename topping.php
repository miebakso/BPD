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
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="topping.php?option=all" class="btn btn-info pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">ALL</a> 
                        <a href="topping.php?option=active" class="btn btn-success pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">ACTIVE</a>
                        <a href="topping.php?option=inactive" class="btn btn-danger pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">INACTIVE</a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
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
                            
                                <form action="topping_create.php" class="form-inline" method="post" style="margin-bottom: 0px;">
                                    <div class="input-group col-md-4" >
                                        <input type="text" class="form-control" name="name" placeholder="Topping Name" aria-describedby="topping name">
                                    </div>

                                    <div class="input-group col-md-4">
                                        <input type="number" class="form-control" name="price" placeholder="Topping Price" aria-describedby="price">
                                    </div>
        
                                    <button class="btn btn-success btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">CREATE</button>
                                </form>
                           
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <table class="table table-striped">
                                <?php 
                                $result = exec_query("exec select_topping '".$_GET['option']."'");
                                echo '
                                    <tr>
                                        <th>Name</th>
                                        <th>price</th>
                                        <th class="col-md-2"><center>status</center></th>
                                        <th class="col-md-2"><center>Edit</center></td>
                                    </tr>
                                ';
                                
                                    
                                foreach ($result as $topping) {
                                    echo '
                                        <tr>
                                            <td>'.$topping['name'].'</td>
                                            <td>'.$topping['price'].'</td>';
                                        if($topping['status']==1) {
                                            echo '<td class="success"><center><b>Active</b></center></td>';
                                        } else {
                                            echo '<td class="danger"><center><b>Inactive</b></center></td>';
                                        }
                                        echo '
                                            
                                            <td>
                                                <a href="topping-update.php?id='.$topping['ID'].'">
                                                    <center><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></center>
                                                </a>
                                            </td>
                                        </tr>
                                    ';
                                }
                                     
                                ?>
                            </table>
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
