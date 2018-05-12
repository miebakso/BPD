<html lang="en">

<?php require "component/header.php" ?>
<?php require "component/connection.php" ?>

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
                            <form id= "form_order_confirmation" method="POST" action="insert_order_data.php">
                                <?php 
                                    $topping = implode(',', $_POST['topping']);
                                    //echo $topping;
                                    $result = exec_query("exec hitungHargaTotal '$topping'");
                                ?>
                                <div class="row">
                                    <div class="col-md-2"><h3>Total Harga</h3></div>
                                    <div class="col-md-2"><h3><center><?=$result[0]['total']?></center></h3></div>
                                    <input type="hidden" name= "total_price" value=<?= $result[0]['total'] ?>>
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
                                                        <input type="hidden" name="topping_id[]" value="<?= $hasilDisc['idTopping']?>">
                                                        <td><?= $hasilDisc['price'] ?></td>
                                                        <input type="hidden" name="topping_price[]" value="<?= $hasilDisc['price']?>">
                                                        <td><?= $hasilDisc['discount'] ?></td>
                                                        <input type="hidden" name="topping_discount[]" value="<?= $hasilDisc['discount']?>">
                                                        <td><?= $hasilDisc['hargaAkhir'] ?></td>
                                                    </tr>
                                                <?php }?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4"><h3>Total Bayar</h3></div>
                                    <div class="col-md-8"><h3><center><?=$diskon[1][0]['total']?></center></h3></div>
                                    <input type="hidden" name= "total_discounted" value=<?= $diskon[1][0]['total'] ?>>
                                </div>
                                <input type="hidden" name="customer_name" value="<?= $_POST['customer_name']?>">
                               <button id="btn_yes" type="submit" name="optionSetuju" class="btn btn-primary btn_submit">SETUJU</button>
                               <button id="btn_no" type="submit" name="optionTdkSetuju" class="btn btn-primary btn_submit">TIDAK</button>
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
    <script>
        $(document).ready(function(){
            var buttonpressed;
            $('.btn_submit').click(function() {
                buttonpressed = $(this).attr('id')
            })

            $('#form_order_confirmation').submit(function() {
                console.log(buttonpressed);
                if(buttonpressed=='btn_yes'){
                    return true;
                }else{
                    window.location.replace("order.php");
                }
                return false; // return false to cancel form action
            });
        })
    </script>
</body>

</html>
