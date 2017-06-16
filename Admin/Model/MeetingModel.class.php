<?php
namespace Admin\Model;
use Think\Model;
class MeetingModel extends Model{
    public function saveData($data,$file){
        //先判断是否有文件需要处理
        // dump($file);
        if(!$file['error']){
            // echo "123";
            //定义配置
            $config=array(
                //配置上传路径  localhost\TP-OA\(工作目录)(__DIR__)   \Public\Upload(上传根目录)
                'rootPath'=>WORKING_PATH.UPLOAD_ROOT_PATH
            );
            //说明有文件需要上传  处理上传
            $upload=new \Think\Upload($config);
            //开始上传
            $info=$upload->uploadOne($file);
            //判断是否上传成功
            if($info){
                //图片完整路径   C:\xampp\htdocs\TP-OA\Public\Upload\2016-12-02\5841327b01744.jpg
                //补全剩余的三个字段
                $data['filepath']=UPLOAD_ROOT_PATH.$info['savepath'].$info['savename'];
                //文件的原始名称
                $data['filename']=$info['name'];
                $data['hasfile']=1;
            }
             
             
        }
        $data["addtime"]=time();
        //dump($data);die();  //可以看到该条公文的所有字段
        //$model=M("doc");
        $res=$this->add($data);
        return $res;
    }
    public function updateData($data,$file){
        //如果有附件则处理附件
        if(!$file["error"]){
            $config=array(
                //配置上传路径  localhost\TP-OA\(工作目录)(__DIR__)   \Public\Upload(上传根目录)
                'rootPath'=>WORKING_PATH.UPLOAD_ROOT_PATH
            );
            //处理文件上传
            $upload=new \Think\Upload($config);
            $info=$upload->uploadOne($file);
            //判断是否处理上传成功
            if($info){
                $data['filepath']=UPLOAD_ROOT_PATH.$info['savepath'].$info['savename'];
                //文件的原始名称
                $data['filename']=$info['name'];
                $data['hasfile']=1;
            }
            	
        }
        $res=$this->save($data);
        return $res;
    }
}
?>