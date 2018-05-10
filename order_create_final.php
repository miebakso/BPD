<html lang="en">

<?php require "component/header.php" ?>
<?php require "component/connection.php" ?>
<?php
    
    $customer_id = exec_query("exec get_last_customer_id");
    //foreach($_POST['topping']as $_top){
        
    //}
?>
<body>
    
    <div id="wrapper">
        <!-- Navigation -->
        <?php require "component/navigation.php" ?>
        <!-- Sidebar -->
        <?php require "component/sidebar.php" ?>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Hitung Order</h4> 
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!--row -->
                <div class="row">
                    <div class="col-12">
                        <div class="white-box">
                            <form method="POST" action="order_create_final.php">
                                <?php 
                                    $topping = implode(',', $_POST['topping']);
                                    echo $topping;
                                    $result = exec_query("exec hitungHargaTotal '$topping'");
                                ?>
                                <div class="row">
                                    <div class="col-md-2"><h3>Total Harga</h3></div>
                                    <div class="col-md-2"><h3><center><?=$result[0]['total']?></center></h3></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h3>Total Diskon</></h3></div>
                                    <div class="row">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Topping</th>
                                                    <th>Harga</th>
                                                    <th>Diskon (%)</th>
                                                    <th>Harga Akhir</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $diskon = exec_multiple_query("exec findPromoMax '$topping'");
                                                //exit(var_dump($diskon));
                                                foreach ($diskon[0] as $hasilDisc){?>
                                                    <tr>
                                                        <td><?= $hasilDisc['name'] ?></td>
                                                        <td><?= $hasilDisc['price'] ?></td>
                                                        <td><?= $hasilDisc['discount'] ?></td>
                                                        <td><?= $hasilDisc['hargaAkhir'] ?></td>
                                                    </tr>
                                                <?php }?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h3>Total Bayar</h3></div>
                                    <div class="col-md-8"><h3><center><?=$diskon[1]['total']?></center></h3></div>
                                </div>
                               <button type="submit" name="optionSetuju" class="btn btn-primary">SETUJU</button>
                               <button type="submit" name="optionTdkSetuju" class="btn btn-primary">TIDAK</button>
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
