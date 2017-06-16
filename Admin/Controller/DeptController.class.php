<?php
namespace Admin\Controller;
//继承中间控制器
class DeptController extends CommonController{
    public function add(){
    	//判断请求类型
    	if(IS_POST){
    		//处理表单提交   接收提交的所有数据
//     		$post=I('post.');
//     		dump($post);
    		//读入数据
    		//$model=M('dept');
    		//需要进行验证时，因为验证规则定义在了自定义模型中，所以必须实例化自定义模型，需要使用D方法
    		$model=D('dept');
    		//数据对象创建
            $result=$model->create();  //不传递参数则默认接收所有post提交的数据    若自动验证失败，则返回false
           //dump($result); die();
           if(!$result){
           	//则说明验证失败，输出错误提示,返回之前页面
            //	echo $model->getError();
           /* 	array(2) {
           		["name"] => string(24) "部门名称不能为空"
           				["sort"] => string(24) "该字段必须是数字"
           	} */
            //dump($model->getError());exit();  
           	$this->error($model->getError()); exit();
           }
//     		$res=$model->add($post);
            $res=$model->add();
    		if($res){
    			$this->success('添加成功',U('showlist'),3);   
    			//$this->success('添加成功');
    		}else{
    			$this->error('添加失败');
    		}
    		
    	}else{
    		//查询出顶级部门
    		$dept=M('dept');
    		$data=$dept->where('pid=0')->select();
    		//     	dump($data);
    		$this->assign('dept',$data);
    		$this->display();
    	}
    
    }
    //展示部门列表
    public function showList(){
    	$model=M('dept');
    	
    
    	//查询
    	$data=$model->order('sort asc')->select();
    	//二次遍历查询顶级部门
    	foreach ($data as $key=>$value){
    	/* 	array(5) {
        ["id"] => string(1) "5"
        ["name"] => string(9) "财务部"
        ["pid"] => string(1) "0"
        ["sort"] => string(1) "0"
        ["remark"] => string(4) "1223"
        } */
        //dump($value);die();
        if($value['pid']>0){
        	//查询pid对应的部门名称
        	$info=$model->find($value['pid']);
//         	dump($info);die();
            //保留该条信息中的name
//             dump($info['name']);die();
            $data[$key]['deptname']=$info['name'];
        	
        }
    	}
    	//使用load方法载入文件
    	load('@/tree');
    	$data=getTree($data);
//     	dump($data);die(); ["level"] => int(1)  0表示顶级，1表示下一级
//     	dump($data);die();
    	$this->assign('data',$data);
    	$this->display();
    }
    
    //编辑部门功能
    public function edit(){
    	if(IS_POST){
    		//处理Post请求
    		/* $post=I('post.');
    		$res=$dept->save($post); */
    		$dept=M('dept');
    		$dept->create();
    		$res=$dept->save();
     		if($res!==false){
            	$this->success('修改成功',U('showList'),2);
            }else{
            	$this->error('修改失败');
            }   		
    		
    	}else{
    		//展示模版
    		//接收id
    		$id=I('get.id');
    		//查询部门信息
    		$model=M('dept');
    		$data=$model->find($id);
    		//查询全部的部门信息
    		$info=$model->where("id!= $id")->select();
    		$this->assign('data',$data);
    		$this->assign('info',$info);
    		//展示模版
    		$this->display();
    	}
    	
    }
    
    //删除：单个删除和批量删除
    public function delete(){
    	//接收参数
    	$id=I('get.id');
    	$dept=M('dept');
    	$res=$dept->delete($id);
    	if($res){
    		//删除成功
    		$this->success('删除成功','',0);  		
    	}else{
    		$this->success('删除失败','',0);
    	}
    }

}
?>