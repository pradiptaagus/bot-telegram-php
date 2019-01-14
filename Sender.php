<?php
	require_once("config.php");

	class Sender 
	{
		function process() {
			global $con;
			$sql = "SELECT * FROM tb_outbox WHERE flag = '0' LIMIT 10";
			$query = $con->query($sql);
			$rows = array();
			$rowsId = array();
			while ($row = $query->fetch_assoc()) {
				$rows[] = $row;
				$rowsId[] = $row["id_outbox"];
			}

			// update flag after selected
			foreach ($rowsId as $value) {
				$this->updateFlag($value);
			}

			// send message
			if (count($rows)) {
				foreach ($rows as $data) {
					if ($data["type"] == "file") {
						$chatId = $data["chat_id"];
						$msgId = $data["msg_id"];
						$document = $data["out_msg"];
						
						$this->sendReplyFile($chatId, $msgId, $document);
						
						print_r("-File was sent..\n");
						// update sent date in tb_outbox
						$this->updateSentDate($data["id_outbox"]);
					} else {
						$outMsg = $data["out_msg"];
						$chatId = $data["chat_id"];
						$msgId = $data["msg_id"];
					
						$this->sendReplyMsg($chatId, $msgId, $outMsg);
						
						print_r("-Message was sent..\n");
												
						// update sent date in tb_outbox
						$this->updateSentDate($data["id_outbox"]);
					}
				}
			}	else {
				print_r("-No new message to sent..\n");
			}		
		}
		
		function updateFlag($id) {
			global $con;
			$sql = "UPDATE tb_outbox SET flag = '1' WHERE id_outbox = $id";
			$query = $con->query($sql);
		}

		function updateSentDate($id) {
			global $con;
			$sql = "UPDATE tb_outbox SET tgl_kirim = NOW() WHERE id_outbox = $id;";
			$query = $con->query($sql);
		}

		// fungsi untuk membuat url
    function requestUrl($method) {
      global $db;
      return API_URL . $method;
    }

		// fungsi untuk mengirimkan pesan
		function sendReplyMsg($chatId, $msgId, $text) {
      $data = array(
        'chat_id' => $chatId,
        'text' => $text,
				'reply_to_message_id' => $msgId,
				'parse_mode' => 'html'
      );

      $options = array(
        'http' => array(
          'header' => "Content-type: application/x-www-form-urlencodedrn",
          'method' => "POST",
          'content' => http_build_query($data),
        ),
      );
      $context = stream_context_create($options);
      $result = file_get_contents($this->requestUrl("sendMessage"), false, $context);
		}
		
		function sendReplyFile($chatId, $msgId, $document) {
			$post = array(
				'chat_id' => $chatId,
				'reply_to_message_id' => $msgId,
				'document'=>new CurlFile(realpath($document))
			);

			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $this->requestUrl("sendDocument"));
			curl_setopt($ch, CURLOPT_POST, 1);   
			curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
			curl_exec ($ch);
			curl_close ($ch); 

			print_r($ch);
    }
	}
?>