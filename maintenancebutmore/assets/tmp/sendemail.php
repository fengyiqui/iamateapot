<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-8
 * Time: 下午6:55
 */
require_once('../../thirdparty/PHPMailer/PHPMailerAutoload.php');
$work_dir="../../thirdparty/PHPMailer/examples/";
//Create a new PHPMailer instance
//Passing true to the constructor enables the use of exceptions for error handling
try {
//Create a new PHPMailer instance
$mail = new PHPMailer;
$mail->CharSet    ="UTF-8";
//Tell PHPMailer to use SMTP
$mail->isSMTP();
//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug = 0;
//Ask for HTML-friendly debug output
$mail->Debugoutput = 'html';
//Set the hostname of the mail server
$mail->Host = "hostname.hostname.net";
//Set the SMTP port number - likely to be 25, 465 or 587
$mail->Port = 25;
//Whether to use SMTP authentication
$mail->SMTPAuth = true;
//Username to use for SMTP authentication
$mail->Username = "example@example.net";
//Password to use for SMTP authentication
$mail->Password = "example";
//Set who the message is to be sent from
$mail->setFrom('example@example.net', 'First Last');
//Set an alternative reply-to address
//$mail->addReplyTo('example@example.net', 'First Last');
//Set who the message is to be sent to
$mail->addAddress('example@example.com', 'John Doe');
//$mail->addAddress('example@example.com', 'John 1');
//Set the subject line
$mail->Subject = 'PHPMailer SMTP test';
//Read an HTML message body from an external file, convert referenced images to embedded,
//convert HTML into a basic plain-text alternative body
$msg="提取大区： 全服dr<br/>提取数据库：GAMED<br/>查询条件SQL：文字或者SQL都可以<br\><br\>本邮件附件";
//$mail->msgHTML(file_get_contents($work_dir.'contentsutf8.html'), dirname(__FILE__));
$mail->msgHTML($msg, dirname(__FILE__));
//Replace the plain text body with one created manually
$mail->AltBody = 'This is a plain-text message body';
//Attach an image file
$mail->addAttachment($work_dir.'images/phpmailer_mini.png');
//$mail->addAttachment($work_dir.'images/278856.jpg');

//send the message, check for errors
if (!$mail->send()) {
    echo "Mailer Error: " . $mail->ErrorInfo;
} else {
    echo "Message sent!";
}
$mail->clearAddresses();
$mail->clearAttachments();
} catch (phpmailerException $e) {
    echo $e->errorMessage(); //Pretty error messages from PHPMailer
} catch (Exception $e) {
    echo $e->getMessage(); //Boring error messages from anything else!
}
