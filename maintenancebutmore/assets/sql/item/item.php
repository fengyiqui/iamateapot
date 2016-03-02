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
        // $sql.="and char_name in(".$_POST["char_name"].")";
        //如果char_name是使用,分割的，就给每个自动用单引号包裹上
        $char_name_arr=explode(",",$char_name);
        $arr_len= count($char_name_arr);
        $tmp_str="";
        for($i=0;$i<$arr_len;++$i)
        {
            if($i == $arr_len-1)
                $tmp_str.="'".$char_name_arr[$i]."'";
            else
                $tmp_str.="'".$char_name_arr[$i]."',";
        }
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
        // $sql.="and char_name in(".$_POST["char_name"].")";
        //如果char_name是使用,分割的，就给每个自动用单引号包裹上
        $char_name_arr=explode(",",$char_name);
        $arr_len= count($char_name_arr);
        $tmp_str="";
        for($i=0;$i<$arr_len;++$i)
        {
            if($i == $arr_len-1)
                $tmp_str.="'".$char_name_arr[$i]."'";
            else
                $tmp_str.="'".$char_name_arr[$i]."',";
        }
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($item_id != "")
    {
        $sql.=" and excel_id in(".$item_id.")";
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
        // $sql.="and char_name in(".$_POST["char_name"].")";
        //如果char_name是使用,分割的，就给每个自动用单引号包裹上
        $char_name_arr=explode(",",$char_name);
        $arr_len= count($char_name_arr);
        $tmp_str="";
        for($i=0;$i<$arr_len;++$i)
        {
            if($i == $arr_len-1)
                $tmp_str.="'".$char_name_arr[$i]."'";
            else
                $tmp_str.="'".$char_name_arr[$i]."',";
        }
        $sql.=" and char_name in (".$tmp_str.")";
    }
    if($case_id != "")
    {
        $sql.=" and consumption_type in(".$case_id.")";
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
