<?php
require_once('controllers/base_controller.php');
class PagesController extends BaseController

{
	function __construct()
	{
		$this->folder = 'pages';
	}

	public function error()
	{
		$this->render('error');
	}
}
