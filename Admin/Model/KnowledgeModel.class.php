<?php
namespace Admin\Model;
use Think\Model;
class KnowledgeModel extends Model{
	//添加数据的方法s
	/* public function addData($post,$file){
		//判断是否有文件需要处理
		/* 	array(5) {
		 ["name"] => string(10) "Tulips.jpg"
		 ["type"] => string(10) "image/jpeg"
		 //临时文件对应的文字
		 ["tmp_name"] => string(24) "C:\xampp\tmp\phpBF2B.tmp"
		 ["error"] => int(0)
		 ["size"] => int(620888)a
		 } */
		//dump($file);die();
		//要求size>0或者error==0
		/* if($file["error"]==0){
// 			echo "123";
			//有文件
			//上传类的配置
			$config=array('rootPath'=>WORKING_PATH.UPLOAD_ROOT_PATH);
			$upload=new \Think\Upload($config);
			$info=$upload->uploadOne($file);
			
// 			dump($info);die();
            if($info){
            	//补全字段
            	$post['picture']=UPLOAD_ROOT_PATH.$info['savepath'].$info['savename'];
            	//制作缩略图  Image.class.php
            	//实例化类
            	$image=new \Think\Image();
            	//打开图片  图片路径
            	$image->open(WORKING_PATH.$post['picture']);
            	//等比缩放
            	$image->thumb(100, 100);
            	//保存图片  传递完整路径（目录+文件名）
            	$image->save(WORKING_PATH.UPLOAD_ROOT_PATH.$info['savepath']."thumb_".$info["savename"]);
            	//补全thumb字段
            	$post["thumb"]='/TP-OA'.UPLOAD_ROOT_PATH.$info['savepath']."thumb_".$info["savename"];
       
            }
            
						
		}
		//补全字段
		$post['addtime']=time();
		return $this->add($post);
	}  */
    
    //保存数据
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
}
?>