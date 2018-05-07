
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
                        <h4 class="page-title">DETAIL REPORT</h4> 
                    </div>
                </div>

                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <table class="table table-striped">
                            <?php 
                                $query = "exec show_customer_order '".$_POST['start_date']."' , '".$_POST['end_date']."'";
                                echo $query;
                                $result = $conn->query($query);
                                

                                echo '
                                    <tr>
                                        <th class="col-md-1"><center>ID</center></th>
                                        <th class="col-md-2"><center>Order Date</center></th>
                                        <th class="col-md-2"><center>Customer Name</center></th>
                                        <th class="col-md-2"><center>Total Price</center></th>
                                        <th class="col-md-2"><center>Discount</center></th>
                                    </tr>
                                ';
                                    
                                foreach ($result as $record) {
                                    echo '
                                        <tr>
                                            <td><center>'.$record['ID'].'</center></td>
                                            <td><center>'.$record['order_date'].'</center></td>
                                            <td><center>'.$record['customer_name'].'</center></td>
                                            <td class="success"><center><b>'.$record['total_price'].'</b></center></td>
                                            <td class="danger"><center><b>'.$record['total_discounted_price'].'</b></center></td>
                                        </tr>';
                                }/**
                                $query = "exec hitungPendapatan '".$_POST['start_date']."' , '".$_POST['end_date']."'";
                                $temp = $conn->query($query);
                                $res = $temp->fetch();*/
                                echo '<tr>
                                    <td class="col-md-5 secondary"><b>Total price</b></td>
                                    <td class="col-md-2 secondary"><b>'.$res['total'].'</b></td>
                                </tr>' ;
                                echo '<tr>
                                    <td class="col-md-5 secondary"><b>Total discount</b></td>
                                    <td class="col-md-2 secondary"><b>'.$res['discount'].'</b></td>
                                </tr>' ;
                                echo '<tr>
                                    <td class="col-md-5 secondary"><b>Total profit</b></td>
                                    <td class="col-md-2 secondary"><b>'.$res['total_profit'].'</b></td>
                                </tr>' ;
                                
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
