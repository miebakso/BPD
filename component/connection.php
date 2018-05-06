<?php
	try {
<<<<<<< HEAD
		$conn = new PDO("sqlsrv:server=DESKTOP-8GFM4DQ\SQLEXPRESS;database=DB_Mie","","");
=======
		$conn = new PDO("sqlsrv:server=DESKTOP-D12RCSK;Database=DB_Mie","","");
>>>>>>> c0e64538de485b0704ea8deff1c09e610b68b9d3
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(Exception $e) {
		die(print_r($e->getMessage() ));
	}
	
?>
