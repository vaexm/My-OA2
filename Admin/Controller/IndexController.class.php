<?php
//声明命名空间
namespace Admin\Controller;
use Admin\Controller;
/* //引入父类
use Think\Controller; */
//声明控制器并创建父类
class IndexController extends CommonController{
	public function index(){
		$this->display();
	}
	public function home(){
	    
	    //首页通知公告的相关查询
	    $model=M('inform');
	    $data=$model->order('addtime desc')->limit(5)->select();
	    //print_r($data);
	    $this->assign('data',$data);
	    
	    //首页资料管理的相关查询
	    $knowledge=M('knowledge');
	    $know=$knowledge->order('addtime desc')->limit(5)->select();
	    $this->assign('know',$know);
	    
	    //首页未读邮件的相关查询
	    $email=M('email');
	    /* $data=$model->field('t1.*,t2.name as deptname')->table('sp_user as t1,sp_dept as t2')->where('t1.dept_id=t2.id')
	    ->limit($page->firstRow,$page->listRows) ->select(); */
	    $emailCount=$email->field('t1.* ,t2.truename as fajianren')->table('sp_email as t1,sp_user as t2')->
	    where("t1.to_id=".session('id') ." and t1.isread=0 and t1.from_id=t2.id")->order('addtime desc')->limit(5)->select();
	    //dump($emailCount);die();
	    $this->assign('email',$emailCount);
	    
	    //首页会议信息的查询
	    $meeting=M('meeting');
	    $meet=$meeting->order('starttime desc')->limit(5)->select();
	    //dump($meet);die();
	    $this->assign('meet',$meet);
	    
	    
	    
		$this->display();
	}
	//密码修改
	public function password(){
	//判断是否点击提交按钮
		if(IS_POST){
			//处理post请求
			$user=M('user');
	        $data=$user->create();//收集到了所有的信息
	        //dump($data);die();
	        $id=session('id');
	       // dump($id);die();
			$res=$user->where("id={$id}")->save($data);
			//dump($res);die();
			if($res!==false){
			    echo "<script>alert('修改成功');history.go(-1);</script>";
				//$this->success('修改成功');				
			}else{
				$this->error('修改失败');
			}			
			
		}else {
			
			$this->display();
		}	
	}
	
	//展示用户信息
	public function showInfo(){
	    $model=M('user');
	    $data=$model->find(session('id'));
	  //dump($data);
	    //查询所有部门信息
	    $dept=M('dept');
	    $dInfo=$dept->select();
	    $this->assign('data',$data);
	    $this->assign('dept',$dInfo);
	    $this->display();
	}
	public function showInform(){
	    $id=I('get.id');
	    $data=M('inform')->find($id);
	    $this->assign('data',$data);
	    $this->display();
	}
	public function showMeeting(){
	    $id=I('get.id');
	    $data=M('meeting')->find($id);
	    $this->assign('data',$data);
	    $this->display();
	}
	//附件的下载
	public function downloadM(){
	    //接收id
	    $id=I('get.id');
	    //查询数据
	    $model=M('meeting');
	    $data=$model->find($id);
	    //下载代码
	    $file = WORKING_PATH.$data['filepath'];
	    //输出文件
	    header("Content-type: application/octet-stream");
	    header('Content-Disposition: attachment; filename="' . basename($file) . '"');
	    header("Content-Length: ". filesize($file));
	    //输出缓存区
	    readfile($file);
	
	}
	public function showKnow(){
	    $id=I('get.id');
	    $data=M('knowledge')->find($id);
	    $this->assign('data',$data);
	    $this->display();
	}
	public function downloadK(){
	    //接收id
	    $id=I('get.id');
	    //查询数据
	    $model=M('knowledge');
	    $data=$model->find($id);
	    //下载代码
	    $file = WORKING_PATH.$data['filepath'];
	    //输出文件
	    header("Content-type: application/octet-stream");
	    header('Content-Disposition: attachment; filename="' . basename($file) . '"');
	    header("Content-Length: ". filesize($file));
	    //输出缓存区
	    readfile($file);
	
	}
	
}
?>