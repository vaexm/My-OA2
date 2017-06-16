<?php

namespace Admin\Controller;

class ScheduleController extends CommonController{
	protected $config = array('app_type' => 'personal');
	//过滤查询字段
	function _search_filter(&$map) {
		if (!empty($_POST["name"])) {
			$map['name'] = array('like', "%" . $_POST['name'] . "%");
		}
		$map['user_id'] = array('eq', get_user_id());
		$map['is_del'] = array('eq', '0');		
	}

	public function upload() {
		$this -> _upload();
	}

	function read($id) {
		$plugin['jquery-ui'] = true;		
		$this -> assign("plugin", $plugin);
				
		$model = M('Schedule');
		$list = $_REQUEST['list'];
		$this -> assign("list", $list);
		$list = array_filter(explode("|", $list));
		$current = array_search($id, $list);

		if ($current !== false) {
			$next = $list[$current + 1];
			$prev = $list[$current - 1];
		}
		$this -> assign('next', $next);
		$this -> assign('prev', $prev);

		$where['id'] = $id;
		$where['user_id'] = get_user_id();
		$vo = $model -> where($where) -> find();
		$this -> assign('vo', $vo);
		$this -> display();
	}

	function search() {
		
		$plugin['date'] = true;
		$this -> assign("plugin", $plugin);

		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		
		if (empty($_POST["be_start_date"])&&empty($_POST["en_start_date"])) {
			$start_date = to_date(mktime(0, 0, 0, date("m"), 1, date("Y")), 'Y-m-d');
			$end_date = to_date(mktime(0, 0, 0, date("m") + 1, 0, date("Y")), 'Y-m-d');			
			$map['start_time'] = array(array("egt", $start_date),array("elt",$end_date));					
		} else {
			$start_date = $_POST["be_start_date"];
			$end_date = $_POST["en_start_date"];
		}
		
		$this -> assign('start_date', $start_date);
		$this -> assign('end_date', $end_date);

		$model = D("Schedule");
		if (!empty($model)) {
			$this -> _list($model, $map);
		}
		$this -> assign('type_data', $this -> type_data);
		$this -> display();
		return;
	}

	public function down($attach_id) {
		$this -> _down($attach_id);
	}

	/* public function add() {
		$plugin['jquery-ui'] = true;
		$plugin['date'] = true;	
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$this -> display();
	} */

	public function edit($id) {
		$plugin['jquery-ui'] = true;
		$plugin['date'] = true;		
		$plugin['uploader'] = true;
		$plugin['editor'] = true;
		$this -> assign("plugin", $plugin);

		$id = I('id');
		$model = M('Schedule');
		$where['user_id'] = get_user_id();
		$where['id'] = $id;
		$vo = $model -> where($where) -> find();			

		$this -> assign('vo', $vo);
		$this -> display();
	}

	public function day_view() {
		$this -> index();
	}

	public function add(){
	    if(IS_POST){
	        //接收数据
	        $post=I('post.');
	        //实例化自定义模型
	        $model=D('schedule');
	        //数据保存
	        $res=$model->saveData($post,$_FILES['file']);
	        if($res){
	            $this->success('新建成功',U("Schedule/index"),1);
	        }else{
	            $this->error('添加失败');
	        }
	        	
	    }else{
	        $this->display();
	    }
	
	}
	public function index(){
	   
	    $this->display();
	}
	

}
?>