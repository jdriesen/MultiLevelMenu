<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * The Menus Controller  
  * @package APPLICATION \ MENUS
  * @category Controller
  *
  * @copyright 2015-2016 3SN.IT
  * @author Johnny DRIESEN <info.@3sn.be>
  * @version 1.0.0
  * @since 1.0.0 Initial Controller File
  *   
  * @todo clean up code
  */

class Menus extends MY_Controller {

	function __construct() {
		parent::__construct();
		$this -> load -> model('menus/Mdl_menus');
	}
	
	function index() {
		$items	= $this->Mdl_menus->get_items();
		$menu	= $this->Mdl_menus->generateTree($items); 
		$data = array(
			'menu' => $menu,
		);
		$this->load->view('menus/menu', $data, false);
	}
	
}
