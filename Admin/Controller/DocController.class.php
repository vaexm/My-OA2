<?php
namespace Admin\Controller;
class DocController extends CommonController{
	public function add(){
		if(IS_POST){
		    //接收数据
		    $post=I('post.');
		    //实例化自定义模型
		    $model=D('doc');
		    //dump($_FILES);die();
		    //数据保存
		    $res=$model->saveData($post,$_FILES['file']);
			if($res){
				$this->success('添加成功',U("showList"),1);				
			}else{
				$this->error('添加失败');
			}
			
		}else{
			$this->display();
		}
		
	}
	//展示功能
	public function showList(){
		//查询
		$model=M('doc');
		$count=$model->count();
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
		$data=$model->limit($page->firstRow,$page->listRows) ->select();
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
	//附件的下载
	public function download(){
		//接收id
		$id=I('get.id');
		//查询数据
		$model=M('doc');
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
	//编辑公文
	public function edit(){
		if(IS_POST){
			//处理修改请求
			$post=I('post.');
			$model=D('doc');
			$res=$model->updateData($post,$_FILES['file']);
			if($res){
				$this->success('修改成功',U('showList'),1);
				
			}else{
				$this->error('修改失败');
			}
			
		}else{
			//接收id
			$id=I("get.id");
			$model=M('doc');
			$data=$model->find($id);
			$this->assign('data',$data);
			$this->display();
		}	 
	}
	public function showContent(){
		//接收id
		$id=I('get.id');
		$data=M('doc')->find($id);
		//输出内容，并且还原被转移的字符
		echo htmlspecialchars_decode($data['content']);
	}
}
?>