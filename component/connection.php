<?php
	try {
		$conn = new PDO("sqlsrv:server=DESKTOP-8GFM4DQ\SQLEXPRESS;database=DB_Mie","","");
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(Exception $e) {
		die(print_r($e->getMessage() ));
	}
	
?>
