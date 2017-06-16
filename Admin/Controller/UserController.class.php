<?php
namespace Admin\Controller;
use  Think\Controller;
class UserController extends CommonController{
	//实现职员的添加功能
	public function add(){
		if(IS_POST){
			$model=M('user');
			$data=$model->create();
			$data["addtime"]=time();
			$res=$model->add($data);
			if($res){
				//添加成功
				$this->success('添加成功',U('showList'),1);
			}else{
				$this->error('添加失败');
			}
			
		}else{
			//查询部门信息
			$dept=M('dept');
			$data=$dept->field('id,name')->select();
			$this->assign('data',$data);
			$this->display();
		}
	
	}
	//展示职员信息
	public function showList(){
		//实现分页功能，查询总的记录数
		$model=M('user');
		$count=$model->count();
		//实例化分页类,传递参数
		$page=new \Think\Page($count,4);
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
        $data=$model->field('t1.*,t2.name as deptname')->table('sp_user as t1,sp_dept as t2')->where('t1.dept_id=t2.id')
        ->limit($page->firstRow,$page->listRows) ->select();
//         print_r($data);exit();
        //六:
		$this->assign('data',$data);
		//总的记录数
		$this->assign('count',$count);
		//每页显示的条数
		$this->assign('row',$page->listRows);
		$this->assign('show',$show);
		//七:展示模板:
		$this->display();
	}
	
	//编辑信息
	public function edit(){
		//判断是否点击提交按钮
		if(IS_POST){
			//处理post请求
			$user=M('user');
	        $data=$user->create();//收集到了所有的信息
			$res=$user->save();
			if($res!==false){
				$this->success('修改成功',U("showList"),1);				
			}else{
				$this->error('修改失败');
			}			
			
		}else {
			//展示模板
			//接收id
			$id=I('get.id');
			//查询职员信息
			$model=M('user');
			$data=$model->find($id);
			//查询所有部门信息
			$dept=M('dept');
			$dInfo=$dept->select();
			$this->assign('dept',$dInfo);
			$this->assign('data',$data);			
			$this->display();
		}		
	}
	public function delete(){
		//接收id
		$id=I('get.id');
		$user=M('user');
		$res=$user->delete($id);
		if($res){
			$this->success('删除成功',U('showList'),1);			
		}else{
			$this->error('删除失败');
		}
	}
	//查询各个部门的人数
	public function charts(){
		$model=M();
		$data=$model->field('t2.name as deptname,count(*) as count')->table('sp_user as t1,sp_dept as t2')->where('t1.dept_id=t2.id')
		->group('deptname')->select();
		//dump($data);die();
        $str='[';
        foreach ($data as $key=>$value){
        	$str.="['".$value['deptname'] ."'," . $value["count"]. "],";     	
        }
        //去除最后的逗号
        $str=rtrim($str,','). "]";
        //echo $str;die;
//         dump($str);die;
          $this->assign('str',$str);
		  $this->display();
	}
}
?>