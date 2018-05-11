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
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="promo.php?option=all" class="btn btn-info pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">ALL</a> 
                        <a href="promo.php?option=active" class="btn btn-success pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">ACTIVE</a>
                        <a href="promo.php?option=inactive" class="btn btn-danger pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">INACTIVE</a>

                        <a href="promo-create.php" class="btn btn-success pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">CREATE</a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <table class="table table-striped">
                            <?php
                                $result = exec_query("exec select_promo '".$_GET['option']."'");
                       
                                echo '
                                    <tr>
                                        <th>Name</th>
                                        <th class="col-md-3">Discount</th>
                                        <th class="col-md-2"><center>Status</center></th>
                                        <th class="col-md-2"><center>Edit</center></td>
                                    </tr>
                                ';
                                
                                    
                                foreach ($result as $promo) {
                                    echo '
                                        <tr>
                                            <td>'.$promo['name'].'</td>
                                            <td>'.$promo['discount'].'</td>';
                                        if($promo['promo_status']==1) {
                                            echo '<td class="success"><center><b>Active</b></center></td>';
                                        } else {
                                            echo '<td class="danger"><center><b>Inactive</b></center></td>';
                                        }
                                        echo '
                                            
                                            <td>
                                                <a href="promo-update.php?id='.$promo['ID'].'">
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
