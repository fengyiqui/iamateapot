<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 16-2-26
 * Time: 下午2:33
 */
//通用类
//难道不提供自带的swap函数?
function my_swap(&$a, &$b)
{
    $c=$a;
    $a = $b;
    $b = $c;
}
function digital_auto_fill($digital_str,$delimiter="-",$new_delimiter=",")
{
    if(strpos($digital_str,$delimiter) != false)
    {
        $tmp_arr=explode($delimiter,$digital_str);
        $arr_len= count($tmp_arr);
        if($arr_len == 2)
        {
            $tmp_str = "";
            $tmp_min=(int)$tmp_arr[0];
            $tmp_max=(int)$tmp_arr[1];
            if($tmp_max < $tmp_min)
                my_swap($tmp_max,$tmp_min);
            for($i=$tmp_min;$i<=$tmp_max;++$i)
            {
                if($i == $tmp_max)
                    $tmp_str .= $i;
                else
                    $tmp_str .= $i.$new_delimiter;
            }//EOF of for
            return $tmp_str;
        }
    }

    return $digital_str;
}
//1,3,4-6 => 1,3,4,5,6
function wrap_digital($str,$delimiter=",",$new_delimiter=",",$wrap_str="")
{
    $tmp_arr=explode($delimiter,$str);
    $arr_len= count($tmp_arr);
    $tmp_str="";
    for($i=0;$i<$arr_len;++$i)
    {
        $t = digital_auto_fill($tmp_arr[$i]);
        if($i == $arr_len-1)
            $tmp_str.=$wrap_str.$t.$wrap_str;
        else
            $tmp_str.=$wrap_str.$t.$wrap_str.$new_delimiter;
    }
    return $tmp_str;
}
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
function make_sql_acct_char_name($acct,$char_name,$char_id)
{
    $sql = "select a.name,a.account_id,c.name,c.char_id from common_accounts a, common_characters c where a.account_id = c.account_id ";
    if($acct != "")
    {
        $tmp_str=wrap_str($acct);
        $sql .="and a.name in (".$tmp_str.")";
    }
    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql .="and c.name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $tmp_str = wrap_digital($char_id);
        $sql .="and c.char_id in (".$tmp_str.")";
    }
    $sql.=";";
    return $sql;
}
//道具类
function make_sql_item($datetime1,$datetime2,$acct,$char_name,$excel_id,$case_id,$table_name)
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
    if($excel_id != "")
    {
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and item_id in(".$tmp_str.")";
    }
    if($case_id != "")
    {
        $tmp_str = wrap_digital($case_id);
        $sql.=" and case_id in(".$tmp_str.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_item_lost_data($datetime1,$datetime2,$acct,$char_name,$excel_id,$case_id,$table_name)
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
    if($excel_id != "")
    {
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and excel_id in(".$tmp_str.")";
    }
    if($case_id != "")
    {
        $tmp_str = wrap_digital($case_id);
        $sql.=" and case_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and excel_id_bought in(".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    $sql.=";";

    return $sql;
}
function make_sql_common_characters($char_name,$char_id,$excel_id)
{
    if($char_name == "" && $char_id == "")
        return "char_name and char_id can not be both null";
    $sql="select c.name,c.char_id,i.item_id,i.excel_id,i.auto_id,i.num from common_characters c, common_items i
            where c.char_id = i.char_id";

    if($char_name != "")
    {
        $tmp_str=wrap_str($char_name);
        $sql.=" and c.name in (".$tmp_str.")";
    }
    if($char_id != "")
    {
        $sql.=" and c.char_id in(".$char_id.")";
    }
    if($excel_id != "")
    {
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and i.excel_id in (".$tmp_str.")";
    }
    $sql.=";";
    return $sql;
}
//金钱类
function make_sql_money($datetime1,$datetime2,$acct,$char_name,$char_id,$case_id,$case_data,$scn_id,$table_name)
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
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($case_id != "")
    {
        $tmp_str = wrap_digital($case_id);
        $sql.=" and consumption_type in(".$tmp_str.")";
    }
    if($case_data != "")
    {
        $tmp_str = wrap_digital($case_data);
        $sql.=" and consumption_data in(".$tmp_str.")";
    }
    if($scn_id != "")
    {
        $tmp_str = wrap_digital($scn_id);
        $sql.=" and scn_id in(".$tmp_str.")";
    }
    $sql.=";";
    return $sql;
}
function make_sql_bound_money($datetime1,$datetime2,$acct,$char_name,$char_id,$case_id,$case_data,$scn_id,$table_name)
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
    if($char_id != "")
    {
        $sql.=" and char_id in(".$char_id.")";
    }
    if($case_id != "")
    {
        $tmp_str = wrap_digital($case_id);
        $sql.=" and consumption_type in(".$tmp_str.")";
    }
    if($case_data != "")
    {
        $tmp_str = wrap_digital($case_data);
        $sql.=" and consumption_data in(".$tmp_str.")";
    }
    if($scn_id != "")
    {
        $tmp_str = wrap_digital($scn_id);
        $sql.=" and scn_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and excel_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and excel_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and excel_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($case_id);
        $sql.=" and case_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($excel_id);
        $sql.=" and excel_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($ogre_id);
        $sql.=" and ogre_id in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($ogre_id);
        $sql.=" and boss_excelid in(".$tmp_str.")";
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
        $tmp_str = wrap_digital($pet_listid);
        $sql.=" and pet_id in(".$tmp_str.")";
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
        $sql.=" and msg like '%".$msg."%'";
    }
    $sql.=";";
    return $sql;
}
function make_sql_pri_messages($char_name,$char_id,$msg)
{
    if($char_name == "" && $char_id == "")
        return "char_name and char_id can not be both null";

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
        $tmp_str = wrap_digital($old_scn);
        $sql.=" and old_scn in(".$tmp_str.")";
    }
    if($new_scn != "")
    {
        $tmp_str = wrap_digital($new_scn);
        $sql.=" and new_scn in(".$tmp_str.")";
    }
    $sql.=";";
    return $sql;

}
//登陆
function make_sql_acct_login_info_for_qq($datetime1,$datetime2,$acct,$char_name,$char_id,$ip,$table_name)
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
    if($ip != "")
    {
        $tmp_str=wrap_str($ip);
        $sql.=" and char_login_ip in(".$tmp_str.")";
    }
    $sql.=";";
    return $sql;

}
//奖励
function make_sql_player_award($datetime1,$datetime2,$acct,$char_name,$award_id,$table_name)
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
    if($award_id != "")
    {
        $tmp_str = wrap_digital($award_id);
        $sql.=" and award_id in(".$tmp_str.")";
    }

    $sql.=";";
    return $sql;

}