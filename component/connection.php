<?php
	try {
		$conn = new PDO("sqlsrv:server=DESKTOP-5ASLR0A\SQLEXPRESS;database=miebakso","","");
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(Exception $e) {
		die(print_r($e->getMessage() ));
	}
	
?>