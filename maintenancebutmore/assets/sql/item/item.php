<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-2-26
 * Time: 下午2:33
 */
//通用类
function wrap_str($str,$delimiter=",",$new_delimiter=",",$wrap_str="'")
{
    $tmp_arr=explode($delimiter,$str);
    $arr_len= count($tmp_arr);
    $tmp_str="";
    for($i=0;$i<$arr_len;++$i)
    {
        if($i == $arr_len-1)
            $tmp_str.=$wrap_str.$tmp_arr[$i].$wrap_str;
        else
            $tmp_str.=$wrap_str.$tmp_arr[$i].$wrap_str.$new_delimiter;
    }
    return $tmp_str;
}
//统一查询
function    make_sql_acct($acct)
{
    $sql = "select a.name,a.account_id,c.name,c.char_id from common_accounts a, common_characters c where a.account_id = c.account_id and a.name = '".$acct."'";
    return $sql;
}
//道具类
function make_sql_item($datetime1,$datetime2,$acct,$char_name,$item_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($item_id != "")
    {
        $sql.=" and item_id in(".$item_id.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_item_lost_data($datetime1,$datetime2,$acct,$char_name,$item_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($item_id != "")
    {
        $sql.=" and excel_id in(".$item_id.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_item_shop_info_before_buy_for_oss($datetime1,$datetime2,$acct,$char_name,$type,$excel_id,$char_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($type != "")
    {
        $sql.=" and type in(".$type.")";
    }
    if($excel_id != "")
    {
        $sql.=" and excel_id_bought in(".$excel_id.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    $sql.=";";

    return $sql;
}
//金钱类
function make_sql_money($datetime1,$datetime2,$acct,$char_name,$case_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and account_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($case_id != "")
    {
        $sql.=" and consumption_type in(".$case_id.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_market_add($datetime1,$datetime2,$acct,$char_name,$char_id,$excel_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($excel_id != "")
    {
        $sql.=" and excel_id in(".$excel_id.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_market_abort($datetime1,$datetime2,$acct,$char_name,$char_id,$excel_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($excel_id != "")
    {
        $sql.=" and excel_id in(".$excel_id.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_market_deal($datetime1,$datetime2,$acct,$char_name,$char_id,$excel_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($excel_id != "")
    {
        $sql.=" and excel_id in(".$excel_id.")";
    }
    $sql.=";";
    return $sql;
}
//仙玉类
function make_sql_xianyu_trace($datetime1,$datetime2,$acct,$type,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and account_name in(".$acct.")";
    }
    if($type != "")
    {
        $tmp_str=wrap_str($type);
        $sql.=" and type in(".$tmp_str.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_chg_xianyu_for_qq($datetime1,$datetime2,$acct,$char_name,$case_id,$case_data,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in(".$tmp_str.")";
    }
    if($case_id != "")
    {
        $sql.=" and case_id in(".$case_id.")";
    }
    if($case_data != "")
    {
        $sql.=" and case_data in(".$case_data.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_stock_info_for_qq($datetime1,$datetime2,$acct,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and (sell_acct in(".$acct.") or buy_acct in (".$acct."))";
    }
    $sql.=";";

    return $sql;
}
function   make_sql_ah_add($datetime1,$datetime2, $acct, $char_name, $only_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in(".$tmp_str.")";
    }
    if($only_id != "")
    {
        $sql.=" and item_id in(".$only_id.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_ah_deal($datetime1,$datetime2, $acct, $char_name, $only_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and (buy_acct in(".$acct.") or sell_acct in (".$acct."))";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and (buy_char in(".$tmp_str.") or sell_char in (".$tmp_str."))";
    }
    if($only_id != "")
    {
        $sql.=" and item_id in(".$only_id.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_gzs_ah_add($datetime1,$datetime2, $acct, $char_name, $only_id,$excel_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in (".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in(".$tmp_str.")";
    }
    if($only_id != "")
    {
        $sql.=" and item_id in(".$only_id.")";
    }
    if($excel_id != "")
    {
        $sql.=" and excel_id in(".$excel_id.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_gzs_ah_deal($datetime1,$datetime2, $acct, $char_name, $only_id,$excel_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and (buy_acct in(".$acct.") or sell_acct in (".$acct."))";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and (buy_char in(".$tmp_str.") or sell_char in (".$tmp_str."))";
    }
    if($only_id != "")
    {
        $sql.=" and item_id in(".$only_id.")";
    }
    if($excel_id != "")
    {
        $sql.=" and excel_id in(".$excel_id.")";
    }
    $sql.=";";

    return $sql;
}
//league查询
function make_sql_common_characters_by_charname($char_name)
{
    $tmp_str=wrap_str($char_name);
    $sql = "select name,char_id,guild_id,league_status,league_name,league_svrid from common_characters where name in (".$tmp_str."); ";
    return $sql;
}
function make_sql_guild_league_by_charname($char_name)
{
    $tmp_str=wrap_str($char_name);
    $sql = "select guild_league_id,srv_id,status,build_time,temp_time,level,size,money,credit,action,scn_id,name,leader "
            . "from guild_league where guild_league_id in (select guild_league_id from common_characters where name in (".$tmp_str."));";
    return $sql;
}
function make_sql_guild_league_guild_members_by_charname($char_name)
{
    $tmp_str=wrap_str($char_name);
    $sql = "select guild_id,guild_league_id,contribution,data "
            . "from guild_league_guild_members where guild_id in (select guild_id from common_characters where name in (".$tmp_str."));";
    return $sql;
}
function make_sql_guild_league_members_by_charname($char_name)
{
    $tmp_str=wrap_str($char_name);
    $sql = "select char_id,guild_league_id,class,contribution from guild_league_members where"
        . " char_id in (select char_id from common_characters where name in (".$tmp_str."));";
    return $sql;
}
function make_sql_common_characters_by_charid($char_id)
{
    $sql = "select name,char_id,guild_id,league_status,league_name,league_svrid from common_characters where char_id in (".$char_id."); ";
    return $sql;
}
function make_sql_guild_league_by_charid($char_id)
{
    $sql = "select guild_league_id,srv_id,status,build_time,temp_time,level,size,money,credit,action,scn_id,name,leader "
        . "from guild_league where guild_league_id in (select guild_league_id from common_characters where char_id in (".$char_id."));";
    return $sql;
}
function make_sql_guild_league_guild_members_by_charid($char_id)
{
    $sql = "select guild_id,guild_league_id,contribution,data "
        . "from guild_league_guild_members where guild_id in (select guild_id from common_characters where char_id in (".$char_id."));";
    return $sql;
}
function make_sql_guild_league_members_by_charid($char_id)
{
    $sql = "select char_id,guild_league_id,class,contribution from guild_league_members where char_id in (".$char_id.");";
    return $sql;
}

//NPC
function make_sql_ogre_dead_info_for_qq($datetime1,$datetime2,$acct,$char_name,$char_id,$ogre_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and killer_acct in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and killer_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($ogre_id != "")
    {
        $sql.=" and ogre_id in(".$ogre_id.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_dead_boss($datetime1,$datetime2,$acct,$char_name,$char_id,$ogre_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and account in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($ogre_id != "")
    {
        $sql.=" and boss_excelid in(".$ogre_id.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_char_pet_recover_for_qq($datetime1,$datetime2,$acct,$char_name,$char_id,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_petid_log_for_qq($datetime1,$datetime2,$acct,$char_name,$char_id,$pet_listid,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($pet_listid != "")
    {
        $sql.=" and pet_id in(".$pet_listid.")";
    }
    $sql.=";";
    return $sql;
}
//邮件
function make_sql_leave_msg($datetime1,$datetime2,$acct,$char_name,$char_id,$msg,$table_name)
{
    $sql="select * from ".$table_name." where log_datetime between '"
        .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($msg != "")
    {
        $sql.=" and msg like %".$msg."%";
    }
    $sql.=";";
    return $sql;
}
function make_sql_pri_messages($char_name,$char_id,$msg)
{
    $sql="select c.char_id,c.name,pri.msg_id,pri.msg_date,uncompress(pri.msg_stuff),pri.get_lock
        from common_characters c, pri_messages pri where c.char_id = pri.char_id ";

    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and c.name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and c.char_id in(".$char_id.")";
    }
    if($msg != "")
    {
        $sql.=" and msg like %".$msg."%";
    }
    $sql.=";";
    return $sql;
}
//场景
function make_sql_chgscn_log($datetime1,$datetime2,$acct,$char_name,$char_id,$old_scn,$new_scn,$table_name)
{  $sql="select * from ".$table_name." where log_datetime between '"
    .$datetime1."' and '".$datetime2."'";
    if($acct != "")
    {
        $sql.=" and acct_name in(".$acct.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($old_scn != "")
    {
        $sql.=" and old_scn in(".$old_scn.")";
    }
    if($new_scn != "")
    {
        $sql.=" and new_scn in(".$new_scn.")";
    }
    $sql.=";";
    return $sql;

}