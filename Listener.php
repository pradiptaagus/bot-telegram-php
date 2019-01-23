<!-- Read incoming telegram chat  -->
<?php
  require_once('config.php');
  /**
   *
   */
  class Listener
  {
    // create url
    function requestUrl($method) {
      global $db;
      return API_URL . $method;
    }

    function getUpdates($offset) {
      $url = $this->requestUrl("getUpdates")."?offset=".$offset;
      $resp = file_get_contents($url);
      $result = json_decode($resp, true);
      if ($result["ok"] == 1) {
        return $result["result"];
        return array();
      }
    }

    function storeUpdates($chatId, $msgId, $inMsg) {
      global $con;
      $sql = "INSERT INTO tb_inbox(chat_id, msg_id, in_msg, tgl) VALUES($chatId, $msgId, '$inMsg', NOW());";
      $con->query($sql);
    }

    function message($message) {
      $updateId = $message["update_id"];
      $message_data = $message["message"];

      if (isset($message_data["text"])) {
        $chatId = $message_data["chat"]["id"];
        $messageId = $message_data["message_id"];
        $text = $message_data["text"];
        
        // store updates
        $this->storeUpdates($chatId, $messageId, $text);
      }
      return $updateId;
    }

    function process() {
      $updateId = 0;

      if (file_exists("last_update_id")) {
        $updateId = (int)file_get_contents("last_update_id");
      }

      $updates = $this->getUpdates($updateId);

      if (!empty($updates)) {
        print_r("-New message retrived..\n");
        print_r("============= Start Array =============\n");
        print_r($updates);
        print_r("============= End Array =============\n");
      } else {
        print_r("-No new message retrived..\n");
      }

      foreach ($updates as $message) {
        $updateId = $this->message($message);
      }

      file_put_contents("last_update_id", $updateId + 1);
    }

  }
?>
