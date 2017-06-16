<?php
namespace Admin\Controller;
class EmailController extends CommonController{
	//发送邮件
	public function send(){
		if(IS_POST){
			//接收数据
			$post=I('post.');
			$post['from_id']=session('id');
// 			var_dump($post);die();
			$model=D('email');
			$em=think_send_mail('1148423590@qq.com','Vae',$post['title'],$post['content'],$post['file']);
			//dump($em);die();
			$res=$model->addData($post,$_FILES['file']);
			if($res){
			    echo "<script>alert('发送成功');</script>";
			    
			    //header('Location:/TP-OA/index.php/Admin/Email/sendBox');
				//$this->success('发送成功',U('sendBox'),1);
				$this->redirect('Email/sendBox');
			}else{
				 echo "<script>alert('发送失败，请重新发送');history.go(-1);</script>";
			}
			
		}else{
			//将收件人信息绑定到下拉列表
			$user=M('user');
			$data=$user->field('id,truename')->where("id!= " .session('id'))->select();
			// 		dump($data);die();
			$this->assign('data',$data);
			$this->display();
		}
	
	}
	public function sendBox(){
// 		$data=$model->field('t1.*,t2.truename as truename')->table('sp_email as t1,sp_user as t2')->where('t1.id=t2.id')->select();
	    $model=M('email');
	    $count=$model->where('sp_email.from_id=' .session('id'))->count();
	    //实例化分页类,传递参数
	    $page=new \Think\Page($count,2);
	    //第三步:可选步骤，定制分页按钮的提示文字
	    $page->setConfig('prev', '上一页');
	    $page->setConfig('next', '下一页');
	    $page->setConfig('last', '末页');
	    $page->setConfig('first', '首页');
	    //如果总的页码数小于分页类中的rollpage,则不会显示首页和末页
	    $page->rollPage=4;
	    // 最后一页是否显示总页数
	    $page->lastSuffix=false;
	     
	    //第四步:通过show方法生成url
	    $show=$page->show();
	    //第五步:使用limit方法进行查询  ->limit($page->firstRow,$page->listRows)
	    //获取数据
	           $data=M('email')->field('t1.*,t2.truename as truename')->alias('t1')->join('left join sp_user as t2 on t1.to_id=t2.id')->
        where('t1.from_id=' .session('id'))->limit($page->firstRow,$page->listRows)->select();
	    //         print_r($data);exit();
	    //六:
	    $this->assign('data',$data);
	    //总的记录数
	    $this->assign('count',$count);
	    //每页显示的条数
	    $this->assign('row',$page->listRows);
	    $this->assign('show',$show);

//         var_dump($data);die();
		$this->assign('data',$data);
		$this->display();
	}
	public function download(){
		$id=I('get.id');
		//查询数据
		$model=M('email');
		$data=$model->find($id);
		//下载代码
		$file = WORKING_PATH.$data['file'];
		//输出文件
		header("Content-type: application/octet-stream");
		header('Content-Disposition: attachment; filename="' . basename($file) . '"');
		header("Content-Length: ". filesize($file));
		//输出缓存区
		readfile($file);
	}
	
	public function recBox(){
	    $model=M('email');
	    $count=$model->where('sp_email.to_id=' .session('id'))->count();
	    //实例化分页类,传递参数
	    $page=new \Think\Page($count,2);
	    //第三步:可选步骤，定制分页按钮的提示文字
	    $page->setConfig('prev', '上一页');
	    $page->setConfig('next', '下一页');
	    $page->setConfig('last', '末页');
	    $page->setConfig('first', '首页');
	    //如果总的页码数小于分页类中的rollpage,则不会显示首页和末页
	    $page->rollPage=4;
	    // 最后一页是否显示总页数
	    $page->lastSuffix=false;
	    
	    //第四步:通过show方法生成url
	    $show=$page->show();
	    //第五步:使用limit方法进行查询  ->limit($page->firstRow,$page->listRows)
	    //获取数据
	    $data=M('email')->field('t1.*,t2.truename as truename')->alias('t1')->join('left join sp_user as t2 on t1.from_id=t2.id')->
	    where('t1.to_id=' .session('id')) ->limit($page->firstRow,$page->listRows)->select();
	    //         print_r($data);exit();
	    //六:
	    $this->assign('data',$data);
	    //总的记录数
	    $this->assign('count',$count);
	    //每页显示的条数
	    $this->assign('row',$page->listRows);
	    $this->assign('show',$show);
		
		$this->display();
	}
	
	//获取邮件内容
	public function getContent(){
		$id=I('get.id');
// 		echo $id; die;
		$data=M('email')->where('id ='. $id .' and to_id=' .session('id'))->find();
		//如果data为真且未读，则修改状态
		if($data["isread"]=="0"){
			//修改状态
			M('email')->save(array('id'=>$id,'isread'=>1));
			
		}
		echo $data['content'];
	}
	//计算当时未读邮件的数量
	public function getCount(){
		if(IS_AJAX){
			$model=M('email');
			//查询当前用户未读邮件的数量
			$data=$model->where("isread = 0 and to_id=" . session('id'))->count();
			echo $data;
			
		}
	}
	public function delete(){
	    $id=I('get.id');
	    $model=M('email');
	    $res=$model->delete($id);
		if($res){
			$this->success('删除成功',U('recBox'),1);			
		}else{
			$this->error('删除失败');
		}
	}
	
}
?>