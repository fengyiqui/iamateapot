-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- DBI --
CREATE TABLE `dbi_socket` (
	`dbi_id`						smallint 	unsigned	NOT NULL default 0,
	`socket_id`					int						unsigned	NOT NULL default 0,
	PRIMARY KEY					(`dbi_id`),
	UNIQUE KEY					(`socket_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 扣点记录偏移 --
CREATE TABLE `slave_relay_index` (
	`cps_position`			bigint				unsigned	NOT NULL default 0,
	`lps_position`			bigint				unsigned	NOT NULL default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 扣点记录 --
CREATE TABLE `slave_relay_log` (
	`id`								bigint				unsigned	NOT NULL,
	`account`						char(32)								NOT NULL default '',
	`available_delta`		int											NOT NULL default 0,
	`frozen_delta`			int											NOT NULL default 0,
	PRIMARY KEY					(`id`),
	UNIQUE KEY					(`account`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 点数快照 --
CREATE TABLE `slave_point` (
	`account`						char(32)								NOT NULL,
	`available_init`		int						unsigned	NOT NULL default 0,
	`frozen_init`				int						unsigned	NOT NULL default 0,
	`available_fini`		int						unsigned	NOT NULL default 0,
	`frozen_fini`				int						unsigned	NOT NULL default 0,
	PRIMARY KEY					(`account`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 游戏数值统计
CREATE TABLE `game_stats` (
	`id`								int						unsigned	NOT NULL,
	`val_1`							bigint				unsigned	NOT NULL default 0,
	`val_2`							bigint				unsigned	NOT NULL default 0,
	PRIMARY KEY					(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 排行榜 --
CREATE TABLE `ranking_list` (
	`rank_id`						int						unsigned	NOT NULL,
	`char_name`					char(32)								NOT NULL,
	`rank_data`					int											NOT NULL default 0,
	PRIMARY	KEY					(`rank_id`,`char_name`),
	INDEX								(`char_name`),
	INDEX								(`rank_data`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ranking_list_family` (
	`rank_id`						int						unsigned	NOT NULL,
	`family_name`				char(32)								NOT NULL,
	`rank_data`					int											NOT NULL default 0,
	PRIMARY	KEY					(`rank_id`,`family_name`),
	INDEX								(`rank_data`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ranking_list_guild` (
	`rank_id`						int						unsigned	NOT NULL,
	`guild_name`				char(32)								NOT NULL,
	`rank_data`					int											NOT NULL default 0,
	PRIMARY	KEY					(`rank_id`,`guild_name`),
	INDEX								(`rank_data`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 角色锁状态 --
CREATE TABLE `lock_characters` (
  `char_id`						bigint				unsigned	NOT NULL,
  `dbi_id`						tinyint				unsigned	NOT NULL default 0,
  `char_name`					char(32)								NOT NULL default '',
  PRIMARY	KEY					(`char_id`),
  INDEX								(`dbi_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 全局ID --
CREATE TABLE `global_id` (
  `guid`							bigint				unsigned	NOT NULL,
  `area`							bigint									NOT NULL default 0,
  `server_id`					bigint									NOT NULL default 0,
  `reserve`						tinyint									NOT NULL default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 服务器信息 --
CREATE TABLE `gzs_info_incidx` (
  `server_id`					int						unsigned	NOT NULL,
  `inc_idx`						bigint				unsigned	NOT NULL	default 0,
  PRIMARY	KEY				(`server_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gzs_info_tagi` (
  `server_id`					int						unsigned	NOT NULL,
	`idx`								int						unsigned	NOT NULL	default 0,
	`tag`								int											NOT NULL	default 0,
	PRIMARY	KEY					(`server_id`,`idx`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gzs_info_tagq` (
  `server_id`					int						unsigned	NOT NULL,
	`idx`								int						unsigned	NOT NULL	default 0,
	`tag`								bigint									NOT NULL	default 0,
	PRIMARY	KEY					(`server_id`,`idx`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gzs_info_str` (
  `server_id`					int						unsigned	NOT NULL,
	`idx`								int						unsigned	NOT NULL	default 0,
	`str`								char(128)								NOT NULL	default '',
	PRIMARY	KEY					(`server_id`,`idx`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gms_info_tagi` (
	`idx`								int						unsigned	NOT NULL	default 0,
	`tag`								int											NOT NULL	default 0,
	PRIMARY	KEY					(`idx`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gms_info_tagq` (
	`idx`								int						unsigned	NOT NULL	default 0,
	`tag`								bigint									NOT NULL	default 0,
	PRIMARY	KEY					(`idx`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gms_info_str` (
	`idx`								int						unsigned	NOT NULL	default 0,
	`str`								char(128)								NOT NULL	default '',
	PRIMARY	KEY					(`idx`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 权限 --
CREATE TABLE `restricted_accounts` (
  `acct_name`					char(32)								NOT NULL,
  `status`						tinyint				unsigned	NOT NULL	default 0,
  `out_time`					int						unsigned	NOT NULL	default 0,
  `reason`						smallint				unsigned    NOT NULL	default 0,
  PRIMARY 	KEY				(`acct_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `restricted_characters` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
  `status`						tinyint				unsigned	NOT NULL	default 0,
  `out_time`					int						unsigned	NOT NULL	default 0,
  `char_name`					char(32)								NOT NULL,
  PRIMARY 	KEY				(`char_id`),
	UNIQUE KEY 					(`char_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `passport_accounts` (
  `name` 							char(32)								NOT NULL,
  PRIMARY		KEY				(`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 个人关系 --
CREATE TABLE `personal_relations` (
	`at_char_id`				bigint				unsigned	NOT NULL,
	`ps_char_id`				bigint				unsigned	NOT NULL,
	`flag`							tinyint									NOT NULL,
	`rank`							smallint			unsigned	NOT NULL	default 0,
	PRIMARY KEY (`at_char_id`,`ps_char_id`,`flag`),
	INDEX (`ps_char_id`,`flag`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 留言索引，被屏蔽次数 --
CREATE TABLE `messages_index` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`pri_msg_idx`				int						unsigned	NOT NULL	default 0,
	`spec_msg_limit`		tinyint				unsigned	NOT NULL	default 0,
	`today_send_count`	tinyint				unsigned	NOT NULL	default 0,
	`last_send_day`			date										NOT NULL	default 0,
	`blacklist_count`		smallint			unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 私有留言 --
CREATE TABLE `pri_messages` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`msg_id`						int						unsigned	NOT NULL	default 0,
	`msg_date`					int						unsigned	NOT NULL	default 0,
	`msg_flag`					tinyint									NOT NULL	default 0,
	`msg_readed`				bool										NOT NULL	default 0,
	`sender`						char(32)								NOT NULL	default '',
	`msg_stuff`					blob										NOT NULL,
	`get_lock` 					tinyint										 NOT NULL default 0,
	PRIMARY KEY					(`char_id`,`msg_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 家族 --
CREATE TABLE `families` (
	`family_id`					bigint				unsigned	NOT NULL	default 0,
	`srv_id`						tinyint				unsigned	NOT NULL	default 0,
	`build_time`				int						unsigned	NOT NULL	default 0,
	`status`						tinyint				unsigned	NOT NULL	default 0,
	`temp_time`					int						unsigned	NOT NULL	default 0,
	`name`							char(128)								NOT NULL	default '',
	`leader`						char(128)								NOT NULL	default '',
	`info`							blob										NOT NULL,
	`intro`							blob										NOT NULL,
	`energy`						int											NOT NULL	default 0,
	`size`							int											NOT NULL	default 0,
	`maxmember`					int											NOT NULL	default 0,
	`active`						binary(28)							NOT NULL	default '',
	PRIMARY KEY					(`family_id`),
	UNIQUE KEY 					(`name`),
	INDEX								(`srv_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 家族成员 --
CREATE TABLE `family_members` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`family_id`					bigint				unsigned	NOT NULL	default 0,
	`class`							tinyint				unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`char_id`),
	INDEX 							(`family_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 家族申请 --
CREATE TABLE `family_pseudomembers` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`family_id`					bigint				unsigned	NOT NULL	default 0,
	`request`						blob										NOT NULL,
	`request_time`			int						unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`char_id`),
	INDEX								(`family_id`)
)ENGINE=Innodb DEFAULT CHARSET=utf8;

-- 家族新闻 --
CREATE TABLE `family_news` (
	`new_id`						bigint				unsigned	NOT NULL	default 0,
	`family_id`					bigint				unsigned	NOT NULL	default 0,
	`new_type`					tinyint				unsigned	NOT NULL	default 0,
	`data1`							int											NOT NULL	default 0,
	`data2`							int											NOT NULL	default 0,
	`szData`						blob										NOT NULL,
	PRIMARY KEY					(`new_id`),
	INDEX								(`family_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 公会 --
CREATE TABLE `guilds` (
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`srv_id`						tinyint				unsigned	NOT NULL	default 0,
	`status`						tinyint				unsigned	NOT NULL	default 0,
	`build_time`				int						unsigned	NOT NULL	default 0,
	`temp_time`					int						unsigned	NOT NULL	default 0,
	`level`							int						unsigned	NOT NULL	default 0,
	`energy`						int						unsigned	NOT NULL	default 0,
	`size`							int						unsigned	NOT NULL	default 0,
	`money`							int						unsigned	NOT NULL	default 0,
	`credit`						int						unsigned	NOT NULL	default 0,
	`develop`						int						unsigned	NOT NULL	default 0,
	`action`						int						unsigned	NOT NULL	default 0,
	`scn_id`						int											NOT NULL	default 0,
	`dev_money`					int											NOT NULL	default 0,
	`dev_conf`					int											NOT NULL	default 0,
	`auth`							binary(40)							NOT NULL	default '',
	`auth_info`					blob										NOT NULL,
	`official_info`			blob										NOT NULL,
	`name`							char(128)								NOT NULL	default '',
	`leader`						char(128)								NOT NULL	default '',
	`info`							blob										NOT NULL,
	`intro`							blob										NOT NULL,
	`password`					blob										NOT NULL,
	`active`						binary(28)							NOT NULL	default '',
	`box_limit`					binary(8)								NOT NULL	default '',
	`dep_config`				binary(8)								NOT NULL	default '',
	`max_members`				int						unsigned	NOT NULL	default 0,
	`byte_flag`					blob										NOT NULL,
	`dword_flag`				blob										NOT NULL,
	`qword_flag`				blob										NOT NULL,
	`string_flag`				blob										NOT NULL,
	PRIMARY KEY					(`guild_id`),
	UNIQUE KEY 					(`name`),
	INDEX								(`srv_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公会成员 --
CREATE TABLE `guild_members` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`class`							tinyint				unsigned	NOT NULL	default 0,
	`contribution`			int						unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`char_id`),
	INDEX 							(`guild_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公会申请 --
CREATE TABLE `guild_pseudomembers` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`request`						blob										NOT NULL,
	`request_time`			int						unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`char_id`),
	INDEX								(`guild_id`)
)ENGINE=Innodb DEFAULT CHARSET=utf8;

-- 公会新闻 --
CREATE TABLE `guild_news` (
	`new_id`						bigint				unsigned	NOT NULL	default 0,
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`new_type`					tinyint				unsigned	NOT NULL	default 0,
	`data1`							int											NOT NULL	default 0,
	`data2`							int											NOT NULL	default 0,
	`szData`						blob										NOT NULL,
	PRIMARY KEY					(`new_id`),
	INDEX								(`guild_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公会资源 --
CREATE TABLE `guild_res` (
  `item_id`						bigint				unsigned	NOT NULL,
  `guild_id`					bigint				unsigned	NOT NULL	default 0,
  `excel_id`					smallint			unsigned	NOT NULL	default 0,
  `auto_id`						smallint			unsigned	NOT NULL	default 0,
  `get_time`					int						unsigned	NOT NULL	default 0,
  `num`								tinyint				unsigned	NOT NULL	default 0,
  `wear_out`					smallint			unsigned	NOT NULL	default 0,
  `max_wear_out`			smallint			unsigned	NOT NULL	default 0,
  `info_color`				tinyint				unsigned	NOT NULL	default 0,
  `bound`							tinyint				unsigned	NOT NULL	default 0,
  `pack`							tinyint				unsigned	NOT NULL	default 0,
  `enchant`						binary(12)							NOT NULL,
  `reserve`						tinyint				unsigned	NOT NULL	default 0,
  `info`							binary(48)							NOT NULL,
  PRIMARY KEY					(`item_id`),
  INDEX								(`guild_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公会物品 --
CREATE TABLE `guild_items` LIKE `guild_res`;

-- 公会科技 --
CREATE TABLE `guild_techs` (
	`tech_id`						bigint				unsigned	NOT NULL	default 0,
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`excel_id`					smallint			unsigned	NOT NULL	default 0,
	`level`							int						unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`tech_id`),
	INDEX								(`guild_id`)
)ENGINE=Innodb DEFAULT CHARSET=utf8;

-- 公会装饰 --
CREATE TABLE `guild_fks` (
	`fk_id`							bigint				unsigned	NOT NULL	default 0,
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`cha_id`						smallint			unsigned	NOT NULL	default 0,
	`item_id`						smallint			unsigned	NOT NULL	default 0,
  `pos_x`							float(32,8)							NOT NULL	default 0,
  `pos_z`							float(32,8)							NOT NULL	default 0,
	PRIMARY KEY					(`fk_id`),
	INDEX								(`guild_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公会recipe --
CREATE TABLE `guild_recipes` (
	`recipe_id`					bigint				unsigned	NOT NULL	default 0,
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`excel_id`					smallint			unsigned	NOT NULL	default 0,
	`status`						tinyint				unsigned	NOT NULL	default 0,
	`start_time`				int											NOT NULL	default 0,
	PRIMARY KEY					(`recipe_id`),
	INDEX								(`guild_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 门派状态 --
CREATE TABLE `guild_state` (
  `state_id` bigint unsigned NOT NULL default '0',
  `guild_id` bigint unsigned NOT NULL default '0',
  `excel_id` smallint unsigned NOT NULL default '0',
  `start_time` int NOT NULL default '0',
  PRIMARY KEY  (`state_id`),
  INDEX (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 游戏内容 --
-- 完全表 --
CREATE TABLE	`entire_atbs`	(
`char_id` bigint NOT NULL default 0,
`atb_0` int NOT NULL default 0,
`atb_1` int NOT NULL default 0,
`atb_2` int NOT NULL default 0,
`atb_3` int NOT NULL default 0,
`atb_4` int NOT NULL default 0,
`atb_5` int NOT NULL default 0,
`atb_6` int NOT NULL default 0,
`atb_7` int NOT NULL default 0,
`atb_8` int NOT NULL default 0,
`atb_9` int NOT NULL default 0,
`atb_10` int NOT NULL default 0,
`atb_11` int NOT NULL default 0,
`atb_12` int NOT NULL default 0,
`atb_13` int NOT NULL default 0,
`atb_14` int NOT NULL default 0,
`atb_15` int NOT NULL default 0,
`atb_16` int NOT NULL default 0,
`atb_17` int NOT NULL default 0,
`atb_18` int NOT NULL default 0,
`atb_19` int NOT NULL default 0,
`atb_20` int NOT NULL default 0,
`atb_21` int NOT NULL default 0,
`atb_22` int NOT NULL default 0,
`atb_23` int NOT NULL default 0,
`atb_24` int NOT NULL default 0,
`atb_25` int NOT NULL default 0,
`atb_26` int NOT NULL default 0,
`atb_27` int NOT NULL default 0,
`atb_28` int NOT NULL default 0,
`atb_29` int NOT NULL default 0,
`atb_30` int NOT NULL default 0,
`atb_31` int NOT NULL default 0,
`atb_32` int NOT NULL default 0,
`atb_33` int NOT NULL default 0,
`atb_34` int NOT NULL default 0,
`atb_35` int NOT NULL default 0,
`atb_36` int NOT NULL default 0,
`atb_37` int NOT NULL default 0,
`atb_38` int NOT NULL default 0,
`atb_39` int NOT NULL default 0,
`atb_40` int NOT NULL default 0,
`atb_41` int NOT NULL default 0,
`atb_42` int NOT NULL default 0,
`atb_43` int NOT NULL default 0,
`atb_44` int NOT NULL default 0,
`atb_45` int NOT NULL default 0,
`atb_46` int NOT NULL default 0,
`atb_47` int NOT NULL default 0,
`atb_48` int NOT NULL default 0,
`atb_49` int NOT NULL default 0,
`atb_50` int NOT NULL default 0,
`atb_51` int NOT NULL default 0,
`atb_52` int NOT NULL default 0,
`atb_53` int NOT NULL default 0,
`atb_54` int NOT NULL default 0,
`atb_55` int NOT NULL default 0,
`atb_56` int NOT NULL default 0,
`atb_57` int NOT NULL default 0,
`atb_58` int NOT NULL default 0,
`atb_59` int NOT NULL default 0,
`atb_60` int NOT NULL default 0,
`atb_61` int NOT NULL default 0,
`atb_62` int NOT NULL default 0,
`atb_63` int NOT NULL default 0,
`atb_64` int NOT NULL default 0,
`atb_65` int NOT NULL default 0,
`atb_66` int NOT NULL default 0,
`atb_67` int NOT NULL default 0,
`atb_68` int NOT NULL default 0,
`atb_69` int NOT NULL default 0,
`atb_70` int NOT NULL default 0,
`atb_71` int NOT NULL default 0,
`atb_72` int NOT NULL default 0,
`atb_73` int NOT NULL default 0,
`atb_74` int NOT NULL default 0,
`atb_75` int NOT NULL default 0,
`atb_76` int NOT NULL default 0,
`atb_77` int NOT NULL default 0,
`atb_78` int NOT NULL default 0,
`atb_79` int NOT NULL default 0,
`atb_80` int NOT NULL default 0,
`atb_81` int NOT NULL default 0,
`atb_82` int NOT NULL default 0,
`atb_83` int NOT NULL default 0,
`atb_84` int NOT NULL default 0,
`atb_85` int NOT NULL default 0,
`atb_86` int NOT NULL default 0,
`atb_87` int NOT NULL default 0,
`atb_88` int NOT NULL default 0,
`atb_89` int NOT NULL default 0,
`atb_90` int NOT NULL default 0,
`atb_91` int NOT NULL default 0,
`atb_92` int NOT NULL default 0,
`atb_93` int NOT NULL default 0,
`atb_94` int NOT NULL default 0,
`atb_95` int NOT NULL default 0,
PRIMARY KEY (`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_quests` (
  `quest_id`					smallint			unsigned	NOT NULL	default 0,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `only_id`						bigint				unsigned	NOT NULL	default 0,
  `over_time`					tinyint				unsigned	NOT NULL	default 0,
  `quest_data`				binary(8)								NOT NULL	default '',
  PRIMARY KEY					(`quest_id`,`char_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_pets` (
  `pet_id`						bigint				unsigned	NOT NULL,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `auto_id`						smallint			unsigned	NOT NULL	default 0,
  `pet_info`					char(32)								NOT NULL	default '',
  `atb`								binary(64)							NOT NULL	default '',
  `byte_flag`					binary(32)							NOT NULL	default '',
  `word_flag`					binary(64)							NOT NULL	default '',
  PRIMARY KEY					(`pet_id`),
  INDEX 							(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_states` (
  `state_group_id`		smallint			unsigned	NOT NULL	default 0,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `state_time`				int						unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`state_group_id`,`char_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_skills` (
  `skill_id`					smallint			unsigned	NOT NULL	default 0,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `skill_level`				tinyint				unsigned	NOT NULL	default 0,
  `skill_disable`			tinyint				unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`skill_id`,`char_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_abilitys` (
  `ability_id`				smallint			unsigned	NOT NULL	default 0,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `ability_level`			smallint			unsigned	NOT NULL	default 0,
  `exp`								int						unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`ability_id`,`char_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_talents` (
  `talent_id`					smallint			unsigned	NOT NULL	default 0,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `talent_pointers`		tinyint				unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`talent_id`,`char_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_cooldowns` (
  `cooldown_id`				smallint			unsigned	NOT NULL	default 0,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `begin_time`				int						unsigned	NOT NULL	default 0,
  `keep_time`					int						unsigned	NOT NULL	default 0,
  `token`							tinyint				unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`cooldown_id`,`char_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_items` (
  `item_id`						bigint				unsigned	NOT NULL,
  `char_id`						bigint				unsigned	NOT NULL	default 0,
  `excel_id`					smallint			unsigned	NOT NULL	default 0,
  `auto_id`						smallint			unsigned	NOT NULL	default 0,
  `get_time`					int						unsigned	NOT NULL	default 0,
  `num`								smallint				unsigned	NOT NULL	default 0,
  `wear_out`					smallint			unsigned	NOT NULL	default 0,
  `max_wear_out`			smallint			unsigned	NOT NULL	default 0,
  `info_color`				tinyint				unsigned	NOT NULL	default 0,
  `bound`							tinyint				unsigned	NOT NULL	default 0,
  `pack`							tinyint				unsigned	NOT NULL	default 0,
  `enchant`						binary(12)							NOT NULL,
  `reserve`						tinyint				unsigned	NOT NULL	default 0,
  `info`							binary(48)							NOT NULL,
  PRIMARY KEY					(`item_id`),
  INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_copys` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`excel_id`					smallint			unsigned	NOT NULL	default 0,
	`auto_id`						smallint			unsigned	NOT NULL	default 0,
	`copy_time`					int						unsigned	NOT NULL	default 0,
	`enter_count`				smallint			unsigned	NOT NULL	default 0,
	`create_time`				int			        unsigned 	NOT NULL    default 0,
  PRIMARY KEY					(`excel_id`,`char_id`),
	INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_titles` (
	`char_id`						bigint				unsigned	NOT NULL	default 0,
	`excel_id`					smallint			unsigned	NOT NULL	default 0,
	`create_time`					int				unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`excel_id`,`char_id`),
	INDEX								(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_accounts` (
  `account_id`				bigint 				unsigned 	NOT NULL,
  `name`							char(32) 								NOT NULL 	default '',
  `property`					int 					unsigned 	NOT NULL 	default 0,
  `status`						int 					unsigned 	NOT NULL 	default 0,
  `max_level`					tinyint 			unsigned 	NOT NULL 	default 0,
  `create_time`				int						unsigned	NOT NULL	default 0,
  `last_login_time`		int						unsigned	NOT NULL	default 0,
  `last_delete_time`	int						unsigned	NOT NULL	default 0,
  `chosen_one`				bigint				unsigned	NOT NULL	default 0,
  `last_ip`						int						unsigned	NOT NULL	default 0,
  PRIMARY	KEY					(`account_id`),
  UNIQUE KEY 					(`name`),
  INDEX								(`last_login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entire_characters` (
  `char_id`						bigint				unsigned	NOT NULL,
  `account_id`				bigint				unsigned	NOT NULL	default 0,
  `name` 							char(32)								NOT NULL	default '',
  `create_time` 			int						unsigned	NOT NULL	default 0,
  `last_leave_time` 	int						unsigned	NOT NULL	default 0,
  `delete_time` 			int						unsigned	NOT NULL	default 0,
  `total_play_time` 	int 					unsigned 	NOT NULL 	default 0,
  `last_pos_x` 				float(32,8) 						NOT NULL 	default 0,
  `last_pos_y` 				float(32,8)							NOT NULL 	default 0,
  `last_pos_z` 				float(32,8)							NOT NULL 	default 0,
  `silence_time`			int						unsigned	NOT NULL	default 0,
  `scene_id`					smallint			unsigned	NOT NULL	default 0,
  `angle`							smallint			unsigned	NOT NULL	default 0,
  `dead_area_id`			smallint			unsigned	NOT NULL	default 0,
  `travel_id`					smallint			unsigned	NOT NULL	default 0,
  `travel_cur_point`	smallint			unsigned	NOT NULL	default 0,
  `travel_step`				smallint			unsigned	NOT NULL	default 0,
  `cur_title`					smallint			unsigned	NOT NULL	default 0,
  `define`						tinyint				unsigned	NOT NULL	default 0,
  `run`								tinyint				unsigned	NOT NULL	default 0,
  `mood`							tinyint				unsigned	NOT NULL	default 0,
  `breserve`					tinyint				unsigned	NOT NULL	default 0,
  `property`					int						unsigned	NOT NULL	default 0,
  `mark_delete`				tinyint				unsigned	NOT NULL	default 0,
  `gzs_idx`						tinyint				unsigned	NOT NULL	default 0,
  `old_scene_id`			int						unsigned	NOT NULL	default 0,
  `copy_entry_x`			float(32,8)							NOT NULL	default 0,
  `copy_entry_y`			float(32,8)							NOT NULL	default 0,
  `copy_entry_z`			float(32,8)							NOT NULL	default 0,
  `char_passwd`				char(32)								NOT NULL	default '',
  `item_passwd`				char(32)								NOT NULL	default '',

  `family_id`					bigint				unsigned	NOT NULL	default 0,
  `guild_id`					bigint				unsigned	NOT NULL	default 0,
  `family_status`			tinyint									NOT NULL	default 0,
  `guild_status`			tinyint									NOT NULL	default 0,
  `family_name`				char(32)								NOT NULL	default '',
  `guild_name`				char(32)								NOT NULL	default '',
  
  `sn_sex`						tinyint				unsigned	NOT NULL	default 0,
  `sn_age`						tinyint				unsigned	NOT NULL	default 0,
  `sn_animal`					tinyint				unsigned	NOT NULL	default 0,
  `sn_star`						tinyint				unsigned	NOT NULL	default 0,
  `sn_marriage`				tinyint				unsigned	NOT NULL	default 0,
  `sn_salary`					smallint			unsigned	NOT NULL	default 0,

	`sn_city`						char(16)								NOT NULL	default '',
	`sn_area`						char(16)								NOT NULL	default '',
	`sn_career`					char(16)								NOT NULL	default '',
	`sn_hobby`					char(64)								NOT NULL	default '',
	`sn_write`					tinyblob								NOT NULL,
	`sn_info`						tinyblob								NOT NULL,

  `relation`					binary(24)							NOT NULL	default '',
  `equip`							binary(20)							NOT NULL	default '',
  `scene_flag`				tinyblob								NOT NULL,
  `finding_flag`			tinyblob								NOT NULL,
  `bit_flag`					tinyblob								NOT NULL,
  `quest_flag`				blob										NOT NULL,
  `recipe_flag`				blob										NOT NULL,
  `qbit_flag`					blob										NOT NULL,
  `byte_flag`					blob										NOT NULL,
  `word_flag`					blob										NOT NULL,
  `dword_flag`				blob										NOT NULL,
  `qword_flag`				blob										NOT NULL,
  `string_flag`				blob										NOT NULL,
  `shotcut_type`			blob										NOT NULL,
  `shotcut_id`				blob										NOT NULL,
  `camp_data`					blob										NOT NULL,
  `reserve`						blob										NOT NULL,
  `ma_relation_status`			tinyint NOT NULL default 0,
  `show_title`				smallint(5) unsigned not null default 0,
  `act_passive`				blob 	NOT NULL,
  `keyboard_code`			 tinyblob not null,	
  `act_fb_new_skill`				blob 	NOT NULL,
  `league_id`					bigint				unsigned	NOT NULL	default 0,
  `league_status`			tinyint									NOT NULL	default 0,
  `league_name`				char(32)								NOT NULL	default '',
  `league_svrid`			tinyint									NOT NULL	default 0,
  PRIMARY 	KEY  			(`char_id`),
  UNIQUE 		KEY				(`name`),
  INDEX 							(`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 常用表 --
CREATE TABLE `common_atbs` LIKE `entire_atbs`;
CREATE TABLE `common_quests` LIKE `entire_quests`;
CREATE TABLE `common_pets` LIKE `entire_pets`;
CREATE TABLE `common_states` LIKE `entire_states`;
CREATE TABLE `common_skills` LIKE `entire_skills`;
CREATE TABLE `common_abilitys` LIKE `entire_abilitys`;
CREATE TABLE `common_talents` LIKE `entire_talents`;
CREATE TABLE `common_cooldowns` LIKE `entire_cooldowns`;
CREATE TABLE `common_items` LIKE `entire_items`;
CREATE TABLE `common_copys` LIKE `entire_copys`;
CREATE TABLE `common_titles` LIKE `entire_titles`;
CREATE TABLE `common_accounts` LIKE `entire_accounts`;
CREATE TABLE `common_characters` LIKE `entire_characters`;
CREATE TABLE `common_atbs2` LIKE `entire_atbs`;
CREATE TABLE `common_skills2` LIKE `entire_skills`;

-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 删除表 --
CREATE TABLE `delete_atbs` LIKE `entire_atbs`;
CREATE TABLE `delete_quests` LIKE `entire_quests`;
CREATE TABLE `delete_pets` LIKE `entire_pets`;
CREATE TABLE `delete_states` LIKE `entire_states`;
CREATE TABLE `delete_skills` LIKE `entire_skills`;
CREATE TABLE `delete_abilitys` LIKE `entire_abilitys`;
CREATE TABLE `delete_talents` LIKE `entire_talents`;
CREATE TABLE `delete_cooldowns` LIKE `entire_cooldowns`;
CREATE TABLE `delete_items` LIKE `entire_items`;
CREATE TABLE `delete_copys` LIKE `entire_copys`;
CREATE TABLE `delete_titles` LIKE `entire_titles`;

CREATE TABLE `delete_accounts` (
  `account_id`				bigint 				unsigned 	NOT NULL,
  `name`							char(32) 								NOT NULL 	default '',
  `property`					int 					unsigned 	NOT NULL 	default 0,
  `status`						int 					unsigned 	NOT NULL 	default 0,
  `max_level`					tinyint 			unsigned 	NOT NULL 	default 0,
  `create_time`				int						unsigned	NOT NULL	default 0,
  `last_login_time`		int						unsigned	NOT NULL	default 0,
  `last_delete_time`	int						unsigned	NOT NULL	default 0,
  `chosen_one`				bigint				unsigned	NOT NULL	default 0,
  `last_ip`						int						unsigned	NOT NULL	default 0,
  PRIMARY	KEY					(`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `delete_characters` (
  `char_id`						bigint				unsigned	NOT NULL,
  `account_id`				bigint				unsigned	NOT NULL	default 0,
  `name` 							char(32)								NOT NULL	default '',
  `create_time` 			int						unsigned	NOT NULL	default 0,
  `last_leave_time` 	int						unsigned	NOT NULL	default 0,
  `delete_time` 			int						unsigned	NOT NULL	default 0,
  `total_play_time` 	int 					unsigned 	NOT NULL 	default 0,
  `last_pos_x` 				float(32,8) 						NOT NULL 	default 0,
  `last_pos_y` 				float(32,8)							NOT NULL 	default 0,
  `last_pos_z` 				float(32,8)							NOT NULL 	default 0,
  `silence_time`			int						unsigned	NOT NULL	default 0,
  `scene_id`					smallint			unsigned	NOT NULL	default 0,
  `angle`							smallint			unsigned	NOT NULL	default 0,
  `dead_area_id`			smallint			unsigned	NOT NULL	default 0,
  `travel_id`					smallint			unsigned	NOT NULL	default 0,
  `travel_cur_point`	smallint			unsigned	NOT NULL	default 0,
  `travel_step`				smallint			unsigned	NOT NULL	default 0,
  `cur_title`					smallint			unsigned	NOT NULL	default 0,
  `define`						tinyint				unsigned	NOT NULL	default 0,
  `run`								tinyint				unsigned	NOT NULL	default 0,
  `mood`							tinyint				unsigned	NOT NULL	default 0,
  `breserve`					tinyint				unsigned	NOT NULL	default 0,
  `property`					int						unsigned	NOT NULL	default 0,
  `mark_delete`				tinyint				unsigned	NOT NULL	default 0,
  `gzs_idx`						tinyint				unsigned	NOT NULL	default 0,
  `old_scene_id`			int						unsigned	NOT NULL	default 0,
  `copy_entry_x`			float(32,8)							NOT NULL	default 0,
  `copy_entry_y`			float(32,8)							NOT NULL	default 0,
  `copy_entry_z`			float(32,8)							NOT NULL	default 0,
  `char_passwd`				char(32)								NOT NULL	default '',
  `item_passwd`				char(32)								NOT NULL	default '',

  `family_id`					bigint				unsigned	NOT NULL	default 0,
  `guild_id`					bigint				unsigned	NOT NULL	default 0,
  `family_status`			tinyint									NOT NULL	default 0,
  `guild_status`			tinyint									NOT NULL	default 0,
  `family_name`				char(32)								NOT NULL	default '',
  `guild_name`				char(32)								NOT NULL	default '',

  `sn_sex`						tinyint				unsigned	NOT NULL	default 0,
  `sn_age`						tinyint				unsigned	NOT NULL	default 0,
  `sn_animal`					tinyint				unsigned	NOT NULL	default 0,
  `sn_star`						tinyint				unsigned	NOT NULL	default 0,
  `sn_marriage`				tinyint				unsigned	NOT NULL	default 0,
  `sn_salary`					smallint			unsigned	NOT NULL	default 0,

	`sn_city`						char(16)								NOT NULL	default '',
	`sn_area`						char(16)								NOT NULL	default '',
	`sn_career`					char(16)								NOT NULL	default '',
	`sn_hobby`					char(64)								NOT NULL	default '',
	`sn_write`					tinyblob								NOT NULL,
	`sn_info`						tinyblob								NOT NULL,

  `relation`					binary(24)							NOT NULL	default '',
  `equip`							binary(20)							NOT NULL	default '',
  `scene_flag`				tinyblob								NOT NULL,
  `finding_flag`			tinyblob								NOT NULL,
  `bit_flag`					tinyblob								NOT NULL,
  `quest_flag`				blob										NOT NULL,
  `recipe_flag`				blob										NOT NULL,
  `qbit_flag`					blob										NOT NULL,
  `byte_flag`					blob										NOT NULL,
  `word_flag`					blob										NOT NULL,
  `dword_flag`				blob										NOT NULL,
  `qword_flag`				blob										NOT NULL,
  `string_flag`				blob										NOT NULL,
  `shotcut_type`			blob										NOT NULL,
  `shotcut_id`				blob										NOT NULL,
  `camp_data`					blob										NOT NULL,
  `reserve`						blob										NOT NULL,
`ma_relation_status`	tinyint not null default 0,
`show_title`		smallint(5) not null default 0,
`act_passive`					blob 										NOT NULL,
  `keyboard_code`			 tinyblob not null,
  `act_fb_new_skill`					blob 										NOT NULL,
   `league_id`					bigint				unsigned	NOT NULL	default 0,
  `league_status`			tinyint									NOT NULL	default 0,
  `league_name`				char(32)								NOT NULL	default '',
   `league_svrid`			tinyint									NOT NULL	default 0,
  PRIMARY 	KEY  			(`char_id`),
  INDEX 							(`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 模板和工具表 --
CREATE TABLE `template_characters` (
  `char_id`						bigint				unsigned	NOT NULL,
  `account_id`				bigint				unsigned	NOT NULL	default 0,
  `name` 							char(32)								NOT NULL	default '',
  `create_time` 			int						unsigned	NOT NULL	default 0,
  `last_leave_time` 	int						unsigned	NOT NULL	default 0,
  `delete_time` 			int						unsigned	NOT NULL	default 0,
  `total_play_time` 	int 					unsigned 	NOT NULL 	default 0,
  `last_pos_x` 				float(32,8) 						NOT NULL 	default 0,
  `last_pos_y` 				float(32,8)							NOT NULL 	default 0,
  `last_pos_z` 				float(32,8)							NOT NULL 	default 0,
  `silence_time`			int						unsigned	NOT NULL	default 0,
  `scene_id`					smallint			unsigned	NOT NULL	default 0,
  `angle`							smallint			unsigned	NOT NULL	default 0,
  `dead_area_id`			smallint			unsigned	NOT NULL	default 0,
  `travel_id`					smallint			unsigned	NOT NULL	default 0,
  `travel_cur_point`	smallint			unsigned	NOT NULL	default 0,
  `travel_step`				smallint			unsigned	NOT NULL	default 0,
  `cur_title`					smallint			unsigned	NOT NULL	default 0,
  `define`						tinyint				unsigned	NOT NULL	default 0,
  `run`								tinyint				unsigned	NOT NULL	default 0,
  `mood`							tinyint				unsigned	NOT NULL	default 0,
  `breserve`					tinyint				unsigned	NOT NULL	default 0,
  `property`					int						unsigned	NOT NULL	default 0,
  `mark_delete`				tinyint				unsigned	NOT NULL	default 0,
  `gzs_idx`						tinyint				unsigned	NOT NULL	default 0,
  `old_scene_id`			int						unsigned	NOT NULL	default 0,
  `copy_entry_x`			float(32,8)							NOT NULL	default 0,
  `copy_entry_y`			float(32,8)							NOT NULL	default 0,
  `copy_entry_z`			float(32,8)							NOT NULL	default 0,
  `char_passwd`				char(32)								NOT NULL	default '',
  `item_passwd`				char(32)								NOT NULL	default '',

  `family_id`					bigint				unsigned	NOT NULL	default 0,
  `guild_id`					bigint				unsigned	NOT NULL	default 0,
  `family_status`			tinyint									NOT NULL	default 0,
  `guild_status`			tinyint									NOT NULL	default 0,
  `family_name`				char(32)								NOT NULL	default '',
  `guild_name`				char(32)								NOT NULL	default '',
	
  `sn_sex`						tinyint				unsigned	NOT NULL	default 0,
  `sn_age`						tinyint				unsigned	NOT NULL	default 0,
  `sn_animal`					tinyint				unsigned	NOT NULL	default 0,
  `sn_star`						tinyint				unsigned	NOT NULL	default 0,
  `sn_marriage`				tinyint				unsigned	NOT NULL	default 0,
  `sn_salary`					smallint			unsigned	NOT NULL	default 0,

	`sn_city`						char(16)								NOT NULL	default '',
	`sn_area`						char(16)								NOT NULL	default '',
	`sn_career`					char(16)								NOT NULL	default '',
	`sn_hobby`					char(64)								NOT NULL	default '',
	`sn_write`					tinyblob								NOT NULL,
	`sn_info`						tinyblob								NOT NULL,

  `relation`					binary(24)							NOT NULL	default '',
  `equip`							binary(20)							NOT NULL	default '',
  `scene_flag`				tinyblob								NOT NULL,
  `finding_flag`			tinyblob								NOT NULL,
  `bit_flag`					tinyblob								NOT NULL,
  `quest_flag`				blob										NOT NULL,
  `recipe_flag`				blob										NOT NULL,
  `qbit_flag`					blob										NOT NULL,
  `byte_flag`					blob										NOT NULL,
  `word_flag`					blob										NOT NULL,
  `dword_flag`				blob										NOT NULL,
  `qword_flag`				blob										NOT NULL,
  `string_flag`				blob										NOT NULL,
  `shotcut_type`			blob										NOT NULL,
  `shotcut_id`				blob										NOT NULL,
  `camp_data`					blob										NOT NULL,
  `reserve`						blob										NOT NULL,
  `ma_relation_status` 					tinyint NOT NULL default 0,
  `show_title`						smallint(5) not null default 0,
  `act_passive`						blob 									NOT NULL,
  `keyboard_code` 				tinyblob not null,
  `act_fb_new_skill` 				blob not null,
  `league_id`					bigint				unsigned	NOT NULL	default 0,
  `league_status`			tinyint									NOT NULL	default 0,
  `league_name`				char(32)								NOT NULL	default '',
  `league_svrid`			tinyint									NOT NULL	default 0,
  PRIMARY 	KEY  			(`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE	`template_atbs`	(
`char_id` bigint NOT NULL default 0,
`atb_0` int NOT NULL default 0,
`atb_1` int NOT NULL default 0,
`atb_2` int NOT NULL default 0,
`atb_3` int NOT NULL default 0,
`atb_4` int NOT NULL default 0,
`atb_5` int NOT NULL default 0,
`atb_6` int NOT NULL default 0,
`atb_7` int NOT NULL default 0,
`atb_8` int NOT NULL default 0,
`atb_9` int NOT NULL default 0,
`atb_10` int NOT NULL default 0,
`atb_11` int NOT NULL default 0,
`atb_12` int NOT NULL default 0,
`atb_13` int NOT NULL default 0,
`atb_14` int NOT NULL default 0,
`atb_15` int NOT NULL default 0,
`atb_16` int NOT NULL default 0,
`atb_17` int NOT NULL default 0,
`atb_18` int NOT NULL default 0,
`atb_19` int NOT NULL default 0,
`atb_20` int NOT NULL default 0,
`atb_21` int NOT NULL default 0,
`atb_22` int NOT NULL default 0,
`atb_23` int NOT NULL default 0,
`atb_24` int NOT NULL default 0,
`atb_25` int NOT NULL default 0,
`atb_26` int NOT NULL default 0,
`atb_27` int NOT NULL default 0,
`atb_28` int NOT NULL default 0,
`atb_29` int NOT NULL default 0,
`atb_30` int NOT NULL default 0,
`atb_31` int NOT NULL default 0,
`atb_32` int NOT NULL default 0,
`atb_33` int NOT NULL default 0,
`atb_34` int NOT NULL default 0,
`atb_35` int NOT NULL default 0,
`atb_36` int NOT NULL default 0,
`atb_37` int NOT NULL default 0,
`atb_38` int NOT NULL default 0,
`atb_39` int NOT NULL default 0,
`atb_40` int NOT NULL default 0,
`atb_41` int NOT NULL default 0,
`atb_42` int NOT NULL default 0,
`atb_43` int NOT NULL default 0,
`atb_44` int NOT NULL default 0,
`atb_45` int NOT NULL default 0,
`atb_46` int NOT NULL default 0,
`atb_47` int NOT NULL default 0,
`atb_48` int NOT NULL default 0,
`atb_49` int NOT NULL default 0,
`atb_50` int NOT NULL default 0,
`atb_51` int NOT NULL default 0,
`atb_52` int NOT NULL default 0,
`atb_53` int NOT NULL default 0,
`atb_54` int NOT NULL default 0,
`atb_55` int NOT NULL default 0,
`atb_56` int NOT NULL default 0,
`atb_57` int NOT NULL default 0,
`atb_58` int NOT NULL default 0,
`atb_59` int NOT NULL default 0,
`atb_60` int NOT NULL default 0,
`atb_61` int NOT NULL default 0,
`atb_62` int NOT NULL default 0,
`atb_63` int NOT NULL default 0,
`atb_64` int NOT NULL default 0,
`atb_65` int NOT NULL default 0,
`atb_66` int NOT NULL default 0,
`atb_67` int NOT NULL default 0,
`atb_68` int NOT NULL default 0,
`atb_69` int NOT NULL default 0,
`atb_70` int NOT NULL default 0,
`atb_71` int NOT NULL default 0,
`atb_72` int NOT NULL default 0,
`atb_73` int NOT NULL default 0,
`atb_74` int NOT NULL default 0,
`atb_75` int NOT NULL default 0,
`atb_76` int NOT NULL default 0,
`atb_77` int NOT NULL default 0,
`atb_78` int NOT NULL default 0,
`atb_79` int NOT NULL default 0,
`atb_80` int NOT NULL default 0,
`atb_81` int NOT NULL default 0,
`atb_82` int NOT NULL default 0,
`atb_83` int NOT NULL default 0,
`atb_84` int NOT NULL default 0,
`atb_85` int NOT NULL default 0,
`atb_86` int NOT NULL default 0,
`atb_87` int NOT NULL default 0,
`atb_88` int NOT NULL default 0,
`atb_89` int NOT NULL default 0,
`atb_90` int NOT NULL default 0,
`atb_91` int NOT NULL default 0,
`atb_92` int NOT NULL default 0,
`atb_93` int NOT NULL default 0,
`atb_94` int NOT NULL default 0,
`atb_95` int NOT NULL default 0,
PRIMARY KEY (`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 拍卖行 --
CREATE TABLE `ah` (
	`item_id`						bigint		unsigned	not null default 0,
	`item_name`					char(96)						not null default '',
	`cate`							smallint	unsigned	not null default 0,
	`prof`							tinyint		unsigned	not null default 0,
	`talent`						tinyint		unsigned	not null default 0,
	`lvl`								tinyint		unsigned	not null default 0,
	`gender`						tinyint		unsigned	not null default 0,
	`expire`						int				unsigned	not null default 0,
	`price`							int				unsigned	not null default 0,
	`seller_name`				char(32)						not null default '',
	`data`							blob						not null,
PRIMARY KEY (`item_id`),
INDEX (`cate`),
INDEX (`prof`),
INDEX (`lvl`),
INDEX (`expire`),
INDEX (`price`),
INDEX (`seller_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ah_reverse_index_item_key_1` (
	`item_key`					char(6)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`item_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ah_reverse_index_item_key_2` (
	`item_key`					char(12)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`item_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ah_reverse_index_item_key_3` (
	`item_key`					char(18)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`item_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ah_reverse_index_item_key_4` (
	`item_key`					char(24)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`item_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ah_reverse_index_char_key_1` (
	`char_key`					char(6)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`char_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ah_reverse_index_char_key_2` (
	`char_key`					char(12)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`char_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ah_reverse_index_char_key_3` (
	`char_key`					char(18)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`char_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ah_reverse_index_char_key_4` (
	`char_key`					char(24)						not null default '',
	`item_id`						bigint		unsigned	not null default 0,
PRIMARY KEY (`char_key`, `item_id`),
FOREIGN KEY (`item_id`) REFERENCES ah(`item_id`) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 门派战争
CREATE TABLE `guild_war` (
	`guildwar_id`				bigint		unsigned	not null default 0,
	`off_id`						bigint		unsigned	not null default 0,
	`def_id`						bigint		unsigned	not null default 0,
	`off_name`					char(128)						not null default '',
	`def_name`					char(128)						not null default '',
	`off_srv_id`				tinyint		unsigned	not null default 0,
	`def_srv_id`				tinyint		unsigned	not null default 0,
	`start_time`				int				unsigned	not null default 0,
	PRIMARY KEY (`guildwar_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- LBA需要用到的表
-- -------------------------------------------------------------------------
--
-- 在线用户暂存表
--
DROP TABLE IF EXISTS `lba_online_accounts`;
CREATE TABLE `lba_online_accounts` (
	`account`				char(32)		NOT NULL,
	`bFCMStart`				int(1)			NOT NULL default 0,		-- 是否已经开了防沉迷
	`IP`					int unsigned	NOT NULL default 0,		-- 用户在线IP
	PRIMARY	KEY		(`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 角色仙玉花费表
-- 一周之内只修改week，一周结束之后把week累加到month上，week清空；如果刚好到了月结束，则把月累加到total上，month清空）
--
DROP TABLE IF EXISTS `lba_char_pointconsume`;
CREATE TABLE `lba_char_pointconsume` (
	`charname`				char(32)		NOT NULL,
	`count1`				int unsigned	NOT NULL default 0,		-- 本日累计消费
	`count2`				int unsigned	NOT NULL default 0,		-- 本周累计消费
	`count3`				int unsigned	NOT NULL default 0,		-- 本月累计消费
	`total`					int unsigned	NOT NULL default 0,		-- 整体累计消费
	`lastround1`			int unsigned	NOT NULL default 0,		-- 上次轮转的日数（标记数，代表当天0点的时刻）
	`lastround2`			int unsigned	NOT NULL default 0,		-- 上次轮转的周数（标记数，代表周一0点的时刻）
	`lastround3`			int unsigned	NOT NULL default 0,		-- 上次轮转的月数（标记数，代表本月1号0点的时刻）
	PRIMARY	KEY				(`charname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 角色仙玉花费排序表
--
-- rank_id表示排序表的类型：周表--1；月表--2；总表--3
--
DROP TABLE IF EXISTS `lba_char_pointconsume_rank_list`;
CREATE TABLE `lba_char_pointconsume_rank_list` (
	`rank_id`				int unsigned	NOT NULL,
	`charname`				char(32)		NOT NULL,
	`point`					int unsigned	NOT NULL default 0,		-- 累计消费
	PRIMARY	KEY				(`rank_id`, `charname`),
	INDEX					(`charname`),
	INDEX					(`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `slave_point_sync_log`;
CREATE TABLE `slave_point_sync_log`
(
	`id`		bigint 	unsigned NOT NULL,
	`account`	char(32)	NOT NULL default '',
	`available_delta` 	int 	NOT NULL default 0,
	`frozen_delta`		int	NOT NULL default 0,
	`time`			int(11) unsigned NOT NULL default 0,
	UNIQUE KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
CREATE TABLE `personal_relations_ma`(
	`char_id` 	BIGINT(20) NOT NULL ,
	`rela_char_id`  BIGINT(20) NOT NULL ,
	`relation`	INT	NOT NULL ,
	`relation_id` 	BIGINT(20) NOT NULL ,
	PRIMARY KEY(`char_id`,`rela_char_id`,`relation`),
	INDEX (`rela_char_id`),
	INDEX (`relation`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `relations_ma`;
CREATE TABLE `relations_ma`(
	`relation_id`      BIGINT(20) NOT NULL ,
	`master_value` int NOT NULL DEFAULT 0 ,
	`join_level`   int NOT NULL DEFAULT 0,
	PRIMARY KEY(`relation_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `unavailable_items` like common_items;
CREATE TABLE IF NOT EXISTS `unavailable_pets` like common_pets;
CREATE TABLE IF NOT EXISTS `unavailable_quests` like common_quests;
CREATE TABLE IF NOT EXISTS `unavailable_states` like common_states;
CREATE TABLE IF NOT EXISTS `unavailable_skills` like common_skills;
CREATE TABLE IF NOT EXISTS `unavailable_talents` like common_talents;
CREATE TABLE IF NOT EXISTS `unavailable_abilitys` like common_abilitys;
CREATE TABLE IF NOT EXISTS `unavailable_cooldowns` like common_cooldowns;
CREATE TABLE IF NOT EXISTS `unavailable_copys` like common_copys;
CREATE TABLE IF NOT EXISTS `unavailable_titles` like common_titles;
CREATE TABLE IF NOT EXISTS `unavailable_characters` like common_characters;
CREATE TABLE IF NOT EXISTS `unavailable_atbs` like common_atbs;
CREATE TABLE IF NOT EXISTS `unavailable_atbs2` like common_atbs;
CREATE TABLE IF NOT EXISTS `unavailable_skills2` like common_skills;
drop table if exists `unavailable_log`;
CREATE TABLE IF NOT EXISTS `unavailable_log` (
	`char_id` BIGINT(20) unsigned not null default 0,
	`name` char(32) not null default '',
	`time` int(10) unsigned not null default 0,
	`flag` tinyint(4) unsigned not null default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists `entire_passive` (
	`char_id`	bigint unsigned not null default 0,
	`passive_id`	smallint unsigned not null default 0,
	`level`		smallint unsigned not null default 0,
	PRIMARY KEY	(`passive_id`,`char_id`),
	INDEX 	(`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists `relations_love` (
	`relation_id` 	bigint(20) not null default 0,
	`love_value`    int  unsigned not null default 0,
	`valentine_time` int(10) unsigned not null default 0,
	`engaged_time`   int(10) unsigned not null default 0,
	`wedding_time`   int(10) unsigned not null default 0,
	primary key(`relation_id`)
)ENGINE=InnoDB default charset=utf8;

create table personal_relations_love like personal_relations_ma;

create table common_passive like entire_passive;
create table delete_passive like entire_passive;
create table unavailabel_passive like entire_passive;

-- 添加 原来是fix-to-20110721-items_ext-delete_char_error.sql 的内容
-- SP 有更新
CREATE TABLE IF NOT EXISTS `common_items_ext` (
	`item_id`	bigint	unsigned NOT NULL,
	`char_id`	bigint	unsigned NOT NULL,
	`int_flag_0`	int 	NOT NULL default 0,
	`int_flag_1`	int	NOT NULL default 0,
	`int_flag_2` 	int 	NOT NULL default 0,
	`int_flag_3`	int	NOT NULL default 0,
	`ext_info`	binary(48) not null,
	PRIMARY KEY (`item_id`),
	INDEX (`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table if not exists `entire_items_ext` like `common_items_ext`;
CREATE TABLE IF NOT EXISTS `guild_res_ext` (
	`item_id`	bigint	unsigned NOT NULL,
	`guild_id`	bigint	unsigned NOT NULL,
	`int_flag_0`	int 	NOT NULL default 0,
	`int_flag_1`	int	NOT NULL default 0,
	`int_flag_2` 	int 	NOT NULL default 0,
	`int_flag_3`	int	NOT NULL default 0,
	`ext_info`	binary(48) not null,
	PRIMARY KEY (`item_id`),
	INDEX (`guild_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `guild_items_ext` like `guild_res_ext`;
CREATE TABLE IF NOT EXISTS `unavailable_items_ext` like `common_items_ext`;
CREATE TABLE IF NOT EXISTS `delete_items_ext` like `common_items_ext`;
CREATE TABLE IF NOT EXISTS `unavailable_passive` like `common_passive`;

CREATE TABLE IF NOT EXISTS `common_summon_skill` (
  `char_id` bigint(20) NOT NULL,
  `skill` binary(64) NOT NULL,
  PRIMARY KEY  (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table if not exists `entire_summon_skill` like `common_summon_skill`;
create table if not exists `template_summon_skill` like `common_summon_skill`;
create table if not exists `delete_summon_skill` like `common_summon_skill`;
create table if not exists `unavailable_summon_skill` like `common_summon_skill`;

-- 添加 fix-to-20120206-char_shadow.sql 的内容
-- 角色分身属性表 `char_shadow_atb` 
CREATE TABLE IF NOT EXISTS `char_shadow_atb` (
   `char_id` bigint(20) NOT NULL,
   `name` varchar(32) NOT NULL,
   `account_id` bigint(20) unsigned NOT NULL,
   `excel_id` int(6) unsigned NOT NULL default '0',
   `lv` smallint(5) unsigned NOT NULL default '0',
   `faculty` tinyint(3) unsigned NOT NULL default '0',
   `current_str` int(5) unsigned NOT NULL default '0',
   `current_vit` int(5) unsigned NOT NULL default '0',
   `current_int` int(5) unsigned NOT NULL default '0',
   `current_def` int(5) unsigned NOT NULL default '0',
   `current_hp` int(6) unsigned NOT NULL default '0',
   `current_mp` int(6) unsigned NOT NULL default '0',
   `current_st` int(6) unsigned NOT NULL default '0',
   `anti_fixed` int(5) unsigned NOT NULL default '0',
   `anti_puzzle` int(5) unsigned NOT NULL default '0',
   `anti_drain` int(5) unsigned NOT NULL default '0',
   `anti_weaken` int(5) unsigned NOT NULL default '0',
   `dmg_point` int(5) unsigned NOT NULL default '0',
   `def_point` int(5) unsigned NOT NULL default '0',
   `att_point` int(5) unsigned NOT NULL default '0',
   `ph_chance` int(5) unsigned NOT NULL default '0',
   `mg_chance` int(5) unsigned NOT NULL default '0',
   `def_chance` int(5) unsigned NOT NULL default '0',
   `m_effect` int(5) unsigned NOT NULL default '0',
   `m_dp` int(5) unsigned NOT NULL default '0',
   `max_ph_luck` int(5) unsigned NOT NULL default '0',
   `max_mg_luck` int(5) unsigned NOT NULL default '0',
   `speed` float unsigned NOT NULL default '0',
   `dmg_absorb` int(5) NOT NULL default '0',
   `dmg_absorb_ratio` int(5) NOT NULL default '0',
   `out_point` int(5) unsigned NOT NULL default '0',
   `ignore_ph_def` int(5) unsigned NOT NULL default '0',
   `ignore_mg_def` int(5) unsigned NOT NULL default '0',
   `luck` int(5) unsigned NOT NULL default '0',
   `life_fight_value` int(5) unsigned NOT NULL default '0',
   `attack_fight_value` int(5) unsigned NOT NULL default '0',
   PRIMARY KEY (`char_id`),
   UNIQUE KEY `char_name` (`name`)
 ) ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 角色分身装备表 `char_shadow_equip` 
CREATE TABLE IF NOT EXISTS `char_shadow_equip` (
  `char_id` bigint(20) unsigned NOT NULL,
  `only_id` bigint(20) unsigned NOT NULL,
  `auto_id` smallint(6) unsigned NOT NULL,
  `excel_id` smallint(6) unsigned NOT NULL default '0',
  `reserve` tinyint(4) unsigned NOT NULL default '0',
  `wear_out` smallint(6) unsigned NOT NULL default '0',
  `max_wear_out` smallint(6) unsigned NOT NULL default '0',
  `num` smallint(4) unsigned NOT NULL default '0',
  `info_color` tinyint(4) unsigned NOT NULL default '0',
  `bound` tinyint(4) unsigned NOT NULL default '0',
  `pack` tinyint(4) unsigned NOT NULL default '0',
  `time` int(11) unsigned NOT NULL default '0',
  `enchant` binary(12) NOT NULL default '0\0\0\0\0\0\0\0\0\0\0\0',
  `info` binary(96) NOT NULL default '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `lock_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`char_id`,`auto_id`),
  UNIQUE KEY `item_id` USING BTREE (`only_id`),
  KEY `item_excel_id` (`excel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 角色分身状态表 `char_shadow_states` 
CREATE TABLE IF NOT EXISTS `char_shadow_states` (
   `char_id` bigint(20) unsigned NOT NULL default '0',
   `state_num` smallint(5) unsigned NOT NULL default '0',
   `state_array` varbinary(200) NOT NULL,
   PRIMARY KEY  (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 角色分身排行榜 `char_shadow_rank` 
CREATE TABLE IF NOT EXISTS `char_shadow_rank` (
   `char_id` bigint(20) unsigned NOT NULL,
   `rank_id` int(5) unsigned NOT NULL,
   `char_excel_id` int(5) unsigned NOT NULL,
   `char_name` varchar(32) NOT NULL,
   `level` smallint(3) unsigned NOT NULL,
   `faculty` tinyint(3) unsigned NOT NULL,
   `power` int(10) unsigned default '0',
   PRIMARY KEY  (`char_id`),
   UNIQUE KEY `name_index` (`char_name`),
   KEY `rank_id_index` (`rank_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 角色分身外观装备串表 `char_shadow_avatar`
CREATE TABLE  IF NOT EXISTS  `char_shadow_avatar` (
`char_id` bigint(20) unsigned NOT NULL,
   `helm` int(11) unsigned default '0',
   `armor` int(11) unsigned default '0',
   `waist` int(11) unsigned default '0',
   `trousers` int(11) unsigned default '0',
   `shoes` int(11) unsigned default '0',
   `weapon` int(11) unsigned default '0',
   `magicweapon` int(11) unsigned default '0',
   `vest` int(11) unsigned default '0',
   PRIMARY KEY  (`char_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- 角色pk结果信息表 `char_shadow_pk_info`  
CREATE TABLE IF NOT EXISTS `char_shadow_pk_info` (
	 `char_id` bigint(20) unsigned NOT NULL,
   `pk_time` bigint(20) unsigned NOT NULL,
   `target_id` bigint(20) unsigned default NULL,
   `target_name` varchar(32) NOT NULL,
   `is_challenger` tinyint(1) unsigned NOT NULL,
   `pk_result` tinyint(1) unsigned NOT NULL,
   `rank_change_type` tinyint(4) unsigned NOT NULL,
   `current_rank` int(6) unsigned default '0',
   PRIMARY KEY  (`char_id`,`pk_time`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- QQTIPS 
CREATE TABLE common_qqtips (
accepter_char_id BIGINT  NOT NULL DEFAULT 0,
sender_char_id BIGINT  NOT NULL DEFAULT 0,
send_time INT UNSIGNED NOT NULL DEFAULT 0,
times SMALLINT UNSIGNED NOT NULL DEFAULT 0,
create_time INT UNSIGNED NOT NULL DEFAULT 0,
accepter_account_id BIGINT  NOT NULL DEFAULT 0,
INDEX(send_time),
INDEX(create_time),
PRIMARY KEY(accepter_char_id, sender_char_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- MergeOrg
CREATE TABLE `merge_org` (
	`src_org`	bigint	unsigned	NOT NULL default 0,
	`dest_org`	bigint	unsigned	NOT NULL default 0,
	`src_name`	char(128)	NOT NULL default '',
	`dest_name`	char(128)	NOT NULL default '',
	`merge_time`	int	unsigned	NOT NULL default 0,
	PRIMARY KEY(`src_org`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- GuildWarConvention
CREATE TABLE `guild_war_convention` (
	`src_org`	bigint	unsigned	NOT NULL DEFAULT 0,
	`src_org_name` char(32)			NOT NULL,
	`src_srv_id`	int unsigned	NOT NULL,
	`dest_org`	bigint	unsigned	NOT NULL DEFAULT 0,
	`desc_org_name` char(32)		NOT NULL,
	`dest_srv_id`	int unsigned	NOT NULL,
	`conv_money` int	unsigned		NOT NULL DEFAULT 0,
	`status`		int	NOT NULL DEFAULT 0,
	`conv_time`	int unsigned		NOT NULL DEFAULT 0,
	PRIMARY KEY(`src_org`,`status`,`conv_time`),
	INDEX(`conv_time`),
	INDEX(`status`)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS `char_rename_request`;
CREATE TABLE `char_rename_request` (
       request_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	char_id BIGINT(20) not null default 0,
	now_name varchar(32),
	expect_name varchar(32),
	request_time  INT UNSIGNED,
	status tinyint,
	INDEX (`char_id`)
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `char_used_name`;
CREATE TABLE `char_used_name` (
	char_id BIGINT(20) not null default 0,
	old_name varchar(20),
	new_name varchar(20),
	change_time  int unsigned,
	INDEX (`char_id`),
	INDEX (`old_name`(6)),
	INDEX (`new_name`(6)),
	INDEX (`change_time`)
)ENGINE=InnoDB DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `guild_res_handin`;
CREATE TABLE `guild_res_handin` (
	`char_id`	bigint	unsigned	NOT	NULL	default	0,
	`guild_id`	bigint	unsigned	NOT NULL	default 0,
	`daymoney`	int	unsigned	NOT	NULL	default 0,
	`daydevelop`	int	unsigned	NOT	NULL	default	0,
	`dayres_1`	int	unsigned	NOT	NULL	default	0,
	`dayres_2`	int	unsigned	NOT	NULL	default	0,
	`dayres_3`	int	unsigned	NOT	NULL	default	0,
	`dayres_4`	int	unsigned	NOT	NULL	default	0,
	`dayres_5`	int	unsigned	NOT	NULL	default	0,
	`handin_time`	int	unsigned	NOT	NULL	default	0,
	`totalmoney`	int	unsigned	NOT	NULL	default	0,
	`totaldevelop`	int	unsigned	NOT	NULL	default	0,
	`totalres_1`	int	unsigned	NOT	NULL	default	0,
	`totalres_2`	int	unsigned	NOT	NULL	default	0,
	`totalres_3`	int	unsigned	NOT	NULL	default	0,
	`totalres_4`	int	unsigned	NOT	NULL	default	0,
	`totalres_5`	int	unsigned	NOT	NULL	default	0,
	PRIMARY	KEY	(`char_id`),
	INDEX	(`guild_id`)
	)ENGINE=Innodb	DEFAULT	CHARSET=utf8;
	
DROP TABLE IF EXISTS `guild_war_convention_history`;
CREATE TABLE `guild_war_convention_history` (
	`src_org`	bigint	unsigned	NOT NULL DEFAULT 0,
	`src_org_name` char(32)			NOT NULL,
	`src_srv_id`	int unsigned	NOT NULL,
	`dest_org`	bigint	unsigned	NOT NULL DEFAULT 0,
	`desc_org_name` char(32)		NOT NULL,
	`dest_srv_id`	int unsigned	NOT NULL,
	`conv_money` int	unsigned		NOT NULL DEFAULT 0,
	`status`		int	NOT NULL DEFAULT 0,
	`conv_time`	int unsigned		NOT NULL DEFAULT 0,
	PRIMARY KEY(`src_org`,`status`,`conv_time`),
	INDEX(`conv_time`),
	INDEX(`status`)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS `passwd_clear`;
CREATE TABLE `passwd_clear`(
	`account_id`	bigint unsigned		NOT	NULL DEFAULT 0,
	`type`		tinyint	NOT NULL DEFAULT 0,
	`clear_time`	int unsigned	NOT NULL DEFAULT 0,
	PRIMARY KEY(`account_id`,`type`)
	)ENGINE=Innodb	DEFAULT CHARSET=utf8;
	
	
	
-- 收购行 --
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market` (
	`trade_id`						bigint		unsigned	not null default 0,
	`char_id`						bigint		unsigned	not null default 0,
	`seller_name`					char(32)				not null default '',
	`signtime`						int			unsigned	not null default 0,
	`excelid`						int			unsigned	not null default 0,
	`item_name`						char(96)				not null default '',
	`item_type`						int			unsigned	not null default 0,
	`price`							int			unsigned	not null default 0,
	`want_num`					smallint	unsigned	not null default 0,
	`bought_num`					smallint	unsigned	not null default 0,
	`gained_num`						smallint	unsigned	not null default 0,
	`tax_rate`						smallint	unsigned	not null default 0,
PRIMARY KEY (`trade_id`,`char_id`),
INDEX (`signtime`),
INDEX (`price`),
INDEX(`item_name`),
INDEX (`seller_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `market_idx`;
CREATE TABLE `market_idx`(
	`idx`							bigint		unsigned	not null default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `common_accttitles`;
CREATE TABLE `common_accttitles` (
	`account_id`				bigint				unsigned	NOT NULL	default 0,
	`excel_id`					smallint			unsigned	NOT NULL	default 0,
  PRIMARY KEY					(`account_id`,`excel_id`),
	INDEX								(`account_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS common_acctstorage;
CREATE TABLE common_acctstorage(
	`account_id`	BIGINT(20) NOT NULL,
	`package_size`  TINYINT    NOT NULL default 0,
	`pet_size`	TINYINT    NOT NULL default 0,
	`ext_int1`	INT	   NOT NULL default 0,
	`ext_int2`	INT	   NOT NULL default 0,
	`ext_int3`	INT	   NOT NULL default 0,
	`passwd`	CHAR(64) NOT NULL default '',
	PRIMARY KEY (`account_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS shop_global_limit;
CREATE TABLE `shop_global_limit` (
  `act_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_global_limit` int(11) DEFAULT NULL,
  `item_person_limit_max` int(11) DEFAULT NULL,
  `item_global_limit_max` int(11) DEFAULT NULL,
  `act_begin_time`	int(12)	   NOT NULL default 0,
  `act_end_time`	int(13)	   NOT NULL default 0,
  `act_insert_time`	int(13)	   NOT NULL default 0,
  PRIMARY KEY (`act_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS shop_person_limit;
-- ----------------------------
-- Table structure for shop_person_limit
-- ----------------------------
CREATE TABLE `shop_person_limit` (
  `act_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `player_onlyid` bigint(20) NOT NULL,
  `item_person_limit` int(11) NOT NULL,
  PRIMARY KEY (`act_id`,`item_id`,`player_onlyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE common_treasure(
	item_id bigint unsigned not null,
	char_id bigint unsigned not null default 0,
	excel_id smallint unsigned not null,
	exp int unsigned not null default 0,
	auto_id smallint unsigned not null default 0,
	type int unsigned not null default 0,
	lock_time int unsigned	not null default 0,
	PRIMARY KEY(item_id),
	INDEX(char_id),
	INDEX(excel_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 形神击杀信息表
DROP TABLE IF EXISTS shadow_kill;

CREATE TABLE `shadow_kill` (
   `name` char(32) NOT NULL,
   `area_id` int(11) unsigned NOT NULL DEFAULT '0',
   `team_id` int(11) unsigned NOT NULL DEFAULT '0',
   `kill_num` int(11) unsigned DEFAULT '0',
   PRIMARY KEY (`name`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 -- 队伍积分表
DROP TABLE IF EXISTS pk_team_score;
CREATE TABLE pk_team_score(
	`n_round` smallint unsigned not null default 0,
	`server_id`	smallint unsigned not null default 0,
	`team_id` smallint unsigned not null default 0,
	`score`	  int unsigned not null default 0,
	`create_time` int unsigned not null default 0,
	PRIMARY KEY (`n_round`,`server_id`,`team_id`),
	INDEX(team_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 一血表
DROP TABLE IF EXISTS pk_first_blood;
CREATE TABLE pk_first_blood(
	`n_round` smallint unsigned not null default 0,
	`server_id` smallint unsigned not null default 0,
	`team_id` smallint unsigned not null default 0,
	`create_time` int unsigned not null default 0,
	PRIMARY KEY (`n_round`,`server_id`,`team_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 队伍胜负表,TODO: 未考虑复赛 last_max_round 用户核查和记录历史信息的
DROP TABLE IF EXISTS pk_team_lost;
CREATE TABLE pk_team_lost(
	`team_id` smallint unsigned not null default 0,
	`last_max_round` smallint unsigned not null default 0,
	`server_id` smallint unsigned not null default 0,
	`lost_times` smallint unsigned not null default 0,
	primary key(team_id,last_max_round)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into pk_team_lost(team_id) values(1);
insert into pk_team_lost(team_id) values(2);
insert into pk_team_lost(team_id) values(3);
insert into pk_team_lost(team_id) values(4);
insert into pk_team_lost(team_id) values(5);
insert into pk_team_lost(team_id) values(6);
insert into pk_team_lost(team_id) values(7);
insert into pk_team_lost(team_id) values(8);
insert into pk_team_lost(team_id) values(9);
insert into pk_team_lost(team_id) values(10);
insert into pk_team_lost(team_id) values(11);
insert into pk_team_lost(team_id) values(12);
insert into pk_team_lost(team_id) values(13);
insert into pk_team_lost(team_id) values(14);
insert into pk_team_lost(team_id) values(15);
insert into pk_team_lost(team_id) values(16);
-- 玩家支持率表 n_type 表示 0 初赛 1 复赛; win 初赛情况下 1表示赢了，0表示没赢
DROP TABLE IF EXISTS pk_char_vote;
CREATE TABLE pk_char_vote(
	`char_id` bigint unsigned not null default 0,
	`n_max_round`   smallint unsigned  not null default 0,
	`n_type`    smallint unsigned not null default 0,
	`server_id` smallint unsigned not null default 0,
	`team_id`   smallint unsigned not null default 0,
	`win`	    smallint unsigned not null default 0,
	`this_round_reward_flag` tinyint unsigned not null default 0,
	`max_vote_reward_flag`   tinyint unsigned not null default 0,
	INDEX(server_id),
	INDEX(win),
	INDEX(this_round_reward_flag),
	INDEX(max_vote_reward_flag),
	primary key(char_id,n_max_round,n_type)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pk_team_members;
CREATE TABLE pk_team_members(
	`char_id` bigint unsigned PRIMARY KEY,
	`server_id` smallint unsigned not null default 0,
	`team_id`  smallint unsigned not null default 0,
	`name`		varchar(32) not null default 0,
	`semi_zhanli` int unsigned not null default 0,
	INDEX(server_id),
	INDEX(team_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 道具叠加
DROP TABLE IF EXISTS item_superposition;
CREATE TABLE `item_superposition` (
  `item_id` bigint(20) NOT NULL,
  `char_id` bigint(20) NOT NULL,
  `excel_id` int(10) NOT NULL,
  `auto_id` int(10) NOT NULL,
  `now_time` int(10) NOT NULL,
  `now_num` int(10) NOT NULL,
  `last_time` int(10) NOT NULL,
  `last_num` int(10) NOT NULL,
  `lock_state` int(10) NOT NULL,
  PRIMARY KEY (`char_id`,`excel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 竞价道具集体
DROP TABLE IF EXISTS xyshop_bid;
CREATE TABLE `xyshop_bid` (
  `excel_id` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `pricenow` int(10) NOT NULL,
  `upnum` int(5) NOT NULL,
  `upprice` int(5) NOT NULL,
  `buynum` int(10) NOT NULL,
  `buytime` int(10) NOT NULL,
  `downprice` int(10) NOT NULL,
  `buylimit` int(10) NOT NULL,
  `downtime` smallint(5) NOT NULL,
  PRIMARY KEY (`excel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 竞价道具个人
DROP TABLE IF EXISTS xyshop_bid_person;
CREATE TABLE `xyshop_bid_person` (
  `player_onlyid` bigint(20) NOT NULL,
  `buy_excelid` int(10) NOT NULL,
  `buy_price` int(10) NOT NULL,
  `buy_num` int(10) NOT NULL,
  `buy_time` int(10) NOT NULL,
  PRIMARY KEY (`player_onlyid`,`buy_excelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 彩票相关 --
CREATE TABLE IF NOT EXISTS lottery_list (
	`lottery_id`				int				NOT NULL,
	`playeronlyid`				bigint(20)		NOT NULL,
	`period`					int				NOT NULL,
	`times`						int				NOT NULL default 0,
	`imoney`					int				NOT NULL default 0,
	PRIMARY	KEY					(`lottery_id`),
	INDEX						(`playeronlyid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 跨区玩家备份数据
DROP TABLE IF EXISTS cross_svr_char_data;
CREATE TABLE `cross_svr_char_data` (
   `data_type` int(10) unsigned NOT NULL,
   `char_id` bigint(20) unsigned NOT NULL,
   `char_name` char(30) NOT NULL,
   `param_idx1` bigint(20) DEFAULT '0',
   `param_idx2` bigint(20) DEFAULT '0',
   `param_idx3` bigint(20) DEFAULT '0',
   `param_int1` int(11) DEFAULT '0',
   `param_int2` int(11) DEFAULT '0',
   `param_int3` int(11) DEFAULT '0',
   `param_int4` int(11) DEFAULT '0',
   `param_int5` int(11) DEFAULT '0',
   `param_str` varchar(40) DEFAULT NULL,
   PRIMARY KEY (`data_type`,`char_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
-- 跨区排行榜
DROP TABLE IF EXISTS cross_svr_ranking_list;
 CREATE TABLE `cross_svr_ranking_list` (
   `rank_id` int(10) unsigned NOT NULL,
   `rank_char_gid` bigint(20) unsigned NOT NULL,
   `rank_data1` int(10) unsigned NOT NULL,
   `rank_data2` bigint(20) unsigned DEFAULT NULL,
   PRIMARY KEY (`rank_id`,`rank_char_gid`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `org_used_name`;

CREATE TABLE `org_used_name` (
	org_id BIGINT(20) NOT NULL DEFAULT 0,
	org_type	TINYINT NOT NULL DEFAULT 0,
	old_name varchar(20),
	new_name varchar(20),
	change_time  INT UNSIGNED NOT NULL DEFAULT 0,
	INDEX (`org_id`),
	INDEX (`old_name`(6)),
	INDEX (`new_name`(6))
)ENGINE=InnoDB DEFAULT CHARSET = utf8;
-- 第二元神快捷栏 --
CREATE TABLE IF NOT EXISTS shotcut2 (
	`char_id`				bigint(20)		NOT NULL,
	`shotcut_type2`			blob			NOT NULL,
	`shotcut_id2`			blob		    NOT NULL 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- 门派联盟 --
DROP TABLE IF EXISTS guild_league;
CREATE TABLE `guild_league` (
	`guild_league_id`			bigint				unsigned	NOT NULL	default 0,
	`srv_id`					tinyint				unsigned	NOT NULL	default 0,
	`status`					tinyint				unsigned	NOT NULL	default 0,
	`build_time`				int					unsigned	NOT NULL	default 0,
	`temp_time`					int					unsigned	NOT NULL	default 0,
	`level`						int					unsigned	NOT NULL	default 0,
	`size`						int					unsigned	NOT NULL	default 0,
	`money`						int					unsigned	NOT NULL	default 0,
	`credit`					int					unsigned	NOT NULL	default 0,
	`action`					int					unsigned	NOT NULL	default 0,
	`scn_id`					int								NOT NULL	default 0,
	`auth`						binary(40)						NOT NULL	default '',
	`auth_info`					blob							NOT NULL,
	`official_info`				blob							NOT NULL,
	`name`						char(128)						NOT NULL	default '',
	`leader`					char(128)						NOT NULL	default '',
	`info`						blob							NOT NULL,
	`intro`						blob							NOT NULL,
	`password`					blob							NOT NULL,
	`max_members`				int					unsigned	NOT NULL	default 0,
	`byte_flag`					blob							NOT NULL,
	`dword_flag`				blob							NOT NULL,
	`qword_flag`				blob							NOT NULL,
	`string_flag`				blob							NOT NULL,
	PRIMARY KEY					(`guild_league_id`),
	UNIQUE KEY 					(`name`),
	INDEX						(`srv_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 联盟门派成员 --
DROP TABLE IF EXISTS guild_league_guild_members;
CREATE TABLE `guild_league_guild_members` (
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`guild_league_id`			bigint				unsigned	NOT NULL	default 0,
	`contribution`				int					unsigned	NOT NULL	default 0,
	`data`						int					unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`guild_id`),
	INDEX 						(`guild_league_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 门派联盟成员 --
DROP TABLE IF EXISTS guild_league_members;
CREATE TABLE `guild_league_members` (
	`char_id`					bigint				unsigned	NOT NULL	default 0,
	`guild_league_id`			bigint				unsigned	NOT NULL	default 0,
	`class`						tinyint				unsigned	NOT NULL	default 0,
	`contribution`				int					unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`char_id`),
	INDEX 						(`guild_league_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 公会申请 --
DROP TABLE IF EXISTS guild_league_pseudomembers;
CREATE TABLE `guild_league_pseudomembers` (
	`guild_id`					bigint				unsigned	NOT NULL	default 0,
	`guild_league_id`			bigint				unsigned	NOT NULL	default 0,
	`name`						char(128)						NOT NULL	default '',
	`leadername`				char(128)						NOT NULL	default '',
	`request`					blob										NOT NULL,
	`request_time`				int					unsigned	NOT NULL	default 0,
	`svr_id`					int					unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`guild_id`),
	INDEX						(`guild_league_id`)
)ENGINE=Innodb DEFAULT CHARSET=utf8;

-- 公会联盟新闻 --
DROP TABLE IF EXISTS guild_league_news;
CREATE TABLE `guild_league_news` (
	`new_id`					bigint				unsigned	NOT NULL	default 0,
	`guild_league_id`			bigint				unsigned	NOT NULL	default 0,
	`new_type`					tinyint				unsigned	NOT NULL	default 0,
	`data1`						int											NOT NULL	default 0,
	`data2`						int											NOT NULL	default 0,
	`szData`					blob										NOT NULL,
	PRIMARY KEY					(`new_id`),
	INDEX						(`guild_league_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 公会联盟科技 --
DROP TABLE IF EXISTS guild_league_techs;
CREATE TABLE `guild_league_techs` (
	`tech_id`					bigint				unsigned	NOT NULL	default 0,
	`guild_league_id`			bigint				unsigned	NOT NULL	default 0,
	`excel_id`					smallint			unsigned	NOT NULL	default 0,
	`level`						int					unsigned	NOT NULL	default 0,
	`data1`						bigint				unsigned	NOT NULL	default 0,
	`data2`						int					unsigned	NOT NULL	default 0,
	PRIMARY KEY					(`tech_id`),
	INDEX						(`guild_league_id`)
)ENGINE=Innodb DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `common_envelope`;
CREATE TABLE `common_envelope`(
	`id` BIGINT(20) NOT NULL DEFAULT 0,
	`idx` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`name`	varchar(32) NOT NULL DEFAULT '0',
	`money` INT UNSIGNED NOT NULL DEFAULT 0,
	`char_id` BIGINT(20) NOT NULL DEFAULT 0,
	`send_time` INT UNSIGNED NOT NULL DEFAULT 0,
	`recv_char_id` BIGINT(20) NOT NULL DEFAULT 0,
	`recv_time` INT UNSIGNED NOT NULL DEFAULT 0,
	`n_type`	TINYINT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY(`id`,`idx`),
	INDEX(`char_id`),
	INDEX(`send_time`),
	INDEX(`n_type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `common_envelope_expire`;
CREATE TABLE `common_envelope_expire` LIKE `common_envelope`;

DROP TABLE IF EXISTS `tmp_red_envelope`;
CREATE TABLE `tmp_red_envelope`(
	`id` INT NOT NULL DEFAULT 0,
	`n_value` BIGINT NOT NULL DEFAULT 0,
	PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO tmp_red_envelope VALUES(1,1);

DROP TABLE IF EXISTS `common_envelope_range`;
CREATE TABLE `common_envelope_range`(
	`id` BIGINT(20) NOT NULL DEFAULT 0,
	`range_data` BIGINT(20) NOT NULL DEFAULT 0,
	`n_type` TINYINT UNSIGNED NOT NULL DEFAULT 0, -- @see RED_ENV_RANGE_TYPE : tty_common_packet.h
	PRIMARY KEY(`id`,`range_data`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ranking_list_league`;
CREATE TABLE `ranking_list_league` (
	`rank_id`						int								unsigned	NOT NULL,
	`guild_league_name`				char(32)								NOT NULL,
	`rank_data`						int											NOT NULL default 0,
	PRIMARY	KEY					(`rank_id`,`guild_league_name`),
	INDEX								(`rank_data`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- EOF --
