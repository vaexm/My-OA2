<?php

define('APP_DEBUG',true);				//开启调式模式
define('ADMIN_CSS_URL', '/TP-OA/Public/Admin/css/');
define('ADMIN_IMAGES_URL', '/TP-OA/Public/Admin/images/');
define('ADMIN_JS_URL', '/TP-OA/Public/Admin/js/');
//定义工作路径
define('WORKING_PATH',str_replace('\\', '/',__DIR__));
//定义上传根目录
define('UPLOAD_ROOT_PATH', '/Public/Upload/');
// echo WORKING_PATH.UPLOAD_ROOT_PATH;die();C:/xampp/htdocs/TP-OA/Public/Upload/

require ('./ThinkPHP/ThinkPHP.php'); 	// 加载框架入口文件
?>
