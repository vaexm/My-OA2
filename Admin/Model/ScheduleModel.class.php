<?php
namespace Admin\Model;
use Think\Model;
class ScheduleModel extends Model{
    //保存数据
    public function saveData($data,$file){
        //先判断是否有文件需要处理
        if(!$file['error']){
            //定义配置
            $config=array(
                //配置上传路径  localhost\TP-OA\(工作目录)(__DIR__)   \Public\Upload(上传根目录)
                'rootPath'=>WORKING_PATH.UPLOAD_ROOT_PATH
            );
            //说明有文件需要上传  处理上传
            $upload=new \Think\Upload($config);
            //开始上传
            $info=$upload->uploadOne($file);
            /* 	array(9) {
             ["name"] => string(10) "Desert.jpg"
             ["type"] => string(10) "image/jpeg"
             ["size"] => int(845941)
             ["key"] => int(0)
             ["ext"] => string(3) "jpg"
             ["md5"] => string(32) "ba45c8f60456a672e003a875e469d0eb"
             ["sha1"] => string(40) "30420d1a9afb2bcb60335812569af4435a59ce17"
             ["savename"] => string(17) "5841327b01744.jpg"
             ["savepath"] => string(11) "2016-12-02/"
             }
            dump($info);die();   带有九个元素的一维数组   表明上传成功*/
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
        // 		dump($data);die();  可以看到该条公文的所有字段
        //$model=M("doc");
        $res=$this->add($data);
        return $res;
    }
    
}
?>