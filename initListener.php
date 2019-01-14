<?php
  require_once("Listener.php");

  $listener = new Listener();
  while (true) {
  	$listener->process();
  	sleep(2);
  }
?>
