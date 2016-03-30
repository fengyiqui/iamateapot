<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-9
 * Time: 下午3:59
 */
require_once('../../thirdparty/PHPMailer/PHPMailerAutoload.php');

class mymailercfg
{
    public function __construct()
    {
        $this->charSet    = "UTF-8";
        $this->debugSMTP  = 0;
        $this->debugSMTP  = "html";
        $this->host       = "";
        $this->port       = 25;
        $this->authSMTP   = true;
        $this->username   = "";
        $this->password   = "";
        $this->from_addr  = "";
        $this->from_name  = "";
        $this->arr_dst_addr = "";
        $this->subject    = "";
        $this->arr_attachment ="";
    }
    //如果想控制的更精确，直接改成员吧
    public function SetSimpleCfg($host,$username,$password,$from_addr,$from_name,$arr_dst_addr,$subject,$contents,$arr_attachment)
    {
        $this->host         = $host;
        $this->username     = $username;
        $this->password     = $password;
        $this->from_addr    = $from_addr;
        $this->from_name    = $from_name;
        $this->arr_dst_addr = $arr_dst_addr;
        $this->subject      = $subject;
        $this->contents     = $contents;
        $this->arr_attachment = $arr_attachment;
    }
    public function  to_string()
    {
        $tmp_str = "";
        foreach($this->arr_dst_addr as $key=>$value)
        {
            if( $tmp_str == "")
                $tmp_str.=$key.",".$value;
            else
                $tmp_str.=",".$key.",".$value;
        }
        return "host: ".$this->host." username: ".$this->username." passwd: ".$this->password
                ." from_addr: ". $this->from_addr." from_name: ".$this->from_name." dst_addr: ".$tmp_str
                ." subject: ".$this->subject." contents: ".$this->contents;
    }

    public $charSet;
    //Enable SMTP debugging
    // 0 = off (for production use)
    // 1 = client messages
    // 2 = client and server messages
    public $debugSMTP;
    //Ask for HTML-friendly debug output
    public $debugoutput;
    //Set the hostname of the mail server
    public $host;
    //Set the SMTP port number - likely to be 25, 465 or 587
    public $port;
    //Whether to use SMTP authentication,如果是true需要给下两项赋值($username,$password)
    public $authSMTP;
    //Username to use for SMTP authentication
    public $username;
    //Password to use for SMTP authentication
    public $password;
    //Set who the message is to be sent from
    public $from_addr;
    public $from_name;
    //Set who the message is to be sent to
    public $arr_dst_addr;   //是一个数组 键是dst_addr 值是name
    //Set the subject line
    public $subject;        //邮件标题
    public $contents;       //邮件内容，可以是html tag的
    public $arr_attachment;//附件的数组，键是idx，值是路径，可以带格式的

}
class mymailer_SMTP
{
    //TODO: 这里应该做些响应的检查，如果检查失败可以记录日志或者抛出异常
    public function __construct(mymailercfg $cfg)
    {
        try
        {
            $this->phpMailer              = new PHPMailer;
            $this->phpMailer->CharSet     = $cfg->charSet;
            $this->phpMailer->isSMTP();
            $this->phpMailer->SMTPDebug   = $cfg->debugSMTP;
            $this->phpMailer->Debugoutput = $cfg->debugoutput;
            $this->phpMailer->Host        = $cfg->host;
            $this->phpMailer->Port        = $cfg->port;
            $this->phpMailer->SMTPAuth    = $cfg->authSMTP;
            if($this->phpMailer->SMTPAuth == true)
            {
                $this->phpMailer->Username = $cfg->username;
                $this->phpMailer->Password = $cfg->password;
            }
            $tmp_from_name=$cfg->from_name;
            if($cfg->from_name != "")
                $tmp_from_name = $cfg->from_addr;
            $this->phpMailer->setFrom($cfg->from_addr, $tmp_from_name);
            $this->phpMailer->addReplyTo($cfg->from_addr, $tmp_from_name);      //不清楚是做什么用的
            foreach($cfg->arr_dst_addr as $key=>$value)
            {
                $this->phpMailer->addAddress($key,$value);
            }
            $this->phpMailer->Subject     = $cfg->subject;
            $this->phpMailer->msgHTML($cfg->contents, dirname(__FILE__));
            $this->phpMailer->AltBody = 'This is a plain-text message body';    //不清楚是做什么用的
            if(is_array($cfg->arr_attachment))
            {
                foreach($cfg->arr_attachment as $key=>$value)
                {
                    $this->phpMailer->addAttachment($value);
                }
            }
            else
            {
                echo "<br/> in mymailer.php cfg->arr_attachment is not an array<br/>";
            }

        } catch (phpmailerException $e)
        {
            echo $e->errorMessage(); //Pretty error messages from PHPMailer
        } catch (Exception $e)
        {
            echo $e->getMessage(); //Boring error messages from anything else!
        }

    }
    private function SetFromAddr($from_addr,$from_name)
    {
        if($from_addr == "")
        {
            return;
        }
        $tmp_from_name=$from_name;
        if($from_name != "")
            $tmp_from_name = $from_addr;
        $this->phpMailer->setFrom($from_addr, $tmp_from_name);
        $this->phpMailer->addReplyTo($from_addr, $tmp_from_name);      //不清楚是做什么用的
    }
    private function SetDstAddr($arr_dst_addr)
    {
        if($arr_dst_addr == "")
            return;
        foreach($arr_dst_addr as $key=>$value)
        {
            $this->phpMailer->addAddress($key,$value);
        }
    }
    private function SetSubject($subject)
    {
        if($subject == "")
            return;
        $this->phpMailer->Subject     = $subject;
    }
    private function SetContents($contents)
    {
        if($contents == "")
            return;
        $this->phpMailer->msgHTML($contents, dirname(__FILE__));
        $this->phpMailer->AltBody = 'This is a plain-text message body';    //不清楚是做什么用的
    }
    private function SetAttachments($arr_attachment)
    {
        if($arr_attachment == "")
            return;
        foreach($arr_attachment as $key=>$value)
        {
            $this->phpMailer->addAttachment($value);
        }
    }
    //如果这里指定了参数，会覆盖构造函数里指定的参数
    public function SendMail($from_addr = "",$from_name = "",$arr_dst_addr = "",$subject = "",$contents = "",$arr_attachment = "")
    {
        try
        {
            $this->SetFromAddr($from_addr,$from_name);
            $this->SetDstAddr($arr_dst_addr);

            $this->SetSubject($subject);
            $this->SetContents($contents);
            $this->SetAttachments($arr_attachment);
            if (!$this->phpMailer->send())
            {
                echo "Mailer Error: " . $this->phpMailer->ErrorInfo;
            } else {
                echo "Message sent!";
            }
            $this->phpMailer->clearAddresses();
            $this->phpMailer->clearAttachments();
        } catch (phpmailerException $e)
        {
            echo $e->errorMessage(); //Pretty error messages from PHPMailer
        } catch (Exception $e)
        {
            echo $e->getMessage(); //Boring error messages from anything else!
        }
    }
    private $phpMailer;

}