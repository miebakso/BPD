<?php
	try {
		/**
		#$conn = new PDO("sqlsrv:server=DESKTOP-D12RCSK;Database=DB_Mie","","");
		$conn = new PDO("sqlsrv:server=DESKTOP-5ASLR0A\SQLEXPRESS;Database=miebakso","","");
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		**/
		$conn = sqlsrv_connect('DESKTOP-5ASLR0A\SQLEXPRESS', array(
			'Database' => 'miebakso',
			'UID' => '',
			'PWD' => ''
		));

		function exec_query($query, $debug=false) {
			global $conn;
			if($debug) exit($query);
			$stmt = sqlsrv_prepare($conn, $query);

			if(!sqlsrv_execute($stmt)){
				die('<pre>'.print_r(sqlsrv_errors(),true).'</pre>');
			}

			$result = [];
			do{
				$tempArr = [];
				while($row=sqlsrv_fetch_array($stmt,SQLSRV_FETCH_ASSOC)){
					$tempArr[] = $row;
				}
				$result[] = $tempArr;
			}while($cek = sqlsrv_next_result($stmt));
			$result = $result[count($result)-1];
			return $result;
		}
		

	} catch(Exception $e) {
		die(print_r($e->getMessage() ));
	}

	/**
	try {
		$conn = new PDO("sqlsrv:server=DESKTOP-5ASLR0A\SQLEXPRESS;Database=miebakso","","");
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(Exception $e) {
		die(print_r($e->getMessage() ));
	}
	**/
	
?>
