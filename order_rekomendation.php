<html lang="en">

<?php require "component/header.php" ?>
<?php require "component/connection.php" ?>
<?php
    // insert customerOuder data 
    //$result = exec_query("exec insert_customerOrder '".$_POST['name']."'");
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
                        <h4 class="page-title">Order Form</h4> 
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3>REKOMENDASI TOPPING TAMBAHAN</h3>
                            <form id="form_rekomendasi" method="POST" action="order_create_final.php">
                                <?php 
                                    $prev_toppings = implode(',', $_POST['topping']);
                                    $result = exec_query("exec rekomendasi '$prev_toppings'");
                                    if($result){
                                ?>
                                <div class="row">
                                    <div class="col-md-2"><h3><?= $result[0]['name'] ?></h3></div>
                                    <div class="col-md-2"><h3><center>Rp.<?= $result[0]['price'] ?>,00</center></h3></div>
                                    <input id="topping_rekomendasi" type="hidden" name="" value="<?= $result[0]['ID']?>">
                                </div>
                                <?php }else{ ?>
                                    <div class="row">
                                        <div class="col-md-12"><h3>Tidak ada topping yang dapat direkomendasikan</h3></div>
                                    </div>
                                <?php } 
                                $prev_toppings = $_POST['topping'];
                                //var_dump($result);
                                foreach ($prev_toppings as $topping){ ?>
                                    <input type="hidden" name="topping[]" value="<?=$topping?>">
                                <?php }?>
                                <div class="row">
                                    <input type="hidden" name="customer_name" value="<?= $_POST['name']?>">
                                    <input id="btn_yes" type="submit" name="option" value="yes" class="btn btn-info pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light btn_submit">
                                    <?php if($result){?>
                                    <input id="btn_no" type="submit" name="option" value="no" class="btn btn-info pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light btn_submit">
                                    <?php } ?>
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
    <script>
        $(document).ready(function(){
            var buttonpressed;
            $('.btn_submit').click(function() {
                buttonpressed = $(this).attr('id')
            })

            $('#form_rekomendasi').submit(function() {
                console.log(buttonpressed);
                if($('#topping_rekomendasi').length != 0 && buttonpressed=='btn_yes'){
                    $('#topping_rekomendasi').attr('name', 'topping[]');
                }
                return true; // return false to cancel form action
            });
        })
    </script>
</body>

</html>
