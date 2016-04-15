<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-3-30
 * Time: 下午6:08
 */
//曾经鄙视别人这么多，我也这么做了，。。。
$arr_area["10 葫芦山"]=10;
$arr_area["11 沙子洲"]=11;
$arr_area["12 锦绣林"]=12;
$arr_area["16 碧波潭"]=16;
$arr_area["20 凌霄殿"]=20;
$arr_area["22 通天河"]=22;
$arr_area["30 钱宁河"]=30;
$arr_area["31 天枢观"]=31;
$arr_area["40 喇叭口"]=40;
$arr_area["41 仙君阁"]=41;
$arr_area["50 白云洞"]=50;
$arr_area["60 落雁坡"]=60;
$arr_area["70 东坡林"]=70;
$arr_area["80 黎阳道"]=80;
$arr_area["81 摩云山"]=81;
$arr_area["83 黑风岭"]=83;
$arr_area["110 盘陀岭"]=110;
$arr_area["120 青濡口"]=120;
$arr_area["130 白龙湖"]=130;
$arr_area["132 两界山"]=132;
$arr_area["140 不周山"]=140;
$arr_area["150 紫岚山"]=150;
$arr_area["156 鬼谷洞"]=156;
$arr_area["170 蓬莱岛"]=170;
$arr_area["231 曦枫崖"]=231;
$arr_area["236 登仙楼"]=236;
$arr_area["237 栖霞洞"]=237;
$arr_area["238 女儿国"]=238;
$arr_area["3   栖雁山"]=3;

$arr_flag_type["bit"]="bit";
$arr_flag_type["qbit"]="bit";
$arr_flag_type["byte"]="byte";
$arr_flag_type["word"]="word";
$arr_flag_type["dword"]="dword";
$arr_flag_type["qword"]="qword";

$arr_compress["压缩"]=1;
$arr_compress["非压缩"]=0;

function auto_fill_option($arr)
{

    foreach($arr as $key=>$value)
    {
        printf("<option value='%s'>%s</option>",$value,$key);
    }
}
define("debug_info"     ,0,true);
define("debug_warning"  ,1,true);
define("debug_err"      ,2,true);
define("debug_fatal"    ,3,true);
function log_err($str,$level=debug_info,$file_name=__FILE__,$line_num=__LINE__)
{
    if($level >= 0)
        echo $str.$file_name." ".$line_num."<br\>";
}
function save_to_file($str,$file_path,$mode="wb")
{
    $file_h = fopen($file_path,$mode);
    if($file_h != FALSE)
    {
        fwrite($file_h,$str);
        fclose($file_h);
    }
    else
    {
        log_err("can not open file:".$file_path);
    }
}
/*function writeLog($data) {
    list($usec, $sec) = explode(' ', microtime());
    $datetime = strftime("%Y%m%d %H:%M:%S",time());
    $msg = "$datetime'". sprintf("%06s",intval($usec*1000000)).": $data";
    $save_path = 'foo.txt';
    $fp = @fopen($save_path, 'a'); // open or create the file for writing and append info
    fputs($fp, "$msg\n"); // write the data in the opened file
    fclose($fp); // close the file
}*/