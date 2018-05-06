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
                        <h4 class="page-title">Report</h4> </div>
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
                            
                                <form action="show_current_info.php" class="form-inline" method="post" style="margin-bottom: 0px;">
                                    <div class="input-group col-md-4" >
                                        <input type="date" class="form-control" name="start_date">
                                    </div>

                                    <div class="input-group col-md-4">
                                        <input type="date" class="form-control" name="end_date">
                                    </div>
        
                                    <button class="btn btn-success btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">SHOW</button>
                                </form>
                           
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <table class="table table-striped">
                                <?php 
                                $result = $conn->query("exec show_profit");
                                echo '
                                    <tr>
                                        <th>Year</th>
                                        <th>Month</th>
                                        <th class="col-md-5"><center>total</center></th>
                                    </tr>
                                ';
                                
                                $prev_profit = -1;    
                                foreach ($result as $record) {
                                    echo '
                                    <tr>
                                        <td>'.$record['year'].'</td>
                                        <td>'.$record['name_of_month'].'</td>';

                                    if($prev_profit==-1){
                                        echo '<td class="success"><center><b>'.$record['profit'].'</b></center></td>';
                                    }else{
                                        if($prev_profit<$record['profit']){
                                            echo '<td class="success"><center><b>'.$record['profit'].'</b></center></td>';
                                        }else{
                                            echo '<td class="danger"><center><b>'.$record['profit'].'</b></center></td>';
                                        }
                                    }
                                    echo '</tr>';
                                    $prev_profit = $record['profit'];
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
