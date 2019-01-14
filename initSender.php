<?php
  require_once("Sender.php");

  $sender = new Sender();
  while (true) {
    $row = $sender->process();
    sleep(2);
  }
?>