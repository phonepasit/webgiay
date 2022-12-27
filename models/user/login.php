<?php

class LoginUser
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
	static function all()
	{
		$list = [];
		$db = DB::getInstance();
		$req = $db->query('SELECT * FROM user');
		foreach ($req->fetchAll() as $item) {
			$list[] = new LoginUser($item['id_user'], $item['username'], $item['password'], $item['diachi'], $item['phone'], $item['avatar'], $item['email']);
		}
		return $list;
	}


	static function login()
	{
		$data = json_encode(array(
			'email' => $_POST['email'],
			'password' => $_POST['password']
		));
		$url = 'localhost:3000/login';
		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS,  $data);
		curl_setopt($curl, CURLOPT_HTTPHEADER,  array(
			"Content-Type: application/json",
			"Content-Length: " . strlen($data),
		));

		
		$response = json_decode(curl_exec($curl) . PHP_EOL);
		curl_close($curl);
		if ($response->{'code'} == 200) {
			session_start();
			$_SESSION['id_khachhang'] = $response->{'user'}->{'id_user'};
			$_SESSION['dangnhap'] = $response->{'user'}->{'username'};
			$_SESSION['email'] = $response->{'user'}->{'email'};
			$_SESSION['diachi'] = $response->{'user'}->{'diachi'};
			$_SESSION['phone'] = $response->{'user'}->{'phone'};
			header("location:index.php");
		} else if ($response->{'code'} == 404) {
			echo "<div style='padding-top: 5' class='container'><div class='alert alert-danger' style='text-align: center;'><strong>WARRING!</strong> EMAIL HOẶC PASSWORD SAI<br>VUI LÒNG NHẬP LẠI<br><a href='javascript: history.go(-1)'>Trở lại Login</a></div></div>";
		}
		return 0;
	}
}
