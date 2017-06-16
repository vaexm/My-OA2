<?php
/**
 * 
 * @authors	YANG DINGYUAN (yangdingyuan@itcast.cn)
 * @date    2016-05-28 00:28:20
 * @url 	http://dwz.cn/920815
 * @desc	thinkphp自定义函数库...
 *
 */

/**  
 *字符串截取函数
 *开启mbstring扩展
 */
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true){
    if(mb_strlen($str,$charset)>$length)
    {
        if(function_exists("mb_substr")){
            if($suffix)
                return mb_substr($str, $start, $length, $charset)."...";
            else
                return mb_substr($str, $start, $length, $charset);
        }elseif(function_exists('iconv_substr')) {
            if($suffix)
                return iconv_substr($str,$start,$length,$charset)."...";
            else
                return iconv_substr($str,$start,$length,$charset);
        }
        $re['utf-8'] = "/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/";
        $re['gb2312'] = "/[x01-x7f]|[xb0-xf7][xa0-xfe]/";
        $re['gbk'] = "/[x01-x7f]|[x81-xfe][x40-xfe]/";
        $re['big5'] = "/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
        if($suffix) return $slice."…";
        return $slice;
    }
    else
    {
        return $str;
    }
}

/**
 * GET 请求
 * 需要curl扩展支持
 */
function http_get($url){
    $oCurl = curl_init();
    if(stripos($url,"https://")!==FALSE){
        curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($oCurl, CURLOPT_SSLVERSION, 1);
    }
    curl_setopt($oCurl, CURLOPT_URL, $url);
    curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
    $sContent = curl_exec($oCurl);
    $aStatus = curl_getinfo($oCurl);
    curl_close($oCurl);
    if(intval($aStatus["http_code"])==200){
        return $sContent;
    }else{
        return false;
    }
}

/**
 * POST 请求
 * 需要curl扩展支持
 */
function http_post($url,$param,$post_file=false){
    $oCurl = curl_init();
    if(stripos($url,"https://") !== FALSE){
        curl_setopt($oCurl,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($oCurl,CURLOPT_SSL_VERIFYHOST,false);
        curl_setopt($oCurl,CURLOPT_SSLVERSION,1);
    }
    if (is_string($param) || $post_file){
        $strPOST = $param;
    } else {
        $aPOST = array();
        foreach($param as $key => $val){
            $aPOST[] = $key."=" . urlencode($val);
        }
        $strPOST = join("&",$aPOST);
    }
    curl_setopt($oCurl,CURLOPT_URL,$url);
    curl_setopt($oCurl,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($oCurl,CURLOPT_POST,true);
    curl_setopt($oCurl,CURLOPT_POSTFIELDS,$strPOST);
    $sContent = curl_exec($oCurl);
    $aStatus = curl_getinfo($oCurl);
    curl_close($oCurl);
    if(intval($aStatus["http_code"]) == 200){
        return $sContent;
    }else{
        return false;
    }
}

/**
 * 空格换行符过滤
 */
function trimAll($parma){
    if(is_array($parma)){
        return array_map('trimAll',$parma);
    }
    $before = array(" ","   ","\t","\r","\n");
    $after = array('','','','','');
    return str_replace($before,$after,$parma);
}
function get_system_config($code) {
    $model = M("SystemConfig");
    $where['code'] = array('eq', $code);
    $count = $model -> where($where) -> count();
    if ($count > 1) {
        return $model -> where($where) -> getfield("val,name");
    } else {
        return $model -> where($where) -> getfield("val");
    }
}


//发送邮件的函数
/* function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null){

     $config = C('THINK_EMAIL');

     Vendor('PHPMailer.class#phpmailer'); //从PHPMailer目录导class.phpmailer.php类文件
    vendor('SMTP');
    $mail = new phpmailer(); //PHPMailer对象

    $mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码

    $mail->IsSMTP(); // 设定使用SMTP服务

    $mail->SMTPDebug = 0; // 关闭SMTP调试功能

    // 1 = errors and messages

    // 2 = messages only

    $mail->SMTPAuth = true; // 启用 SMTP 验证功能

    $mail->SMTPSecure = 'ssl'; // 使用安全协议

    $mail->Host = $config['SMTP_HOST']; // SMTP 服务器

    $mail->Port = $config['SMTP_PORT']; // SMTP服务器的端口号

    $mail->Username = $config['SMTP_USER']; // SMTP服务器用户名

    $mail->Password = $config['SMTP_PASS']; // SMTP服务器密码

    $mail->SetFrom($config['FROM_EMAIL'], $config['FROM_NAME']);

    $replyEmail = $config['REPLY_EMAIL']?$config['REPLY_EMAIL']:$config['FROM_EMAIL'];

    $replyName = $config['REPLY_NAME']?$config['REPLY_NAME']:$config['FROM_NAME'];

    $mail->AddReplyTo($replyEmail, $replyName);

    $mail->Subject = $subject;

    $mail->AltBody = "为了查看该邮件，请切换到支持 HTML 的邮件客户端";

    $mail->MsgHTML($body);

    $mail->AddAddress($to, $name);

    if(is_array($attachment)){ // 添加附件

        foreach ($attachment as $file){

            is_file($file) && $mail->AddAttachment($file);

        }

    }

    return $mail->Send() ? true : $mail->ErrorInfo;

}  */
function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null){
    vendor('PHPMailer.class#phpmailer');
    $phpmailer=new PHPMailer();
    $phpmailer->IsSMTP();//用smtp协议来发
    $phpmailer->Host='smtp.163.com';
    //$phpmailer->Port=25;
    $phpmailer->SMTPAuth=true;
    $phpmailer->Username="18829342787@163.com";
    $phpmailer->Password="5897279MRFX";
    //可以发信
    $phpmailer->From="18829342787@163.com";
    $phpmailer->FromName="Vae";
    $phpmailer->Subject=$subject;//主题
    $phpmailer->Body=$body;
    //设置收信人
    $phpmailer->AddAddress('1148423590@qq.com','Vae');
    if(is_array($attachment)){ // 添加附件
       // echo "123"; die();
        foreach ($attachment as $file){
    
            is_file($file) && $phpmailer->AddAttachment($file);
    
        }
    
    }
    
    return  $phpmailer->Send()?'ok':'fail';
}