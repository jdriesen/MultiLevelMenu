<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
  * The Menus Model  
  * @package APPLICATION \ MENUS
  * @category Model
  *
  * @copyright 2015-2016 3SN.IT
  * @author Johnny DRIESEN <info.@3sn.be>
  * @version 1.0.0
  * @since 1.0.0 Initial Model File
  *   
  * @todo clean up code
  */



class Mdl_menus extends CI_Model {
   
  function __construct() {
    parent::__construct();
    
    $this->tableName = 'menus';
  }
	
	
  function get_items() {
    $this->db->select('*');
    $this->db->from($this->tableName);
    $this->db->order_by('parent_id');
    $this->db->order_by('sequence');
    $query = $this->db->get();
    return $query->result_array();
  }
	
	
  function generateTree($items = array(), $parent_id = 0){
    $tree = '<ul>';
    for($i=0, $ni=count($items); $i < $ni; $i++){
    	if($items[$i]['parent_id'] == $parent_id){
    		$tree .= '<li>';
    		$tree .= $items[$i]['name'];
    		$tree .= $this->generateTree($items, $items[$i]['id']);
    		$tree .= '</li>';
    	}
    }
    $tree .= '</ul>';
    return $tree;
  }
	
	
} // End of Model Class	
	
