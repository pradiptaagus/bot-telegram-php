<?php
	require_once('config.php');
	require_once('FileGenerator.php');

	/**
	 * 
	 */
	class Processor
	{
		
		function __construct()
		{
			//
		}

		function process() {
			print_r("-");
			global $con;
			$sql = "SELECT * FROM tb_inbox WHERE flag = '0' LIMIT 10;";
			$query = $con->query($sql);
			
			$rows = array();
			$rowsId = array();

			if ($query) {
				while ($data = $query->fetch_assoc()) {
					$rows[] = $data;
					$rowsId[] = $data["id_inbox"];
				}
			}				

			//update flag after selected
			foreach ($rowsId as $value) {
				$this->updateFlag($value);
			}

			// init reply message
			if (count($rows)) {
				foreach ($rows as $msg) {
					$reply = $this->initReply($msg["in_msg"]);
					$storeReply = $this->insertOutbox($msg["id_inbox"], $msg["chat_id"], $msg["msg_id"], $reply["msg"], $reply["type"]);
				}
			} else {
				print_r("No new message to process..\n");
			}
		}

		function updateFlag($id) {
			global $con;
			$sql = "UPDATE tb_inbox SET flag = '1' WHERE id_inbox = $id;";
			$query = $con->query($sql);
		}

		function insertOutbox($idInbox, $chatId, $msgId, $outMsg, $type) {
			global $con;
			$sql = "INSERT INTO tb_outbox(
								id_inbox, 
								chat_id, 
								msg_id, 
								out_msg, 
								type, 
								flag) 
							VALUES(
								'$idInbox',
								'$chatId',
								'$msgId',
								'$outMsg',
								'$type',
								'0'
								)";
			$query = $con->query($sql);
			if (mysqli_insert_id($con)) {
				print_r("-Init message answer..\n");
			}
		}

		function initReply($msg) {
			global $con;
			$sql = "SELECT `format`, `flag_file`, `query` FROM tb_operasi WHERE id = '$msg'";
			$query = $con->query($sql);

			$reply = array();
			$reply["msg"] = "";
			$reply["type"] = "msg";

			// execute when operation id is found
			if ($query->num_rows > 0) {
				print_r("tes1");
				$data = $query->fetch_object();
				$reply["msg"] = "Masukkan perintah berikut:";
				$reply["msg"] .= "<pre>".$data->format."</pre>";			
			} 
			//exexcute when opearation id not found
			else {
				$msg = explode(" #", $msg);
				$sql = "SELECT `id`, `nama_operasi`, `flag_file`, `type`, `query` FROM tb_operasi WHERE `keyword` = '$msg[0]'";
				$query = $con->query($sql);

				// execute when keyword operation is found
				if ($query->num_rows > 0) {
					$data = $query->fetch_object();
					$sql2 = $data->query;

					foreach ($msg as $key => $value) {
						if ($key == 0) continue;
						$sql2 = substr_replace($sql2, $value, strpos($sql2, "?"), 1);
					}

					$query2 = $con->query($sql2);

					// check if type is file or message
					if ($data->flag_file == "1") {
						$data2 = array();
						$reply["type"] = "file";

						if ($query2) {
							while ($row = $query2->fetch_assoc()) {
								$data2[] = $row;
							}
						}						

						$fileGenerator = new FileGenerator();
						$filePath = $fileGenerator->createPdf($data2);
						$reply["msg"] = "download.pdf";
					}
					
					switch ($data->type) {
						case "insert":
							if ($query2) {
								$reply["msg"] = "Insert berhasil dilakukan";
							}else {
								$reply["msg"] = "Insert gagal dilakukan";
							}							
							break;
						
						case "update":
							if ($query2) {
								$reply["msg"] = "Update berhasil dilakukan";
							} else {
								$reply["msg"] = "Update gagal dilakukan";
							}							
							break;

						case 'delete':
							if ($query2) {
								$reply["msg"] = "Delete berhasil dilakukan";
							} else {
								$reply["msg"] = "Delete gagal dilakukan";
							}							
							break;

						default:
							$numRows = $query2->num_rows;
							if ($numRows > 0) {
								while ($row = $query2->fetch_assoc()) {
									foreach ($row as $key => $value) {
										$reply["msg"] .= $key. "\t: " . $value . "\n";
									}
								}
							} else {
								$reply["msg"] = "Data tidak ditemukan";
							}
							break;
					}
				}
				// execute when keyword is not found
				else {
					$sql = "SELECT nama_operasi FROM tb_operasi";
					$query = $con->query($sql);
					$reply["msg"] = "<b>List operasi</b>\n";
					$i = 1;
					while ($row = $query->fetch_assoc()) {
						$reply["msg"] .= $i . ".\t" . $row["nama_operasi"] ."\n";
						$i++;
					}
				}
			}
			print_r($reply);
			return $reply;
		}
	}
?>