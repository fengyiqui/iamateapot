<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-9
 * Time: 下午6:30
 */
require_once('../common/mymailer.php');
echo "hello2";
printf("hie");

$cfg = new mymailercfg();
$arr_address["example@example.com"] = "Jone";
$cfg->SetSimpleCfg("smtp.sina.net",
    "example@example.net",
    "example",
    "example@example.net",
    "",
    $arr_address,
    "example",
    "example,world",
    "");
echo "hello1";
$obj = new mymailer_SMTP($cfg);
$obj->SendMail();