--
-- 卡号抽奖表（历史表由gis_init_lottery_history_tables存储过程来初始化）
--

DROP TABLE IF EXISTS `gis_card_list`;
CREATE TABLE `gis_card_list` (
	`cardid` char(32),								-- 抽奖卡号（这个绝对不能重复的）
	`lotteryid` int unsigned,						-- 对应奖品的ID
	`overduetime` int unsigned,						-- 过期时间
	`luckyrate` int unsigned,						-- 中奖概率（0～100）
	PRIMARY KEY `cardid` (`cardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 奖品对应表
--
DROP TABLE IF EXISTS `gis_lottery`;
CREATE TABLE `gis_lottery` (
	`lotteryid` int unsigned,						-- 对应奖品的ID
	`message` char(200),							-- 发奖的消息内容
	PRIMARY KEY `lotteryid` (`lotteryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 关于帐号或者角色只能抽奖N次需要的表
--
-- 帐号对应的只能领取N次的号码前缀
CREATE TABLE `gis_account_type_once_def` (
  `cardpref` char(4) NOT NULL,						-- 卡号前缀
  `num` int unsigned NOT NULL,						-- 最多可以领取的数量
  PRIMARY KEY (`cardpref`)
) CHARSET=utf8;

-- 角色对应的只能领取N次的号码前缀
CREATE TABLE `gis_char_type_once_def` (
  `cardpref` char(4) NOT NULL,						-- 卡号前缀
  `num` int unsigned NOT NULL,						-- 最多可以领取的数量
  PRIMARY KEY (`cardpref`)
) DEFAULT CHARSET=utf8;

-- 帐号领取了N次的对应表（最后的时间可以用来批量删除时间太久的记录，以免表太大）
CREATE TABLE `gis_account_type_once` (
  `account` char(32) NOT NULL DEFAULT '',
  `cardpref` char(4) NOT NULL DEFAULT '',			-- 卡号前缀
  `lasttime` int(10) unsigned DEFAULT 0,			-- 最后一次成功领取的时刻
  `num` int(10) unsigned DEFAULT 0,					-- 已经领取过的数量
  PRIMARY KEY (`account`,`cardpref`),
  KEY `firsttime` (`lasttime`)
) DEFAULT CHARSET=utf8;

-- 角色领取了N次的对应表（最后的时间可以用来批量删除时间太久的记录，以免表太大）
CREATE TABLE `gis_char_type_once` (
  `charname` char(32) NOT NULL DEFAULT '',
  `cardpref` char(4) NOT NULL DEFAULT '',			-- 卡号前缀
  `lasttime` int(10) unsigned DEFAULT 0,			-- 最后一次成功领取的时刻
  `num` int(10) unsigned DEFAULT 0,					-- 已经领取过的数量
  PRIMARY KEY (`charname`,`cardpref`),
  KEY `firsttime` (`lasttime`)
) DEFAULT CHARSET=utf8;



-- --
-- GMGS_GM模块用于保存玩家向GM提交的请求和GM回复的表
-- --
CREATE TABLE `gmgs_gm_player_gm_msg` (
  `messageid` int(11) NOT NULL auto_increment,
  `srv_group` int(3) unsigned NOT NULL default '0',
  `charname` char(32) default NULL,
  `msg_type` int(1) unsigned NOT NULL default '0',		-- 消息类型,提供给客户端提交请求时使用
  `request_time` int(10) unsigned NOT NULL default '0',		-- 提交时间
  `respond_time` int(10) unsigned NOT NULL default '0',		-- 回复时间
  `request_content` blob,					-- 提交的请求内容
  `respond_content` blob,					-- 回复的内容
  `status` int(2) NOT NULL default '0',				-- 0:待处理 1:正在处理 2:已经回复待发送的消息 3:回复发送完成的消息
  `gm_name` char(32) not null default '',
  PRIMARY KEY  (`messageid`),
   index (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 点亮图标相关
DROP TABLE IF EXISTS `gis_qqicon_level`;
CREATE TABLE `gis_qqicon_level` (
account      int unsigned,
iconlevel     tinyint  unsigned,
is_forever   tinyint unsigned,
PRIMARY KEY (`account`),
index  (`iconlevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

DROP TABLE IF EXISTS `gis_temp_to_forever_lighten`;
CREATE TABLE `gis_temp_to_forever_lighten`(
account int unsigned,
first_logintime int unsigned,
last_logintime int unsigned,
primary key (`account`),
index (`last_logintime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

CREATE TABLE `gis_qqicon_level_pt_0` LIKE gis_qqicon_level;
CREATE TABLE `gis_qqicon_level_pt_1` LIKE gis_qqicon_level;
CREATE TABLE `gis_qqicon_level_pt_2` LIKE gis_qqicon_level;
CREATE TABLE `gis_qqicon_level_pt_3` LIKE gis_qqicon_level;
CREATE TABLE `gis_qqicon_level_pt_4` LIKE gis_qqicon_level;
