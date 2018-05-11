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
                    <!-- /.col-lg-12 -->
                </div>

                <!--row -->
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="white-box">
                            <form method="post" action="promo_create.php">
                                <div class="row">
                                    <div class="col-md-12" style="margin-bottom: 20px;">
                                        <input type="text" name="name" class="form-control" placeholder="Promo Name">  
                                    </div>
                    
                                    <div class="col-md-12" style="margin-bottom: 20px;">
                                        <input type="number" name="discount" class="form-control" placeholder="Discount">
                                    </div>
                                    
                                    <div class="col-md-12" style="margin-bottom: 20px;">
                                        <select multiple class="form-control" name='topping_ids[]' size="12">
                                            <?php 
                                                $result = exec_query("exec select_topping 'active' ");
                                                foreach ($result as $topping){
                                                    echo "<option  value='".$topping['ID']."'>".$topping['name']."</option>";
                                                }
                                            ?>
                                        </select>
                                    </div>
                                    <center>
                                        <button class="btn btn-success btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">CREATE</button>
                                    </center>
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
</body>

</html>
