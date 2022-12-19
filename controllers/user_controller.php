<?php
require_once('controllers/base_controller.php');
require_once('models/user/registra.php');
require_once('models/user/login.php');
require_once('models/user/forgotpass.php');

class UserController extends BaseController
{
  function __construct()
  {
    $this->folder = 'user';
  }


  public function indexlogin()
  {

    // $user = LoginUser::login();
    // $data = array('count' => $user);
    $this->render('login');
  }
  // public function loginuser()
  // {
  //   $user = LoginUser::login();
  //   $data = array('userlogin' => $user);
  //   $this->render('login',$data);
  // }

  //check user vs password

  public function loginuser()
  {
    $user = LoginUser::login();
    $data = array('login' => $user);
    $this->render('login', $data);
  }

  //đăng ký
  public function regisuser()
  {
    $registra = Regis::regis();
  }

  public function indexregistration()
  {
    $this->render('registration');
  }

  //quên mật khẩu
  public function indexforgetpassword()
  {
    $this->render('forgetpassword');
  }
  public function forgetpassword()
  {
    $forgetpasssword = CheckPass::checkpass();
  }
}
