
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
               
                        <div class="col-sm-6 col-md-offset-3">
                            <div class="white-box">
                                <?php 
                                    $query = "select * from CustomerOrder where order_date >= '".$_POST ['start_date']."' AND order_date <= '".$_POST['end_date']."'";
                                    $result = $conn->query($query);
                                    $final = $result->fetch();

                                    echo '
                                        <tr>
                                            <th>ID</th>
                                            <th>Order Date</th>
                                            <th>Customer Name</th>
                                            <th>Total Price</th>
                                            <th><center>Total Discounted Price</center></th>
                                        </tr>
                                    ';
                                      
                                    foreach ($result as $record) {
                                        echo '
                                            <tr>
                                                <td>'.$record['ID'].'</td>
                                                <td>'.$record['order_date'].'</td>
                                                <td>'.$record['customer_name'].'</td>
                                                <td class="success"><center><b>'.$record['total_price'].'</b></center></td>
                                                <td class="danger"><center><b>'.$record['total_discounted_price'].'</b></center></td>
                                                <td>'.$record['total_discounted_price'].'</td>
                                            </tr>';
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
