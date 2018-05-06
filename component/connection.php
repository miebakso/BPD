<?php
	try {
		$conn = new PDO("sqlsrv:server=DESKTOP-D12RCSK;Database=DB_Mie","","");
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(Exception $e) {
		die(print_r($e->getMessage() ));
	}
	
?>