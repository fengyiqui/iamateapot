<?php
include_once("../common/header_consts.php");
include_once("../sql/item/item.php");
$desc="用于查看道具的丢失";
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
if("" != @$_POST["acct"] || "" != @$_POST["char_name"] || "" != @$_POST["char_id"])
{
    echo("<p>");
    if("" != @$_POST["acct"])
    {
        $sql = make_sql_acct($_POST["acct"]);
        echo("<br/>");
        echo($sql);
        echo("<br/>");
    }
    if("" != @$_POST["char_name"])
    {
        $sql = make_sql_common_characters_by_charname($_POST["char_name"]);
        $sql2 = make_sql_guild_league_by_charname($_POST["char_name"]);
        $sql3 = make_sql_guild_league_guild_members_by_charname($_POST["char_name"]);
        $sql4 = make_sql_guild_league_members_by_charname($_POST["char_name"]);
        echo("<br/>");
        echo($sql);
        echo("<br/>");
        echo($sql2);
        echo("<br/>");
        echo($sql3);
        echo("<br/>");
        echo($sql4);
        echo("<br/>");
    }
    if("" != @$_POST["char_id"])
    {
        $sql = make_sql_common_characters_by_charid($_POST["char_id"]);
        $sql2 = make_sql_guild_league_by_charid($_POST["char_id"]);
        $sql3 = make_sql_guild_league_guild_members_by_charid($_POST["char_id"]);
        $sql4 = make_sql_guild_league_members_by_charid($_POST["char_id"]);
        echo("<br/>");
        echo($sql);
        echo("<br/>");
        echo($sql2);
        echo("<br/>");
        echo($sql3);
        echo("<br/>");
        echo($sql4);
        echo("<br/>");
    }

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
            开始日：<input name="log_datetime1" class="laydate-icon" id="start" style="width:200px; margin-right:10px;">
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
            acct:           <input type="text" name="acct"><br/>
            char_name:      <input type="text" name="char_name"><br/>
            char_id:        <input type="text" name="char_id"><br/>
            guild_id:       <input type="text" name="guild_id">(undef)<br/>
            league_id:      <input type="text" name="league_id">(undef)<br/>
            <input type="submit">
        </form>
        </pre>
<?php
}
?>

</body>
</html>