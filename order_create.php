<html lang="en">

<?php require "component/header.php" ?>

<head>
    <style>
    /* The container */
    .choice {
        display:block;
        position: relative;
        padding-left: 35px;
        margin-left: 40px;
        margin-bottom: 12px;
        cursor: pointer;
        font-size: 22px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    /* Hide the browser's default checkbox */
    .choice input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }

    /* Create a custom checkbox */
    .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 25px;
        width: 25px;
        background-color: #eee;
    }

    /* On mouse-over, add a grey background color */
    .choice:hover input ~ .checkmark {
        background-color: #ccc;
    }

    /* When the checkbox is checked, add a blue background */
    .choice input:checked ~ .checkmark {
        background-color: #2196F3;
    }

    /* Create the checkmark/indicator (hidden when not checked) */
    .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }

    /* Show the checkmark when checked */
    .choice input:checked ~ .checkmark:after {
        display: block;
    }

    /* Style the checkmark/indicator */
    .choice .checkmark:after {
        left: 9px;
        top: 5px;
        width: 5px;
        height: 10px;
        border: solid white;
        border-width: 0 3px 3px 0;
        -webkit-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    </style>
</head>

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
                        <div class="table-responsive">
                            <?php 
                                //$result = exec_query("exec show_allActiveTopping");
                                $result = exec_query("exec select_topping 'active'");
                            ?>
                            <form method="POST" action="order_create_final.php">
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>Check</th>
                                            <th>Topping Name</th>
                                            <th>Topping Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        //var_dump($result);
                                        foreach ($result as $topping):?>
                                            <tr>
                                                <td>
                                                    <label class="choice">
                                                        <input type="checkbox" name="topping[]" value="<?= $topping['ID'] ?>" <?php if(in_array($topping['ID'], $_POST['topping_fav'])) echo "checked";?>>
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </td>
                                                <td><?= $topping['name'] ?></td>
                                                <td><?= $topping['price'] ?></td>
                                            </tr>
                                        <?php endforeach; 
                                        ?>
                                    </tbody>
                                </table>
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
