<?php

class CheckPass
{

	static function checkpass()
	{

		session_start();
		$db = DB::getInstance();
		$email = $_POST['emailcheck'];
		$req = $db->query("SELECT * FROM user WHERE email='" . $email . " '");
		$count = $req->rowCount();
			if ($count == 1) {
				foreach ($req->fetchAll() as $item){
				$_SESSION['matkhau'] = $item['password'];
				// if (isset($_SESSION['matkhau'])) {
					echo "<div style='padding-top: 5' class='containernotification'><div class='alert alert-danger' style='text-align: center;'><strong>MẬT KHẨU BẠN LÀ </strong>" . $_SESSION['matkhau'] . "<br><br></div></div>";
				// }
			}
			} else {
				echo "<div style='padding-top: 5' class='containernotification'><div class='alert alert-danger' style='text-align: center;'><strong>WARRING!</strong>TÀI KHOẢN KHÔNG TỒN TẠI<br><br></div></div>";
			}
		return $count;
	}
}
