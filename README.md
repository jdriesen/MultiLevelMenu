# Infinite-deep MultiLevel Menu in CodeIgniter

A small CodeIgniter Controller and Model to generate an (in theory... infinite-deep) multi-level menu.

### Included features ###
* As less database calls as possible (we'll need only 1)
* As generic as possible (using a recursive function)
* As clean as possible
* The menu in this example is 5 levels 'deep' (friends, it can be as deep as the ocean...)
* following the HMVC specs.

Sourcecode contains only ** 25 relevant lines **



The result will be something like this

![Result MultiLevel Menu in CodeIgniter](http://www.driesen.eu/insiderclub/multilevelmenu/multilevel01.png)

### Requirement ###

* CodeIgniter 3.0.x (tested until 3.1.3) installed.
* HMVC installed
* Some basic PHP knowledge
* Some basic MySQL knowledge


#### Step 1: creating the table in MySQL. ####

Our table (named 'menus') will have only 4 fields...

* ***id (int)*** : Unique AI integer
* ***parent_id (int)*** : refers to the id...
* ***name (varchar)*** : the name of our menu
* ***sequence (int)*** : will determine the 'order' in which the menu-items will be shown (per level ...)

***Remark:***
By using the sequence field, we can make to menu-levels independent from the ID's in our table...

See the image below for details


![Rec Id in your database does not really mather](http://www.driesen.eu/insiderclub/multilevelmenu/multilevel02.png)



The SQL script to create, and fill your '*** menus ***' table in included in the SQL folder


#### Step 2: The Controller. ####

```
class Menus extends MY_Controller {

  function __construct() {
    parent::__construct();
    $this -> load -> model('menus/Mdl_menus');
  }

  function index() {
    $items = $this->Mdl_menus->get_items();
    $menu = $this->Mdl_menus->generateTree($items);
    $data = array(
     'menu' => $menu,
    );
    $this->load->view('menus/menu', $data, false);
  }

}
```

Pretty simple, no ?

#### Step 3: The Model. ####
Beside the constructor, our Model has 2 functions...
** get_items()**  does 1 database call (yep, only ONE)
** generateTree()**  is a recursive function which does the complete job.
In other words, it generates ALL the menu levels, in a nice and clean way...

```
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
```


#### Step 4 The view ####
Basic rule of HMVC ... just use ECHO's in your views... (so, NO Business Logic)
Well, this is the content of View ...
```
echo $menu;
```

** And we are DONE !!! **

Grtz,
Johnny
