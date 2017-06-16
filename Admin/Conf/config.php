<?php
return array(
	//'配置项'=>'配置值'
		/* 数据库设置 */
		'DB_TYPE'               =>  'mysql',     // 数据库类型
		'DB_HOST'               =>  'localhost', // 服务器地址
		'DB_NAME'               =>  'oa',          // 数据库名
		'DB_USER'               =>  'root',      // 用户名
		'DB_PWD'                =>  '123456',          // 密码
		'DB_PORT'               =>  '3306',        // 端口
		'DB_PREFIX'             =>  'sp_',    // 数据库表前缀
		'DB_CHARSET'            =>  'utf8',      // 数据库编码默认采用utf8
		
		'SHOW_PAGE_TRACE'      =>'true'	,
    //邮件配置
'THINK_EMAIL' => array(
    'SMTP_HOST'   => 'smtp.163.com', //SMTP服务器
    'SMTP_PORT'   => '25', //SMTP服务器端口
    'SMTP_USER'   => '18829342787@163.com', //SMTP服务器用户名
    'SMTP_PASS'   => '5897279MRFX', //SMTP服务器密码
    'FROM_EMAIL'  => '18829342787@163.com', //发件人EMAIL
    'FROM_NAME'   => 'Vae', //发件人名称
    'REPLY_EMAIL' => '', //回复EMAIL（留空则为发件人EMAIL）
    'REPLY_NAME'  => '', //回复名称（留空则为发件人名称）
)
);
