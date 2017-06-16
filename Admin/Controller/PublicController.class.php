<?php
//声明命名空间
namespace Admin\Controller;
//引入父类控制器
use Think\Controller;
//声明类并且继承父类
class PublicController extends Controller{
	//登录页面展示
	public function login(){
		$this->display();
	}
	//输出验证码的方法
	public function verify(){
		$config=array(
				'fontSize'  =>  12,              // 验证码字体大小(px)
				'useCurve'  =>  false,            // 是否画混淆曲线
				'useNoise'  =>  false,            // 是否添加杂点
				'imageH'    =>  38,               // 验证码图片高度
				'imageW'    =>  83,               // 验证码图片宽度
				'length'    =>  4,               // 验证码位数
				'fontttf'   =>  '',              // 验证码字体，不设置随机获取
				);
		$verify=new \Think\Verify($config);
		//dump($verify);die();
		$verify->entry();
	}
	//处理用户登录
	public function checkLogin(){
		//接收表单提交的数据
		$data=I('post.');
		//对于接受到的数据，应该先验证验证码是否正确
		//验证码验证
		//$verify=new \Think\Verify();
		//验证成功返回true,失败false
		//$result=$verify->check($_POST['verify']);
		/*if($result){
			
			
			
		}else{
			//验证码输入不正确，请重新输入
			$this->error('你输入的验证码不正确，请重新输入');
			//echo "<script>alert('你输入的验证码不正确，请重新输入')history.go(-1);</script>";
		}*/
		//验证码输入正确，继续处理用户名和密码
			$user=M('user');
			//删除验证码元素
			//unset($_POST['verify']);
			//查询
			$data=$user->where($data)->find();
			if($data){
				//用户存在，用户信息持久化保存到session中，跳转到后台首页
				session('id',$data['id']);
				session('username',$data['username']);
			//echo $_SESSION['username'];die();
				session('role_id',$data['role_id']);
				echo "<script>alert('登录成功');</script>";
// 				$this->success('',U('Index/index'),0);
				//echo "<meta http-equiv='Refresh' content='0;URL=http://localhost/TP-OA/index.php/Admin/Index/index'>";
				$this->redirect('Index/index');
			}else{
			    echo "<script>alert('你输入的用户名或密码有误');history.go(-1);</script>";
			    
			}

	}
	//退出方法
	public function logout(){
		//清除session
		session(null);
		//跳转到登陆页面
// 		$this->success('退出成功',U('login'),2);
		echo "<script>alert('登录成功');</script>";
		$this->redirect('Public/login');
		
	}
}
?>