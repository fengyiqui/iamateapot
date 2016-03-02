

DROP TABLE IF EXISTS `acct_create_info_for_qq`;
CREATE TABLE `acct_create_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `acct_ip_for_qq`;
CREATE TABLE `acct_ip_for_qq` (
  `log_datetime` datetime NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `ip` varchar(40) NOT NULL,
  `net_type` int(10) unsigned
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `acct_login_info_for_qq`;
CREATE TABLE `acct_login_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `char_id` bigint(20) unsigned NOT NULL,
  `acct_id` bigint(20) unsigned NOT NULL,
  `acct_name` int(10) unsigned DEFAULT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `char_experience` int(10) NOT NULL DEFAULT '0',
  `char_money` int(10) unsigned NOT NULL DEFAULT '0',
  `used_money` int(10) unsigned NOT NULL DEFAULT '0',
  `unused_money` int(10) unsigned NOT NULL DEFAULT '0',
  `char_online_time` int(10) unsigned NOT NULL DEFAULT '0',
  `char_login_ip` varchar(40) NOT NULL,
  `login_type` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `acct_logout_info_for_qq`;
CREATE TABLE `acct_logout_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `acct_timeout_for_qq`;
CREATE TABLE `acct_timeout_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `arena_info_for_qq`;
CREATE TABLE `arena_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `obj_name` varchar(40) NOT NULL,
  `obj_series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `obj_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_afk_info_for_qq`;
CREATE TABLE `char_afk_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_chat_info_for_qq`;
CREATE TABLE `char_chat_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `account_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `channel` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL,
  `chat_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_dead_info_for_qq`;
CREATE TABLE `char_dead_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `killer_name` varchar(40) NOT NULL,
  `killer_rank` int(10) unsigned NOT NULL,
  `dead_char_name` varchar(40) NOT NULL,
  `dead_char_rank` int(10) unsigned NOT NULL,
  `dead_char_metier` int(10) unsigned NOT NULL,
  `attack_type` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_fight_info_for_qq`;
CREATE TABLE `char_fight_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_gather_info_for_qq`;
CREATE TABLE `char_gather_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `prof_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `skill_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recipe_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_gm_cmd_for_qq`;
CREATE TABLE `char_gm_cmd_for_qq` (
  `log_datetime` datetime NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `cmd_info` varchar(40) NOT NULL,
  `ret_info` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);



DROP TABLE IF EXISTS `char_item_lost_for_qq`;
CREATE TABLE `char_item_lost_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `case_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `chg_num` int(10) NOT NULL,
  `now_num` int(10) NOT NULL,
  `gID` bigint(20) unsigned NOT NULL,
  `item_cate` int NOT NULL,
  `case_data`	int NOT NULL,
  `level` int(10) NOT NULL,
  `faculty` smallint unsigned NOT NULL,
  `scn_id` int(10) not null default 0,
  `char_id` bigint(20) unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_money_add_for_qq`;
CREATE TABLE `char_money_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `account_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `consumption_type` int(10) unsigned NOT NULL,
  `consumption_money` int(10) NOT NULL,
  `pre_money` int(10) NOT NULL,
  `now_money` int(10) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `consumption_data` int(10) not null,
  `scn_id` int(10) not null default 0,
  `char_id` bigint(20) unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_money_sub_for_qq`;
CREATE TABLE `char_money_sub_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `account_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `consumption_type` int(10) unsigned NOT NULL,
  `consumption_money` int(10) NOT NULL,
  `pre_money` int(10) NOT NULL,
  `now_money` int(10) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `consumption_data` int(10) not null,
  `scn_id` int(10) not null default 0,
  `char_id` bigint(20) unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_npc_business_for_qq`;
CREATE TABLE `char_npc_business_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `account_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `npc_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_num` int(10) unsigned NOT NULL,
  `money_add` int(10) unsigned NOT NULL,
  `fre_money` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL,
  `str` varchar(16) not null default '',
  `bound_money` int(10) unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_online_info_for_qq`;
CREATE TABLE `char_online_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_pet_add_for_qq`;
CREATE TABLE `char_pet_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `pet_only_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pet_excel_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_auto_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `daohang` smallint(5) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_pet_del_for_qq`;
CREATE TABLE `char_pet_del_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `case_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_only_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pet_excel_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_auto_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_pet_use_for_qq`;
CREATE TABLE `char_pet_use_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `pet_cate` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_only_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pet_excel_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_auto_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pet_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `summon_time` smallint(5) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_quest_info_for_qq`;
CREATE TABLE `char_quest_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `function_name` char(30) NOT NULL,
  `quest_id` int(10) unsigned NOT NULL,
  `multiple` int(10) unsigned NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `area` int(10) unsigned NOT NULL,
  `char_rank` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_rank_info_for_qq`;
CREATE TABLE `char_rank_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `char_adv` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_time` int(10) unsigned NOT NULL DEFAULT '0',
  `total_time` int(10) unsigned NOT NULL DEFAULT '0',
  `profession` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_id` bigint(20) unsigned not null default 0,
  `only_id` bigint(20) unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_reqair_for_qq`;
CREATE TABLE `char_reqair_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `wear` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_skill_add_for_qq`;
CREATE TABLE `char_skill_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `skill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `skill_rank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_skill_del_for_qq`;
CREATE TABLE `char_skill_del_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `skill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_stall_for_qq`;
CREATE TABLE `char_stall_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `case_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stall_time` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `money_before` int(10) unsigned NOT NULL DEFAULT '0',
  `money_after`  int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_stall_item_for_qq`;
CREATE TABLE `char_stall_item_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `case_id` varchar(16) NOT NULL,
  `obj_acct` int(10) unsigned NOT NULL,
  `obj_name` varchar(40) NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item_num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item_slot` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` int(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_study_info_for_qq`;
CREATE TABLE `char_study_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `case_id` int(10) unsigned NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `pre_rank` int(10) unsigned NOT NULL,
  `now_rank` int(10) unsigned NOT NULL,
  `acct_name` bigint(20) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `area` int(10) unsigned NOT NULL,
  `char_rank` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `char_wear_info_for_qq`;
CREATE TABLE `char_wear_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `wear` int(10) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) DEFAULT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `fuben_exsit_time_for_qq`;
CREATE TABLE `fuben_exsit_time_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `scn_id` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `item_get_info_for_qq`;
CREATE TABLE `item_get_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) DEFAULT NULL,
  `char_name` varchar(40) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `case_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `chg_num` int(10) NOT NULL,
  `now_num` int(10) NOT NULL,
  `gID` bigint(20) unsigned NOT NULL,
  `obj_name` varchar(40) NOT NULL,
  `item_cate` int NOT NULL,
  `case_data` int(10) NOT NULL,
  `level` int(10) NOT NULL,
  `faculty` smallint unsigned NOT NULL,
  `scn_id` int(10) not null default 0,
  `char_id` bigint(20) unsigned NOT NULL default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `join_team_time_info_for_qq`;
CREATE TABLE `join_team_time_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_rank` int(10) unsigned NOT NULL,
  `char_class` int unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `offline_info_for_qq`;
CREATE TABLE `offline_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `online_time` int(10) unsigned NOT NULL DEFAULT '0',
  `total_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ping` smallint(5) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `metier` int(10) unsigned DEFAULT NULL,
  `ip` varchar(40) NOT NULL,
  `zhanli` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `ogre_dead_info_for_qq`;
CREATE TABLE `ogre_dead_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `ogre_id` int(10) unsigned NOT NULL,
  `area` int(10) unsigned NOT NULL,
  `killer_acct` int(10) unsigned NOT NULL,
  `killer_name` varchar(40) NOT NULL,
  `killer_rank` int(10) unsigned NOT NULL,
  `killer_char_series` tinyint(3) unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `pvp_info_for_qq`;
CREATE TABLE `pvp_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `obj_name` varchar(40) NOT NULL,
  `obj_series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `obj_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `sns_info_for_qq`;
CREATE TABLE `sns_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `sns_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `handle_type` int(10) unsigned NOT NULL,
  `hot_num` int(10) unsigned NOT NULL,
  `obj_name` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `stat_area_info_for_qq`;
CREATE TABLE `stat_area_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `scn_id` int(10) unsigned NOT NULL,
  `player_num` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `stat_info_for_qq`;
CREATE TABLE `stat_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `frame` int(10) unsigned NOT NULL,
  `player_num` int(10) unsigned NOT NULL,
  `scn_num` int(10) unsigned NOT NULL,
  `tick_num` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `stock_info_for_qq`;
CREATE TABLE `stock_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `type` tinyint NOT NULL,
  `sell_acct` int(10) unsigned NOT NULL,
  `buy_acct` int(10) unsigned NOT NULL,
  `hand` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `tax` int(10) unsigned NOT NULL,
  `sell_seq` bigint unsigned NOT NULL,
  `buy_seq` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `shop_info_for_qq`;
CREATE TABLE `shop_info_for_qq` (
  `log_datetime` datetime NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `trx_id` int(10) unsigned NOT NULL,
  `excel_id` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `count_of_dozen` int(10) unsigned not null,
  `dozen` int(10) unsigned not null,
  `rank` tinyint unsigned not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `chg_xianyu_for_qq`;
CREATE TABLE `chg_xianyu_for_qq` (
  `log_datetime` datetime not null,
  `acct_name` int(10) unsigned not null,
  `char_name` varchar(40) not null,
  `case_id` int not null,
  `case_data` int not null,
  `chg_xianyu` int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `gamble_for_qq`;
CREATE TABLE `gamble_for_qq` (
  `log_datetime` datetime not null,
  `acct_name` int(10) unsigned not null,
  `char_name` varchar(40) not null,
	`item_id` int unsigned not null default 0,
`item_level` int not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `bin_status_log`;
CREATE TABLE `bin_status_log` (
	`log_datetime` datetime not null,
	`bin` varchar(64) not null,
	`status` varchar(16) not null,
	`ip` varchar(16) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `qiangliang_log`;
CREATE TABLE `qiangliang_log` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`award` int unsigned NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `family_log`;
CREATE TABLE `family_log` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`org` int NOT NULL,
	`opcode` int NOT NULL,
	`class` int NOT NULL,
	`data_int` int NOT NULL,
	`data_string` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gID` bigint unsigned NOT NULL DEFAULT '0',
  `guild_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `xianyu_tax`;
CREATE TABLE `xianyu_tax` (
	`log_datetime` datetime NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `point` smallint unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `leave_msg`;
CREATE TABLE `leave_msg` (
	`log_datetime` datetime NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `chgscn_log`;
CREATE TABLE `chgscn_log` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`case` int unsigned NOT NULL,
	`old_scn` int unsigned NOT NULL,
	`new_scn` int unsigned NOT NULL,
	`pos_x` float(32,8) NOT NULL,
	`pos_z` float(32,8) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `server` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `zhanli` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `snapshot_pet`;
CREATE TABLE `snapshot_pet` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`item_id` bigint unsigned NOT NULL,
	`excel_id` int unsigned not null,
	`auto_id` int unsigned not null,
	`num`	int unsigned not null,
	`szinfo` text not null,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `zhenyaota`;
CREATE TABLE `zhenyaota` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`cate` bigint unsigned NOT NULL,
	`ta_id` int unsigned not null,
	`rank` int unsigned not null,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `tianleijie`;
CREATE TABLE `tianleijie` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`team` text NOT NULL,
	`start` text not null,
	`stop` text not null,
	`flag` text not null,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `shengwang`;
CREATE TABLE `shengwang` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`camp_id` int NOT NULL,
	`chg_val` int not null,
	`before_chg` int not null,
	`after_chg` int not null,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `chenghao`;
CREATE TABLE `chenghao` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`event_id` bigint NOT NULL,
	`chenghao_id` int not null,
	`opcode` int not null,
	`case` int not null,
	`case_int` int not null,
	`case_str` tinytext not null,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_list_id` int(10) unsigned NOT NULL,
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `ah_add`;
CREATE TABLE `ah_add` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`item_name` varchar(40) not null,
	`price` int unsigned not null,
	`time` int unsigned not null,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
 `item_id` bigint(20) unsigned not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `ah_deal`;
CREATE TABLE `ah_deal` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
	`item_name` varchar(40) not null,
	`price` int unsigned not null,
  `buy_acct` int(10) unsigned NOT NULL,
  `buy_char` varchar(40) NOT NULL,
  `sell_acct` int(10) unsigned NOT NULL,
  `sell_char` varchar(40) NOT NULL,
  `item_id`  bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `dead_boss`;
CREATE TABLE `dead_boss` (
	`log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `event_id` bigint not null,
	`boss_name` varchar(40) not null,
	`boss_excelid` int not null,
	`boss_area` int not null,
	`account`  int(10) not null,
	`char_name` varchar(40) not null,
	`ip` varchar(40) not null 
--	`players` text not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `shop_real_info_for_qq`;
create table `shop_real_info_for_qq`(
	`log_datetime` datetime not null,
	`acct_name`	int(10) not null,
	`point_now`	int not null,
	`point_cost`	int not null
)engine=innodb default charset=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery` (
	`log_datetime` datetime NOT NULL,
        `servername` varchar(40) NOT NULL,
	`cmd`	 int not null,
	`account_name`     int(10) not null,
	`char_name`   varchar(40) not null,
	`card`	 	varchar(40) not null,
	`rst`		int not null,
	`lottery`	varchar(256) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `gzs_ah_add`;
create table `gzs_ah_add` (
	`log_datetime` datetime NOT NULL,
	`servername` varchar(40) NOT NULL,
	`item_id` bigint(20) NOT NULL,
	`price` int NOT NULL,
	`time` int NOT NULL,
	`acct_name` int not null,
	`char_name` varchar(40) not null,
	`excel_id` int NOT NULL 
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `gzs_ah_deal`;
create table `gzs_ah_deal` (
	`log_datetime` datetime NOT NULL,
	`servername` varchar(40) NOT NULL,
	`item_id` bigint(20) not null,
	`price` int not null,
	`buy_char` varchar(40) not null,
	`sell_char` varchar(40) not null,
	`excel_id` int not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `player_award`;
create table `player_award` (
	`log_datetime` datetime NOT NULL,
	`servername`  varchar(40) NOT NULL,
	`award_id`    int(10) not null,
 	`account_name` int(10) not null,
	`char_name`   varchar(40) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST ( TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `marelation_break`;
create table `marelation_break` (
	`log_datetime` datetime NOT NULL,
	`servername` varchar(40) NOT NULL,
	`break_type` tinyint not null,
	`master_name` varchar(40) NOT NULL,
	`app_name`   varchar(40) NOT NULL,
	`master_acct` int	not null,
	`app_acct`	int	not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `marelation_create`;
create table `marelation_create` (
	`log_datetime` datetime NOT NULL,
	`servername` varchar(40) NOT NULL,
	`master_name` varchar(40) NOT NULL,
	`app_name`  varchar(40) NOT NULL,
	`master_acct`	int 	not null,
	`app_acct`	int 	not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);	
DROP TABLE IF EXISTS `char_pet_addpetsoul`;
create table `char_pet_addpetsoul` (
	`log_datetime` datetime NOT NULL,
	`servername`   varchar(40) NOT NULL,
	`pet_only_id`  bigint(20)  NOT NULL,
	`pet_excel_id` int(10)     NOT NULL,
	`pet_auot_id`  tinyint(4)  NOT NULL,
	`pet_old_rank` tinyint(4)  NOT NULL,
	`pet_new_rank` tinyint(4)  NOT NULL,
  	`pet_old_model_id` int	NOT NULL,
	`pet_new_model_id` int	NOT NULL,
	`pet_old_power_max` int	NOT NULL,
	`pet_new_power_max` int NOT NULL,
	`acct_name`	int     NOT NULL,
	`char_name`	varchar(40) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);	



DROP TABLE IF EXISTS `shop_new_info_for_qq`;
create table `shop_new_info_for_qq` (
	`log_datetime` datetime not null,
	`acct_name`    int(10) not null default 0,
	`char_name`	varchar(40) not null,
	`money_sum`	int not null default 0,
	`discount` 	varchar(10) not null,
	`after_disconut` int not null default 0,
	`present`	int not null default 0,
	`goods`		varchar(40) not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `question_naire`;
create table `question_naire` (
	`log_datetime` datetime not null,
	`servername`	varchar(40) not null,
	`question_no`	int not null,
	`time_cost`	int not null,
	`answer`	varchar(40) not null,
	`acct_name`	int(10) not null,
	`char_name`	varchar(40) not null
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in ( 733620)
);	

drop table if exists logic_stat;
create table `logic_stat`(
	`log_datetime` datetime not null,
	`servername` 	varchar(40) not null,
	`svr_fps`	int	not null default 0,
	`player_count`  int	not null default 0,
	`scn_count`	int	not null default 0,
	`char_count`	int 	not null default 0,
	`active_npc_count` int	not null default 0,
	`tick_count`	int	not null default 0,
	`cpu`		double not null default 0,
	`mem`		int not null default 0
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in (733620)
);
DROP TABLE IF EXISTS `guild_item_chg`;
create table `guild_item_chg` (
	`log_datetime` datetime not null,
	`servername`	varchar(40) not null,
	`chg_flag`	varchar(40) not null,
	`excel_id`	varchar(40) not null, 
	`only_id`	varchar(40) not null,
	`auto_id`	varchar(40) not null ,
	`num`		varchar(40) not null,
	`acct_name`	int	not null,
	`char_name`	varchar(40) not null 
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
); 


DROP TABLE IF EXISTS `delitem_trade`;
create table `delitem_trade` (
	`log_datetime` datetime not null,
	`servername`	varchar(40) not null,
	`flag`		varchar(40) not null,
	`excel_id`	varchar(40) not null,
	`num`		varchar(40) not null,
	`acct_name`	int(10)     not null,
	`char_name`	varchar(40) not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);



DROP TABLE IF EXISTS `loverelation_create`;
create table `loverelation_create` (
	`log_datetime` datetime not null,
	`servername`	varchar(40) not null,
	`result`	int not null default 0,
	`male_name`	varchar(40) not null,
	`female_name`	varchar(40) not null,
	`relation`	int not null default 0,
	`male_acct`	int not null default 0,
	`female_acct`	int not null default 0
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in ( 733620)
);

DROP TABLE IF EXISTS `loverelation_break`;
create table `loverelation_break` (
	`log_datetime` datetime not null,
	`servername`	varchar(40) not null,
	`result`	int not null default 0,
	`male_name`	varchar(40) not null,
	`female_name`	varchar(40) not null,
	`relation`	int not null default 0,
	`break_type`	int not null default 0,
	`male_acct`	int not null default 0,
	`female_acct`	int not null default 0
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `loverelation_chg`;
create table `loverelation_chg` (
	`log_datetime`	datetime not null,
	`servername`	varchar(40) not null,
	`request_player`	varchar(40) not null,
	`before_chg`	int	not null default 0,
	`after_chg`	int	not null default 0,
	`chg_value`	int 	not null default 0,
	`reason`	int	not null default 0,
	`reason_data`	int 	not null default 0,
	`account_name`	int(10) 	not null default 0
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);



DROP TABLE IF EXISTS `shop_game_slot_ticket`;
create table `shop_game_slot_ticket`(
	`log_datetime` datetime not null,
	`servername` 	varchar(40) not null,
	`excel_id`	int	not null,
	`award_template`	int not null,
	`award_lianhua`		int not null,
	`award_level`		int not null,
	`award_count`		int not null,
	`award_npc`		int not null,
	`ticket`		int not null,
	`char_name`		varchar(40) not null,
	`acct_name`		int(10) not null
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `shop_game_slot_award`;
create table `shop_game_slot_award`(
	`log_datetime` datetime not null,
	`servername` 	varchar(40) not null,
	`excel_id`	int	not null,
	`award_level`	int not null,
	`award_count`		int not null,
	`award_address`		int not null,
	`ticket`		int not null,
	`char_name`		varchar(40) not null,
	`acct_name`		int(10) not null
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `doushentan_waiter`;
create table `doushentan_waiter`(
	`log_datetime`  datetime not null,
	`servername` 	varchar(40) not null,
	`acct_name`     int(10) unsigned NOT NULL,
    `char_name`     varchar(40) NOT NULL,
    `char_rank`      tinyint(3) unsigned NOT NULL DEFAULT '0',
	`series`    tinyint(3) unsigned NOT NULL DEFAULT '0'
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `doushentan_winner`;
create table `doushentan_winner`(
	`log_datetime`  datetime not null,
	`servername` 	varchar(40) not null,
	`acct_name`     int(10) unsigned NOT NULL,
    `char_name`     varchar(40) NOT NULL,
	`win_rank`      tinyint(3) unsigned NOT NULL DEFAULT '0',
	`win_series`    tinyint(3) unsigned NOT NULL DEFAULT '0',
	`loss_rank`     tinyint(3) unsigned NOT NULL DEFAULT '0',
	`loss_series`   tinyint(3) unsigned NOT NULL DEFAULT '0'
)ENGINE=InnoDB default charset=UTF8
partition by list ( to_days(log_datetime))(
partition p_20080801 values in (733620)
);

 
DROP TABLE IF EXISTS `char_boundmoney_sub_for_qq`;
CREATE TABLE `char_boundmoney_sub_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `account_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `consumption_type` int(10) unsigned NOT NULL,
  `consumption_money` int(10) NOT NULL,
  `pre_money` int(10) NOT NULL,
  `now_money` int(10) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `consumption_data` int(10) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);
DROP TABLE IF EXISTS `char_boundmoney_add_for_qq`;
CREATE TABLE `char_boundmoney_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `account_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `char_rank` int(10) unsigned NOT NULL DEFAULT '0',
  `consumption_type` int(10) unsigned NOT NULL,
  `consumption_money` int(10) NOT NULL,
  `pre_money` int(10) NOT NULL,
  `now_money` int(10) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `consumption_data` int(10) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `xianyu_trace`;
CREATE TABLE `xianyu_trace` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `type`	varchar(32) NOT NULL,
  `available_chg` int(10) NOT NULL default 0,
  `available_left` int(10) NOT NULL default 0,
  `frozen_chg`    int(10) NOT NULL default 0,
  `frozen_left`   int(10) NOT NULL default 0,
  `account_name`  int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `pkmatch_player_score`;
CREATE TABLE `pkmatch_player_score`(
	`log_datetime` datetime NOT NULL,
	`servername`	varchar(40) NOT NULL,
	`playerteamid`	int(10)     unsigned NOT NULL default 0,
	`account_name`	int(10)     unsigned NOT NULL,
	`char_name` 	varchar(40) NOT NULL,
	`char_rank`	int(10)     NOT NULL,
	`char_class`	int(10)     NOT NULL,	
	`match_point`	int(10)     NOT NULL  default 0,
	`player_only_id` bigint(20) unsigned NOT NULL,
	`match_type`		tinyint unsigned NOT NULL,
	`match_round`   tinyint unsigned  NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `pkmatch_team_score`;
CREATE TABLE `pkmatch_team_score`(
	`log_datetime` datetime NOT NULL,
	`servername`	varchar(40) NOT NULL,
	`teamid_a` 	int(10)   NOT NULL,
	`match_point_a`   int(10)   NOT NULL,
	`match_result_a`  int(10)   NOT NULL,
	`teamid_b`	int(10)  NOT NULL,
	`match_point_b`	  int(10)  NOT NULL,
	`match_result_b`   int(10) NOT NULL,
	`match_type`		tinyint unsigned NOT NULL,
	`match_round`   tinyint unsigned  NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `pkmatch_signup`;
CREATE TABLE `pkmatch_signup`(
	`log_datetime`	datetime NOT NULL,
	`servername`	varchar(40) NOT NULL,
	`member_count`	int(10)	unsigned NOT NULL,
	`account_name`	int(10) unsigned NOT NULL,
	`char_name`	varchar(40) NOT NULL,
	`char_rank`	int(10) unsigned NOT NULL,
	`char_class`	int(10) unsigned NOT NULL,
	`member_list`	varchar(600) NOT NULL,
	`captain_only_id`	bigint(20) unsigned NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `pkmatch_handin`;
CREATE TABLE `pkmatch_handin`(
	`log_datetime`	datetime NOT NULL,
	`servername`	varchar(40) NOT NULL,
	`account_name`	int(10) unsigned NOT NULL,
	`char_name`	varchar(40) NOT NULL,
	`handin_count`	int(10) NOT NULL,
	`captain_only_id` bigint(20) unsigned NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

	


DROP TABLE IF EXISTS `shifangjie_first_break`;
CREATE TABLE `shifangjie_first_break` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) character set utf8 NOT NULL,
  `team_info` blob NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `char_exp_info_for_qq`;
CREATE TABLE `char_exp_info_for_qq`(
        `log_datetime`  datetime                NOT NULL,
        `servername`    varchar(40)             NOT NULL,
        `acc_name`      int(10) unsigned        NOT NULL,
        `char_name`     varchar(40)             NOT NULL,
        `char_level`    tinyint unsigned        NOT NULL,
        `char_exp`      int(10) unsigned        NOT NULL,
        `reason`        smallint                NOT NULL,
        `reason_data`   smallint unsigned       NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `char_self_level_info_for_qq`;
CREATE TABLE `char_self_level_info_for_qq`(
        `log_datetime`  datetime                NOT NULL,
        `servername`    varchar(40)             NOT NULL,
        `acc_name`      int(10) unsigned        NOT NULL,
        `char_name`     varchar(40)             NOT NULL,
        `char_level`    tinyint unsigned        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `char_point_shop_deal_for_qq`;
CREATE TABLE `char_point_shop_deal_for_qq`(                             
`log_datetime`  datetime                NOT NULL,
`servername`    varchar(40)             NOT NULL,
`acc_name`      int(10) unsigned        NOT NULL,
`char_name`     varchar(40)             NOT NULL,
`buy_info`      tinyint unsigned        NOT NULL,
`item_id`       int(10) unsigned        NOT NULL,
`item_num`      smallint unsigned       NOT NULL,
`money`         int(10) unsigned        NOT NULL,
`point`         smallint unsigned       NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `passiveact_learn`;
CREATE TABLE `passiveact_learn` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `operate_id` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `act_level` int(11) NOT NULL,
  `acct_name` int(10) NOT NULL,
  `char_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (to_days(log_datetime)) 
(PARTITION p_20110819 VALUES IN (734733) 
);

DROP TABLE IF EXISTS `exp_use`;
CREATE TABLE `exp_use` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `cause_id` int(11) NOT NULL,
  `cause_date_1` int(11) NOT NULL,
  `cause_date_2` int(11) NOT NULL,
  `exp_used` int(11) NOT NULL,
  `exp_before` int(11) NOT NULL,
  `acct_name` int(10) NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `level` int(10) NOT NULL,
  `faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (to_days(log_datetime)) 
(PARTITION p_20110819 VALUES IN (734733) 
);

DROP TABLE IF EXISTS `exp_used_sum`;
CREATE TABLE `exp_used_sum` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `exp_used_sum` int(11) NOT NULL,
  `acct_name` int(10) NOT NULL,
  `char_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
 PARTITION BY LIST (to_days(log_datetime)) 
(PARTITION p_20110819 VALUES IN (734733) 
);

DROP TABLE IF EXISTS `spirit_data_for_qq`;
CREATE TABLE `spirit_data_for_qq` (
	  `log_datetime` datetime NOT NULL,
	  `servername` varchar(40) NOT NULL,
	  `acct_name` int(10) unsigned DEFAULT NULL,
	  `char_name` varchar(40) NOT NULL,
	  `rise_star` tinyint unsigned NOT NULL, /*记录是升星前还是后 */
	  `star_level` smallint unsigned not null,
	  `excel_id` int unsigned not null default 0,
	  `mny_cost` int unsigned not null default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
	PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `lb_skill_item_for_qq`;
CREATE TABLE `lb_skill_item_for_qq` (
	  `log_datetime` datetime NOT NULL,
	  `servername` varchar(40) NOT NULL,
	  `acct_name` int(10) unsigned DEFAULT NULL,
	  `char_name` varchar(40) NOT NULL,
	  `excel_id` int unsigned NOT NULL /*技能书ExcelID */
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
	PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `shop_info_new_gzs_for_qq`;
CREATE TABLE `shop_info_new_gzs_for_qq` (
	`log_datetime` datetime not null,
	`type`    tinyint(4) unsigned not null default 0,
	`acct_name`    int(10) not null default 0,
	`char_name`	varchar(40) not null,
	`money_sum`	int not null default 0,
	`excel_id`      int unsigned not null default 0,
	`num`           smallint unsigned not null default 0,
	`char_name_got_gift` varchar(40) not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `shop_del_item_info_for_qq`;
CREATE TABLE `shop_del_item_info_for_qq`(
	`log_datetime` datetime NOT NULL,
	`acct_name` int(10) unsigned DEFAULT NULL,
	`char_name` varchar(40) NOT NULL,
	`excel_id_bought` int unsigned not null default 0,
	`excel_id_discount` int unsigned not null default 0,
	`num_discount` tinyint unsigned not null default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
	PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `qqicon_level_up_info_for_qq`;
CREATE TABLE `qqicon_level_up_info_for_qq`(
	`log_datetime` datetime NOT NULL,
	`acct_name` int(10) unsigned DEFAULT NULL,
	`cur_lev` tinyint unsigned not null default 0,
	`expect_lev` tinyint unsigned not null default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
	PARTITION p_20080801 VALUES IN (733620)
);
DROP TABLE IF EXISTS `qqicon_snuff_info_for_qq`;
CREATE TABLE `qqicon_snuff_info_for_qq`(
	`log_datetime` datetime NOT NULL,
	`acct_name` int(10) unsigned DEFAULT NULL,
	`ret` tinyint unsigned not null default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
	PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `shop_info_before_buy_for_oss`;
CREATE TABLE `shop_info_before_buy_for_oss` (
	`log_datetime` datetime not null,
	`transaction_id` bigint unsigned not null,
	`type`    tinyint(4) unsigned not null default 0,
	`acct_name`    int(10) unsigned not null default 0,
	`char_name`	varchar(40) not null,
	`excel_id_bought`      int unsigned not null default 0,
	`number`           smallint unsigned not null default 0,
	`money`	int not null default 0,
	`char_id` bigint unsigned not null default 0
)ENGINE=InnoDB default charset=UTF8 
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `char_item_lost_data_for_qq`;
CREATE TABLE `char_item_lost_data_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
   `gID` bigint(20) unsigned NOT NULL,
  `case_id` int(10) unsigned NOT NULL,
  `excel_id` int(10) unsigned NOT NULL,
  `item_cate` int NOT NULL,
  `szinfo` text not null,
  `szdata` text not null,
  `level` int(10) NOT NULL,
  `faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `pay_back_point_add_for_qq`;
CREATE TABLE `pay_back_point_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `excel_id` int unsigned NOT NULL,
  `cause` smallint(5) unsigned NOT NULL,
  `point_now` int(10) unsigned NOT NULL,
  `point_add` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `pay_back_try_add_for_qq`;
CREATE TABLE `pay_back_try_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `excel_id` int unsigned NOT NULL,
  `cause` smallint(5) unsigned NOT NULL,
  `point_now` int(10) unsigned NOT NULL,
  `point_add` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `pay_back_item_add_for_qq`;
CREATE TABLE `pay_back_item_add_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `excel_id` int unsigned NOT NULL,
  `item_num` int unsigned NOT NULL,
  `cause` smallint(5) unsigned NOT NULL,
  `point_now` int(10) unsigned NOT NULL,
  `point_dup` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `qqtips_backflow_reward`;
CREATE TABLE `qqtips_backflow_reward` (
	`log_datetime` datetime not null,
	`first_inviter_char_id` bigint unsigned not null,
	`backflow_char_name` varchar(40) not null,
	`reward`       	smallint unsigned not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `item_petcage_upgrade`;
CREATE TABLE `item_petcage_upgrade` (
	`log_datetime` datetime not null default 0,
	`only_id` bigint unsigned not null default 0,
	`excel_id` smallint unsigned not null default 0,
	`pet_list_id`  smallint unsigned not null default 0,
	`ori_str` tinyint unsigned not null default 0,
	`ori_vit` tinyint unsigned not null default 0,
	`ori_int` tinyint unsigned not null default 0,
	`ori_def` tinyint unsigned not null default 0,
	`new_str` tinyint unsigned not null default 0,
	`new_vit` tinyint unsigned not null default 0,
	`new_int` tinyint unsigned not null default 0,
	`new_def` tinyint unsigned not null default 0,
	`src_item_excel_id` smallint unsigned not null default 0,
	`acct` int unsigned not null default 0,
	`char_name` varchar(40) not null default 0,
        `level`    smallint unsigned not null default 0,
	`faculty`  tinyint unsigned not null default 0
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `xianmo_battle_field`;
CREATE TABLE `xianmo_battle_field` (
	`log_datetime` datetime not null,
	`char_name` varchar(40) not null,
	`credit`    tinyint unsigned not null,
	`result`    tinyint unsigned not null   
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `daily_recommend_award`;
CREATE TABLE `daily_recommend_award` (
	`log_datetime` datetime not null,
	`level_stage`    tinyint unsigned not null,
	`dang_id`    smallint unsigned not null,
	`star_class_id`    tinyint unsigned not null,
	`acct`    int(10) unsigned not null,
	`char_name` varchar(40) not null,
	`level`    tinyint unsigned not null,
	`faculty`    tinyint unsigned not null   
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);
DROP TABLE IF EXISTS `daily_recommend_refresh`;
CREATE TABLE `daily_recommend_refresh` (
	`log_datetime` datetime not null,
	`level_stage`    tinyint unsigned not null,
	`dang_id`    smallint unsigned not null,
	`type`    smallint unsigned not null,
	`star_class_id`    tinyint unsigned not null,
	`acct`    int(10) unsigned not null,
	`char_name` varchar(40) not null,
	`level`    tinyint unsigned not null,
	`faculty`    tinyint unsigned not null   
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `5v5match_player`;
CREATE TABLE `5v5match_player` (
	`log_datetime` datetime NOT NULL,
	`guild_id`  bigint(20),
	`scn_id`    int,
	`result`    tinyint,
	`player_score` int,
	`player_kill`	tinyint,
	`player_dead`	tinyint,
	`team_id`	tinyint,
	`team_a_score`	int unsigned,
	`team_b_score`  int unsigned,
	`acct_name`	int unsigned,
	`char_name`	varchar(40),
	`char_level`	tinyint,
	`char_class`	tinyint	
)ENGINE=InnoDB DEFAULT CHARSET = utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN(733620)
);

DROP TABLE IF EXISTS `char_used_name_for_qq`;
CREATE TABLE `char_used_name_for_qq` (
	`log_datetime` datetime not null,
	`char_id` bigint unsigned not null,
	`char_used_name` varchar(40) not null,
	`char_name` varchar(40) not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);
DROP TABLE IF EXISTS `char_carpet_dye_for_qq`;
CREATE TABLE `char_carpet_dye_for_qq` (
	`log_datetime` datetime not null,
	`acct_name` int(10) unsigned NOT NULL,
	`char_name` varchar(40) not null,
	`old_pet_id` int(10) unsigned NOT NULL,
	`new_pet_id` int(10) unsigned NOT NULL,
	`pet_dye_id` int(10) unsigned NOT NULL,
	`excel_id` int(10) unsigned NOT NULL,
	`char_id`  bigint unsigned not null,
	`level`   smallint not null,
	`faculty` smallint not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `gift_bag_for_qq`;
CREATE TABLE `gift_bag_for_qq` (
	`log_datetime` datetime not null,
	`acct_name` int(10) unsigned NOT NULL,
	`char_name` varchar(40) not null,
	`bag_id` int(10) unsigned NOT NULL,
	`gift_id`  int(10) unsigned NOT NULL,
	`level`   smallint not null
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);


DROP TABLE IF EXISTS `shadow_pk_result`;
CREATE TABLE `shadow_pk_result` (
   `log_datetime` DATETIME NOT NULL,
   `acct_name` VARCHAR(32) NOT NULL,
   `char_name` VARCHAR(32) NOT NULL,
   `player_rank` INT(10) UNSIGNED NOT NULL,
   `shadow_rank` INT(10) UNSIGNED NOT NULL,
   `pk_result` SMALLINT(5) UNSIGNED NOT NULL,
   `time_use` INT(10) UNSIGNED NOT NULL,
   `char_level` SMALLINT(5) UNSIGNED NOT NULL,
   `char_faculty` SMALLINT(5) UNSIGNED NOT NULL,
   `coupon` INT(10) UNSIGNED NOT NULL
 ) ENGINE=INNODB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);


DROP TABLE IF EXISTS `shadow_pk_both_sides_detail`;
CREATE TABLE `shadow_pk_both_sides_detail` (
   `log_datetime` datetime NOT NULL,
	 `player_rank` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `char_level` smallint(5) unsigned,
   `char_faculty` smallint(5) unsigned,
   `char_power` int(10) unsigned,
   `shadow_rank` int(10) unsigned NOT NULL,
   `shadow_name` varchar(32),
   `shadow_level` smallint(5),
   `shadow_faculty` smallint(5),
   `shadow_power` int(10) unsigned,
   `pk_result` smallint(5) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
); 


DROP TABLE IF EXISTS `consume_sys_point`;
CREATE TABLE `consume_sys_point` (
   `log_datetime` datetime NOT NULL,
   `account_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `cause` smallint(5) unsigned NOT NULL,
   `point` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
); 

DROP TABLE IF EXISTS `new_vip_info_add_for_qq`;
CREATE TABLE `new_vip_info_add_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `char_level` smallint(5) unsigned NOT NULL,
   `case_id` tinyint unsigned NOT NULL,
   `case_data` int(10) unsigned NOT NULL,
   `day_add` int(10) unsigned NOT NULL,
   `value_add` int(10) unsigned NOT NULL,
   `rst`  tinyint NOT NULL,
   `vip_time` int(10) unsigned NOT NULL,
   `now_value` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
); 


DROP TABLE IF EXISTS `new_vip_growth_for_qq`;
CREATE TABLE `new_vip_growth_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `char_level` smallint(5) unsigned NOT NULL,
   `value_add` int(10) NOT NULL,
   `now_value` int(10) unsigned NOT NULL,
   `vip_time`  int(10) unsigned NOT NULL,
   `vip_index` tinyint unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);


DROP TABLE IF EXISTS `fast_shop_buy_for_qq`;
CREATE TABLE `fast_shop_buy_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `char_level` smallint(5) unsigned NOT NULL,
   `item_id` int(10) unsigned NOT NULL,
   `item_num` int(10) unsigned NOT NULL,
   `item_price` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `conv_send_for_qq`;
CREATE TABLE `conv_send_for_qq` (
   `log_datetime` datetime NOT NULL,
   `src_id` bigint(20) unsigned NOT NULL,
   `src_money` int(10) unsigned NOT NULL,
   `dest_id` bigint(20) unsigned NOT NULL,
   `dest_money` int(10) unsigned NOT NULL,
   `max_id` bigint(20) unsigned NOT NULL,
   `max_money` int(10) unsigned NOT NULL,
   `conv_src_id` bigint(20) unsigned NOT NULL,
   `conv_dest_id` bigint(20) unsigned NOT NULL,
   `conv_money` int(10) unsigned NOT NULL,
   `conv_time` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `conv_match_for_qq`;
CREATE TABLE `conv_match_for_qq` (
   `log_datetime` datetime NOT NULL,
   `src_id` bigint(20) unsigned NOT NULL,
   `dest_id` bigint(20) unsigned NOT NULL,
   `money` int(10) unsigned NOT NULL,
   `conv_time` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `conv_war_consume_for_qq`;
CREATE TABLE `conv_war_consume_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `guild_id` bigint(20) unsigned NOT NULL,
   `money` int(10) unsigned NOT NULL,
   `Bction` int(10) unsigned NOT NULL,
   `Resource1` int(10) unsigned NOT NULL,
   `Resource2` int(10) unsigned NOT NULL,
   `Resource3` int(10) unsigned NOT NULL,
   `Resource4` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `conv_war_rst_for_qq`;
CREATE TABLE `conv_war_rst_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `guild_id` bigint(20) unsigned NOT NULL,
   `guild_name` varchar(32) NOT NULL,
   `camp` tinyint(3) unsigned NOT NULL,
   `restype` smallint(6) unsigned NOT NULL,
   `num` int(10) NOT NULL,
   `result` tinyint(3) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);
-- 1443
DROP TABLE IF EXISTS `char_pet_recover_for_qq`;
CREATE TABLE `char_pet_recover_for_qq` (
	`log_datetime` DATETIME NOT NULL,
	`acct_name` INT(10) UNSIGNED NOT NULL,
	`char_name` VARCHAR(40) NOT NULL,
	`pet_id`    BIGINT UNSIGNED NOT NULL,
	`pet_name`  VARCHAR(40) NOT NULL,
	`cmd`       VARCHAR(1024)	 NOT NULL,
	`char_id`  BIGINT UNSIGNED NOT NULL,
	`level`   SMALLINT NOT NULL,
	`faculty` SMALLINT NOT NULL
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `tianmohuanjing`;
CREATE TABLE `tianmohuanjing` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `area` int(10) unsigned NOT NULL,
   `level` smallint(6) unsigned NOT NULL,
   `faculty` tinyint(3) NOT NULL,
   `case_id` tinyint(3) unsigned NOT NULL,
   `data1`	int(10) unsigned NOT NULL,
   `data2`	int(10) unsigned NOT NULL,
   `data3`	int(10) unsigned NOT NULL,
   `data4`	int(10) unsigned NOT NULL,
   `data5`	int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);


-- 1452
DROP TABLE IF EXISTS `char_pet_spirit_for_qq`;
CREATE TABLE `char_pet_spirit_for_qq` (
	`log_datetime` DATETIME NOT NULL,
	`acct_name` INT(10) UNSIGNED NOT NULL,
	`char_name` VARCHAR(40) NOT NULL,
	`pet_id`  BIGINT UNSIGNED NOT NULL,
	`pet_name` VARCHAR(40) NOT NULL,
	`spirit_growth` INT(10) UNSIGNED NOT NULL,
	`spirit_level` INT(10) UNSIGNED NOT NULL,
	`spirit_th` SMALLINT UNSIGNED NOT NULL,
	`spirit_id` SMALLINT UNSIGNED NOT NULL,
	`spirit_value` VARCHAR(40)  NOT NULL,
	`spirit_action` SMALLINT UNSIGNED NOT NULL,
	`char_id`  BIGINT UNSIGNED NOT NULL,
	`level`   TINYINT UNSIGNED NOT NULL,
	`faculty` TINYINT UNSIGNED  NOT NULL,
	`lock_type` TINYINT UNSIGNED NOT NULL
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

-- 1453
DROP TABLE IF EXISTS `char_pet_spirit_level_for_qq`;
CREATE TABLE `char_pet_spirit_level_for_qq` (
	`log_datetime` DATETIME NOT NULL,
	`acct_name` INT(10) UNSIGNED NOT NULL,
	`char_name` VARCHAR(40) NOT NULL,
	`pet_id` BIGINT UNSIGNED NOT NULL,
	`pet_name` VARCHAR(40)  NOT NULL,
	`ori_level` SMALLINT UNSIGNED NOT NULL,
	`new_level` SMALLINT UNSIGNED NOT NULL,
	`growth_incre` SMALLINT UNSIGNED NOT NULL,
	`growth_now`  BIGINT UNSIGNED NOT NULL,
	`rst`   TINYINT UNSIGNED NOT NULL,
	`char_id` BIGINT UNSIGNED NOT NULL,
	`char_level`   TINYINT UNSIGNED NOT NULL,
	`faculty` TINYINT UNSIGNED  NOT NULL
)ENGINE=InnoDB default charset=UTF8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `petid_log_for_qq`;
CREATE TABLE `petid_log_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `area` int(10) unsigned NOT NULL,
   `level` smallint(6) unsigned NOT NULL,
   `faculty` tinyint(3) NOT NULL,
   `case_id` int(10) unsigned NOT NULL,
   `case_data`	int(10) unsigned NOT NULL,
   `excel_id`	int(10) unsigned NOT NULL,
   `item_id`	bigint(20) unsigned NOT NULL,
   `pet_id`	int(10) unsigned NOT NULL,
   `pet_type`	int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `transformer_info_for_qq`;
CREATE TABLE `transformer_info_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `area` int(10) unsigned NOT NULL,
   `level` smallint(6) unsigned NOT NULL,
   `faculty` tinyint(3) NOT NULL,
   `case_id` int(10) unsigned NOT NULL,
   `case_data`	int(10) unsigned NOT NULL,
   `old_id`	int(10) unsigned NOT NULL,
   `new_id`	int(10) unsigned NOT NULL,
   `flag`	int(10) unsigned NOT NULL,
   `used`	int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `guild_union_info_for_qq`;
CREATE TABLE `guild_union_info_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `case_id` smallint(6) unsigned NOT NULL,
   `guild1_id` bigint unsigned NOT NULL,
   `guild2_id` bigint unsigned NOT NULL,
   `guild1_name` varchar(32) NOT NULL,
   `guild2_name` varchar(32) NOT NULL,
   `lead1` varchar(32) NOT NULL,
   `lead2` varchar(32) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `guild_judge_value_for_qq`;
CREATE TABLE `guild_judge_value_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `guild_id` bigint unsigned NOT NULL,
   `value` int(10) unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `guild_avoid_war_for_qq`;
CREATE TABLE `guild_avoid_war_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `guild1_id` bigint unsigned NOT NULL,
   `value1` varchar(32) NOT NULL,
   `guild2_id` bigint unsigned NOT NULL,
   `value2` varchar(32) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `legend_equip_for_qq`;
CREATE TABLE `legend_equip_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `char_rank` tinyint(3) unsigned NOT NULL,
   `faulty` tinyint(3) unsigned NOT NULL,
   `excel_id` int(10) unsigned NOT NULL,
   `atb_type1` smallint(5) NOT NULL,
   `atb_data1` smallint(5) NOT NULL,
   `atb_pct1` smallint(5) NOT NULL,
   `atb_type2` smallint(5) NOT NULL,
   `atb_data2` smallint(5) NOT NULL,
   `atb_pct2` smallint(5) NOT NULL,
   `atb_type3` smallint(5) NOT NULL,
   `atb_data3` smallint(5) NOT NULL,
   `atb_pct3` smallint(5) NOT NULL,
   `atb_type4` smallint(5) NOT NULL,
   `atb_data4` smallint(5) NOT NULL,
   `atb_pct4` smallint(5) NOT NULL,
   `satb_type1` smallint(5) NOT NULL,
   `satb_data1` smallint(5) NOT NULL,
   `satb_pct1` smallint(5) NOT NULL,
   `satb_type2` smallint(5) NOT NULL,
   `satb_data2` smallint(5) NOT NULL,
   `satb_pct2` smallint(5) NOT NULL,
   `satb_type3` smallint(5) NOT NULL,
   `satb_data3` smallint(5) NOT NULL,
   `satb_pct3` smallint(5) NOT NULL,
   `satb_type4` smallint(5) NOT NULL,
   `satb_data4` smallint(5) NOT NULL,
   `satb_pct4` smallint(5) NOT NULL,
   `trait_group` smallint(5) NOT NULL,
   `trait1` smallint(5) NOT NULL,
   `trait2` smallint(5) NOT NULL,
   `trait3` smallint(5) NOT NULL,
   `trait4` smallint(5) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `web_point_for_qq`;
CREATE TABLE `web_point_for_qq` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `now_value` int(10) NOT NULL,
   `after_value` int(10) NOT NULL,
   `rst` smallint NOT NULL,
   `rank` smallint unsigned NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `cs_gzs_assign`;
CREATE TABLE `cs_gzs_assign`(
`log_datetime` DATETIME NOT NULL,
`acct_name`	BIGINT(20),
`eventid`	INT,
`gzsid`		INT,	
`cs_svrid`	INT
)ENGINE=InnoDB DEFAULT CHARSET = utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `market_add`;
CREATE TABLE `market_add` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `level` smallint(6) unsigned NOT NULL,
   `faculty` tinyint(3) NOT NULL,
   `char_id` bigint(20) unsigned NOT NULL,
   `excel_id`	int(10) unsigned NOT NULL,
   `num`	int(10) unsigned NOT NULL,
   `price`	int(10) NOT NULL,
   `tax`	int(10) unsigned NOT NULL,
   `rst`	tinyint(3) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);


DROP TABLE IF EXISTS `market_deal`;
CREATE TABLE `market_deal` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `level` smallint(6) unsigned NOT NULL,
   `faculty` tinyint(3) NOT NULL,
   `char_id` bigint(20) unsigned NOT NULL,
   `trade_id` bigint(20) unsigned NOT NULL,
   `excel_id`	int(10) unsigned NOT NULL,
   `bought_num`	int(10) unsigned NOT NULL,
   `want_num`	int(10) unsigned NOT NULL,
   `price`	int(10) NOT NULL,
   `rst`	tinyint(3) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `market_abort`;
CREATE TABLE `market_abort` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `acct_name` int(10) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `level` smallint(6) unsigned NOT NULL,
   `faculty` tinyint(3) NOT NULL,
   `char_id` bigint(20) unsigned NOT NULL,
   `trade_id` bigint(20) unsigned NOT NULL,
   `excel_id`	int(10) unsigned NOT NULL,
   `bought_num`	int(10) unsigned NOT NULL,
   `want_num`	int(10) unsigned NOT NULL,
   `gain_num`	int(10) unsigned NOT NULL,
   `price`	int(10) NOT NULL,
   `rst`	tinyint(3) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `char_quest_info_for_qq_idip`;
CREATE TABLE `char_quest_info_for_qq_idip` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `function_name` char(30) NOT NULL,
  `quest_id` int(10) unsigned NOT NULL,
  `multiple` int(10) unsigned NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `area` int(10) unsigned NOT NULL,
  `char_rank` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `market_tax`;
CREATE TABLE `market_tax` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `price` int(10) unsigned NOT NULL,
   `want_num` int(10) unsigned NOT NULL,
   `bought_num` int(10) unsigned NOT NULL,
   `gain_num`	int(10) unsigned NOT NULL,
   `excelid`	int(10) unsigned NOT NULL,
   `rate`	smallint(6) NOT NULL,
   `tax`	int(10) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);
DROP TABLE IF EXISTS `pkmatch_firstblood`;
CREATE TABLE `pkmatch_firstblood` (
   `log_datetime` datetime NOT NULL,
   `servername` varchar(32) NOT NULL,
   `type_data` int(10)  NOT NULL,
   `team_id` int(10)  NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);
DROP TABLE IF EXISTS `xiuwei_energy`;
CREATE TABLE `xiuwei_energy` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `reason_id` int(10)  NOT NULL,
  `reason_data` int(10) NOT NULL,
   `xiuwei` int(10) NOT NULL,
  `level` int(10) NOT NULL,
  `faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `equip_transfer`;
CREATE TABLE `equip_transfer` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `excel_id_src` smallint unsigned  NOT NULL,
  `excel_id_dst` smallint unsigned NOT NULL,
  `hole_count` tinyint unsigned NOT NULL,
  `stone_1` smallint unsigned NOT NULL,
  `stone_2` smallint unsigned NOT NULL,
  `stone_3` smallint unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `faculty` smallint unsigned NOT NULL,
  `recipe_id` int  NOT NULL default 0,
  `stone_4` smallint unsigned NOT NULL default 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `signin_award`;
CREATE TABLE `signin_award` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) NOT NULL,
  `char_name` char(40) NOT NULL,
  `char_level` smallint(6) NOT NULL,
  `faculty` smallint(6) NOT NULL,
  `award_type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `guild_money_tree_box`;
CREATE TABLE `guild_money_tree_box` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `guild_name` varchar(40) NOT NULL,
  `level` int(10) NOT NULL,
  `box_num` smallint unsigned NOT NULL,
  `box_id` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);


DROP TABLE IF EXISTS `gm_xianyu_add`;
CREATE TABLE `gm_xianyu_add` (
	`log_datetime` datetime NOT NULL,
	`char_sender` varchar(40) NOT NULL,
	`char_receiver` varchar(40) NOT NULL,
	`point` int  NOT NULL DEFAULT '0',
	`tag` smallint unsigned NOT NULL DEFAULT '0',
	`case_data` smallint  NOT NULL DEFAULT '0',
	`log_id` smallint unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `char_skill_count`;
CREATE TABLE `char_skill_count` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `area_id` int(10) unsigned NOT NULL,
  `level` int(10) NOT NULL,
  `faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `buy_svip_for_qq`;
CREATE TABLE `buy_svip_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `type` smallint unsigned  NOT NULL,
  `buy_index` smallint unsigned NOT NULL,
  `rst` smallint unsigned NOT NULL,
  `vip_expiration` int unsigned NOT NULL,
  `svip_expiration` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `dq_duikang_for_qq`;
CREATE TABLE `dq_duikang_for_qq` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `acct_name` int(10) unsigned NOT NULL,
  `char_name` varchar(40) NOT NULL,
  `area_id` int unsigned  NOT NULL,
  `score` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `bygzyt_floor`;
CREATE TABLE `bygzyt_floor` (
  `log_datetime` datetime NOT NULL,
  `servername` varchar(40) NOT NULL,
  `zyt_id` smallint unsigned  NOT NULL,
  `floor` smallint unsigned NOT NULL,
  `pasttime` int unsigned NOT NULL,
  `fightvalue00` int unsigned NOT NULL,
  `fightvalue01` int unsigned NOT NULL,
  `fightvalue10` int unsigned NOT NULL,
  `fightvalue11` int unsigned NOT NULL,
  `fightvalue20` int unsigned NOT NULL,
  `fightvalue21` int unsigned NOT NULL,
  `fightvalue30` int unsigned NOT NULL,
  `fightvalue31` int unsigned NOT NULL,
  `fightvalue40` int unsigned NOT NULL,
  `fightvalue41` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `treasure_get` ;
CREATE TABLE `treasure_get`(
`log_datetime` datetime NOT NULL,
`servername` varchar(40) NOT NULL,
`acct_name` int(10) unsigned NOT NULL,
`char_name` varchar(40) NOT NULL,
`case_id`  int(10) unsigned NOT NULL,
`case_data` int(10) unsigned NOT NULL,
`excel_id`	   smallint  unsigned NOT NULL,
`u_type`    smallint unsigned NOT NULL,
`gID` bigint(20) unsigned NOT NULL,
`level` smallint unsigned NOT NULL,
`faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620));

DROP TABLE IF EXISTS `treasure_lost` ;
CREATE TABLE `treasure_lost`(
`log_datetime` datetime NOT NULL,
`servername` varchar(40) NOT NULL,
`acct_name` int(10) unsigned NOT NULL,
`char_name` varchar(40) NOT NULL,
`case_id`  int(10) unsigned NOT NULL,
`case_data` int(10) unsigned NOT NULL,
`excel_id`	   smallint  unsigned NOT NULL,
`u_type`    smallint unsigned NOT NULL,
`u_exp`    int unsigned NOT NULL,
`gID` bigint(20) unsigned NOT NULL,
`level` smallint unsigned NOT NULL,
`faculty` smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620));

DROP TABLE IF EXISTS `jxtzc_for_qq` ;
CREATE TABLE `jxtzc_for_qq`(
	`log_datetime` datetime NOT NULL,
	`servername` varchar(40) NOT NULL,
	`scn_excel_id`	int unsigned NOT NULL,
	`layer`		int unsigned NOT NULL,
	`faculty`		smallint unsigned NOT NULL,
	`zhanli`	int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
	PARTITION p_20080801 VALUES IN (733620)
);
DROP TABLE IF EXISTS `char_delete_for_qq`;
CREATE TABLE `char_delete_for_qq`(
	`log_datetime` datetime NOT NULL,
	`acct_name` int(10) unsigned NOT NULL,
	`char_name` varchar(32) NOT NULL,
	`rst`	smallint unsigned  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `treasure_chgexp`;
CREATE TABLE `treasure_chgexp`(
	`log_datetime` datetime NOT NULL,
	`servername`	varchar(40) NOT NULL,
	`acct_name` int(10) unsigned NOT NULL,
	`char_name` varchar(32) NOT NULL,
	`case_id`	 smallint unsigned NOT NULL,
	`case_data`	 int(10) unsigned NOT NULL,
	`excel_id`   smallint unsigned NOT NULL,
	`before_exp` int(10) unsigned NOT NULL,
	`after_exp`  int(10) unsigned NOT NULL,
	`char_rank`	 smallint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `cross_zhenyaota`;
CREATE TABLE `cross_zhenyaota` (
`log_datetime` datetime NOT NULL,
`servername` varchar(40) NOT NULL,
`cate` bigint unsigned NOT NULL,
`ta_id` int unsigned not null,
`data1` int unsigned not null,
`data2` int unsigned not null,
`data3` int unsigned not null,
`data4` int unsigned not null,
`data5` int unsigned not null,
`acct_name` int(10) unsigned NOT NULL,
`char_name` varchar(40) NOT NULL,
`char_list_id` bigint not null,
`area`         int unsigned not null,
`char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
`series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

CREATE TABLE `idip_ly_add` (
 `dtEventTime` datetime NOT NULL,
 `iUin` int(20) unsigned NOT NULL,
 `iArea` smallint unsigned NOT NULL,
 `item_id`  int unsigned NOT NULL,
 `item_num`  int unsigned NOT NULL,
 `serialnum` varchar(32) NOT NULL,
 `source_id` smallint NOT NULL,
 `Cmd`	    varchar(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(dtEventTime))(
PARTITION p_20080801 VALUES IN (733620)
);
DROP TABLE IF EXISTS `pkmatch_handin_zcq`;
CREATE TABLE `pkmatch_handin_zcq`(
    `log_datetime`  datetime NOT NULL,
    `servername`    varchar(40) NOT NULL,
    `account_name`  int(10) unsigned NOT NULL,
    `char_name` varchar(40) NOT NULL,
    `handin_count`  int(10) NOT NULL,
    `char_id` bigint(20) unsigned NOT NULL,
    `support_type`   int(10) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `itemuse_object`;
CREATE TABLE `itemuse_object` (
`log_datetime` datetime NOT NULL,
`servername` varchar(40) NOT NULL,
`excel_id` int unsigned not null,
`char_name` varchar(40) NOT NULL,
`obj_name` varchar(40)  not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `duanwujie_for_qq`;
CREATE TABLE `duanwujie_for_qq` (
`log_datetime` datetime NOT NULL,
`servername` varchar(40) NOT NULL,
`team_index` varchar(40) not null,
`player_num` int unsigned not null,
`team_score` int unsigned not null,
`combo1_num` int unsigned not null,
`combo2_num` int unsigned not null,
`combo3_num` int unsigned not null,
`combo4_num` int unsigned not null,
`acct_name` int(10) unsigned NOT NULL,
`char_name` varchar(40) NOT NULL,
`char_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
`series` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `red_envelope_for_qq`;
CREATE TABLE `red_envelope_for_qq` (
  `log_datetime` datetime NOT NULL,
  `type` varchar(40) NOT NULL,
  `env_id` bigint(20) unsigned NOT NULL,
  `env_idx` smallint(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `char_id` bigint(20) unsigned NOT NULL,
  `num` smallint(10) unsigned NOT NULL DEFAULT '0',
  `rst` smallint(10)  NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
PARTITION BY LIST (TO_DAYS(log_datetime))( 
PARTITION p_20080801 VALUES IN (733620)
);

DROP TABLE IF EXISTS `wuxingjie_for_qq`;
CREATE TABLE `wuxingjie_for_qq`(
	`log_datetime` datetime NOT NULL,
	`servername` varchar(32) NOT NULL,
	`type` varchar(32) NOT NULL,
	`acct_name` int(10) unsigned NOT NULL,
	`char_name` varchar(32) NOT NULL,
	`team_info` varchar(512) NOT NULL,
	`team_leader` varchar(32) NOT NULL,
	`start_time` datetime NOT NULL,
	`end_time`   datetime NOT NULL,
	`char_rank`  tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
partition by list (to_days(log_datetime))(
partition p_20080801 values in (733620)
);

DROP TABLE IF EXISTS `player_chongzi_battle`;
CREATE TABLE `player_chongzi_battle`(
        `log_datetime`          datetime NOT NULL,
        `servername`            varchar(40) NOT NULL,
        `account_name`          int(10) unsigned NOT NULL,
        `char_name`             varchar(40) NOT NULL,
        `total_game_time`       INT unsigned NOT NULL,
        `player_chongzi_type`   INT unsigned NOT NULL,
        `player_chongzi_level`  INT unsigned NOT NULL,
        `kill_num`              INT  NOT NULL,
        `bekilled_num`          INT  NOT NULL,
        `excel_id0`             SMALLINT unsigned NOT NULL,
        `excel_id1`             SMALLINT unsigned NOT NULL,
        `excel_id2`             SMALLINT unsigned NOT NULL,
        `excel_id3`             SMALLINT unsigned NOT NULL,
        `excel_id4`             SMALLINT unsigned NOT NULL,
        `excel_id5`             SMALLINT unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY LIST (TO_DAYS(log_datetime))(
PARTITION p_20151201 VALUES IN (736298)
);
	

