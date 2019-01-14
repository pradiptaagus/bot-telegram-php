<?php
	require_once("Processor.php");

	$processor = new Processor();
	while (true) {
		$rows = $processor->process();
		sleep(2);
	}	
?>