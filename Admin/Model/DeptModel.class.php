<?php
namespace Admin\Model;
use Think\Model;
class DeptModel extends Model{
	//开启批量验证   则表示一次性验证所有 字段，返回多个错误信息
	//protected $patchValidate=true;
	//字段映射定义
	/* protected $_map =array(
		//映射规则
		//键是表单中的name值，值是数据表中的字段值
		'dname'=>'name',
		'id'=>'pid',
		'so'=>'sort'
	); */
	//自动验证定义
	/* protected $_validate=array(
		//针对部门名称的验证,必填，不能为空
		array('name','require','部门名称不能为空'),
		array('name','','部门名称必须唯一','0','unique'),
	    //排序字段的验证,数字
	    array('sort','number','该字段必须是数字'),
		//使用函数的方式来验证该字段是否为数字
// 		array('sort','is_numeric','该字段必须是数字',0,'function')
        
	); */
}
?>