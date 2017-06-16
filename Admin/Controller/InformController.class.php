<?php
namespace Admin\Controller;
class InformController extends CommonController{
    public function showlist(){
        $model=M('inform');
        $count=$model->count();
        //实例化分页类,传递参数
        $page=new \Think\Page($count,3);
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
        //print_r($data); die();
        //总的记录数
        $this->assign('count',$count);
        //每页显示的条数
        $this->assign('row',$page->listRows);
        $this->assign('show',$show);
        //七:展示模板:
        $this->display();
    }
    
    public function edit(){
        $id=I('get.id');
        $model=M('inform');
        $data=$model->find($id)->select();
    }
    public function showContent(){
        //接收id
        $id=I('get.id');
        $data=M('inform')->find($id);
        //输出内容，并且还原被转移的字符
        echo htmlspecialchars_decode($data['content']);
    }
  
}
?>