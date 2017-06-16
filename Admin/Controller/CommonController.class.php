<?php
namespace Admin\Controller;
use Think\Controller;
//中间控制器
class CommonController extends Controller{
	//构造方法
 	public function __construct(){
 		//构造父类
 		parent::__construct();
 		$id=session('id');
 		if(empty($id)){
 			$this->error('请先登录',U('Public/login'),3);die();
 				
 		}
 		
 		//RBAC部分
 		$role_id=session('role_id'); //获取当前用户的角色id
 		$rbac_role_auth=C('RBAC_ROLE_AUTH'); //获取全部的用户的权限
//  		dump($rbac_role_auth);die();
        $currRole_auth=$rbac_role_auth[$role_id]; //获取当前用户的权限
//         dump($currRole_auth);die();
         //使用常量获取当前路由中的控制器名和方法名
         $controller=CONTROLLER_NAME;
         $action=strtolower(ACTION_NAME);
         //判断该用户是否具有权限
         if($role_id>1){
         	if(!in_array($controller. '/'. $action, $currRole_auth) && !in_array($controller. '/*', $currRole_auth)){
         		$this->error('抱歉，你没有该权限',U('Index/home'),1);exit;        		
         	
            }
        
 	     }
 	}
}


 	

	
	


?>