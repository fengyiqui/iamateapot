<?php
include_once("../common/header_consts.php");
include_once("../sql/item/item.php");
$desc="用于查看道具的获得情况";
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
    if("" != @$_POST["log_datetime1"])
    {
        echo("<p>");
        $sql = make_sql_pri_messages(
            $_POST["char_name"],
            $_POST["char_id"],
            $_POST["msg"],
            "pri_messages");
        echo("<br/>");
        echo($sql);
        echo("<br/>");
        echo("</p>");
        echo("<p>");
        echo("<a href=".$header_consts_index_url.">返回</a>");
        echo("</p>");
        //TODO： charid sql生成器？
    }
    else
    {
 ?>
        <p>
            <?php echo ($desc); ?>
        </p>
        <pre>
        <form action="" method="post">
            开始日：<input name="log_datetime1" class="laydate-icon" id="start" style="width:200px; margin-right:10px;" value="1970-01-01 00:00:00">(为了不空)
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
            char_name:      <input type="text" name="char_name"><br/>
            char_id:        <input type="text" name="char_id"><br/>
            get_lock:       <input type="text" name="get_lock"><br/>
            msg:            <input type="text" name="msg">(msg 使用的 like语句)<br/>
            <input type="submit">
        </form>
        </pre>
<?php
    }
?>

</body>
</html>