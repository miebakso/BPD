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
                        <h4 class="page-title">Order</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> 
                        <a href="order_create.php" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">CREATE</a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">Recent sales</h3>
                            <div class="table-responsive">
                                <?php 
                                    $result = $conn->query("exec findOrderDetail ".$_GET['order_id']);
                                    $no = 1;
                                ?>
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Topping</th>
                                            <th>Harga Saat Order</th>
                                            <th>Discont Saat Order (%)</th>
                                            <th>Harga Akhir</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($result as $order){ ?>
                                            <tr>
                                                <td class="txt-oflo"><?= $no++ ?></td>
                                                <td><?= $order['name'] ?></td>
                                                <td class="txt-oflo"><?= $order['topping_price'] ?></td>
                                                <td><span class="text-success"><?= $order['discount'] ?></span></td>
                                                <td><?= $order['topping_price']-($order['topping_price']*$order['discount']/100) ?></td>
                                            </tr>
                                        <?php }?>
                                    </tbody>
                                </table> <a href="#">Check all the sales</a> 
                            </div>
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
