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
                    <div class="col-sm-8">
                        <div class="white-box">
                            <h3>REKOMENDASI MENU FAVOURITE</h3>
                            <div class="table-responsive">
                                <?php 
                                    $result = exec_query("exec kombinasiToppingFavourite");
                                ?>
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>Topping Name</th>
                                            <th>Topping Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        //var_dump($result);
                                        foreach ($result as $topping){ ?>
                                            <tr>
                                                <td><?= $topping['name'] ?></td>
                                                <td><?= $topping['price'] ?></td>
                                            </tr>
                                        <?php }?>
                                    </tbody>
                                </table>
                            </div>
                            <form>
                                <input type="hidden" value="<?= $_POST['name']?>">
                                <a href="order_create.php?option=yes" class="btn btn-info pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">MAU</a>
                                <a href="order_create.php?option=no" class="btn btn-info pull-left m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">TIDAK</a>
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
