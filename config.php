<?php

  define('BOT_TOKEN', '635101530:AAGPKB35zTX_yJZO59OahdU7ab2RaY2ZTFU');
  
  define('API_URL', 'https://api.telegram.org/bot'.BOT_TOKEN.'/');

  $host = "localhost";
  $user = "root";
  $pass = "";
  $db = "mca_remidi";

  $con = new mysqli($host, $user, $pass, $db);
?>
