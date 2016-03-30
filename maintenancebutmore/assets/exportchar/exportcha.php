<?php
include_once("../common/header_consts.php");
include_once("../sql/item/item.php");
require_once('../common/mymailer.php');
include_once("../common/area_id_option.php");
$desc="用于发送提取cha的邮件";
?>
<html>
<head>
    <meta charset="utf-8">
    <title>maintancebutmore</title>
    <script src="<?php echo($header_consts_date_control_path); ?>"></script>
</head>

<body>

<?php

// 加个@防止warning
if("" !=  $_POST["cfg"])
{
    $mycfg          =  $_POST["cfg"];
    $tmp_arr        = explode(",",$mycfg);
    $host           = $tmp_arr[0];
    $username       = $tmp_arr[1];
    $passwd         = $tmp_arr[2];
    $from_addr      = $tmp_arr[3];
    $from_name      = $tmp_arr[4];
    $tmp_dst_addr   = explode(":",$tmp_arr[5]);
    foreach($tmp_dst_addr as $key=>$value)
    {
        $arr_dst_addr[$value]=$value;
    }
   // var_dump($tmp_dst_addr);
    $subject_format = $tmp_arr[6];//xxx%s
    $con_format     = $tmp_arr[7];
    $subject=sprintf($subject_format,$_POST["area_id"]);
    $subject.="_".$_POST["char_name"];
    $contests= sprintf($con_format,$_POST["area_id"],$_POST["char_name"]);
    $cfg = new mymailercfg();
    $cfg->SetSimpleCfg($host,
        $username,
        $passwd,
        $from_addr,
        $from_name,
        $arr_dst_addr,
        $subject,
        $contests,
        "");
    //$cfg->debugSMTP = 3;
    //echo $cfg->to_string();
    $obj = new mymailer_SMTP($cfg);
    $obj->SendMail();

    //TODO： charid sql生成器？
}
else
{
    ?>
    <p>
        <?php echo ($desc); ?>
    </p>
    <pre>
        <form name="exportcha" action="" method="post">
            开始日：<input name="log_datetime1" class="laydate-icon" id="start" style="width:200px; margin-right:10px; value="1970-01-01 00:00:00">
            结束日：<input name="log_datetime2" class="laydate-icon" id="end" style="width:200px;">
            <script>
                var start = {
                    elem: '#start',
                    format: 'YYYY-MM-DD hh:mm:ss',
                    min: '1970-01-01 00:00:00', //设定最小日期为当前日期
                    max: '2099-06-16 23:59:59', //最大日期
                    istime: true,
                    istoday: true,
                    choose: function(datas){
                        end.min = datas; //开始日选好后，重置结束日的最小日期
                        end.start = datas //将结束日的初始值设定为开始日
                    }
                };
                var end = {
                    elem: '#end',
                    format: 'YYYY-MM-DD hh:mm:ss',
                    min: '1970-01-01 00:00:00',
                    max: '2099-06-16 23:59:59',
                    istime: true,
                    istoday: true,
                    choose: function(datas){
                        start.max = datas; //结束日选好后，重置开始日的最大日期
                    }
                };
                laydate(start);
                laydate(end);
            </script>
            area_id:     <select name="area_id"><?php auto_fill_option() ?></select>

            char_name:   <input type="text" name="char_name"><br/>
            cfg:         <input type="text" name="cfg"><br/>
            <input type="submit">
        </form>
        </pre>
<?php
}
?>

</body>
</html>