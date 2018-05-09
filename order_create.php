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
                        <h4 class="page-title">Order Form</h4> 
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!--row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <form action="" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nama</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="nama" placeholder="Nama">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Pilih Topping</label>
                                    <select class="form-control" name="pilih-topping">
                                        <?php 
                                        $result = $conn->query("exec findActiveTopping ");
                                        $no = 1;
                                        foreach($result as $order){?>

                                        <option id="<?= $order['idTopping']?>"><?= $order['nama'] ?></option>
                                        
                                        <?php }?>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
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
        $.post( "test2.php")
            .done(function( data ) {
                alert( "Data Loaded: " + data );
            });
    </script>
</body>

</html>
