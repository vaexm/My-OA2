<?php
namespace Admin\Model;
use Think\Model;
class EmailModel extends Model{
	public function addData($post,$file){
		if($file["error"]==0){
// 						echo "123";
			//有文件
			//上传类的配置
			$config=array('rootPath'=>WORKING_PATH.UPLOAD_ROOT_PATH);
			$upload=new \Think\Upload($config);
			$info=$upload->uploadOne($file);
				
// 		   dump($info);
			if($info){
				//补全字段
				$post['file']=UPLOAD_ROOT_PATH.$info['savepath'].$info['savename'];
				$post['hasfile']=1;
				$post['filename']=$info['name'];				 
			}
			$post['form_id']=session('id');
		    $post['addtime']=time();
// 		    dump($post);die();
		    return $this->add($post);
		}
		
	}
	
	
} 
?>