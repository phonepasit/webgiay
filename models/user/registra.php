<?php

class Regis
{
	public $id_user;
	public $username;
	public $password;
	public $diachi;
	public $phone;
	public $avatar;
	public $email;

	function __construct($id_user, $username, $password, $diachi, $phone, $avatar, $email)
	{
		$this->id_user = $id_user;
		$this->username = $username;
		$this->password = $password;
		$this->diachi = $diachi;
		$this->phone = $phone;
		$this->avatar = $avatar;
		$this->email = $email;
	}
	static function regis()
	{

		$db = DB::getInstance();
		$email = $_POST['insertemail'];
		$req = $db->query("SELECT email FROM user WHERE email = '" . $email . "'");
		$count = $req->rowCount();
		if ($count > 0) {
			echo '<p style="color:green">Tài khoản này đã tồn tại</p>';
		} else {
			$req = $db->query('INSERT INTO user (username,password,diachi,phone,email) VALUES ("' . $_POST['insertusername'] . '", "' . $_POST['inserpassword'] . '", "' . $_POST['insertdiachi'] . '", "' . $_POST['insertphone'] . '", "' . $_POST['insertemail'] . '")');
			header("location:index.php?controller=user&action=indexlogin");
		}
	}
}
