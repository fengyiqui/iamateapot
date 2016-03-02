--
-- ���ų齱����ʷ����gis_init_lottery_history_tables�洢��������ʼ����
--

DROP TABLE IF EXISTS `gis_card_list`;
CREATE TABLE `gis_card_list` (
	`cardid` char(32),								-- �齱���ţ�������Բ����ظ��ģ�
	`lotteryid` int unsigned,						-- ��Ӧ��Ʒ��ID
	`overduetime` int unsigned,						-- ����ʱ��
	`luckyrate` int unsigned,						-- �н����ʣ�0��100��
	PRIMARY KEY `cardid` (`cardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ��Ʒ��Ӧ��
--
DROP TABLE IF EXISTS `gis_lottery`;
CREATE TABLE `gis_lottery` (
	`lotteryid` int unsigned,						-- ��Ӧ��Ʒ��ID
	`message` char(200),							-- ��������Ϣ����
	PRIMARY KEY `lotteryid` (`lotteryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �����ʺŻ��߽�ɫֻ�ܳ齱N����Ҫ�ı�
--
-- �ʺŶ�Ӧ��ֻ����ȡN�εĺ���ǰ׺
CREATE TABLE `gis_account_type_once_def` (
  `cardpref` char(4) NOT NULL,						-- ����ǰ׺
  `num` int unsigned NOT NULL,						-- ��������ȡ������
  PRIMARY KEY (`cardpref`)
) CHARSET=utf8;

-- ��ɫ��Ӧ��ֻ����ȡN�εĺ���ǰ׺
CREATE TABLE `gis_char_type_once_def` (
  `cardpref` char(4) NOT NULL,						-- ����ǰ׺
  `num` int unsigned NOT NULL,						-- ��������ȡ������
  PRIMARY KEY (`cardpref`)
) DEFAULT CHARSET=utf8;

-- �ʺ���ȡ��N�εĶ�Ӧ������ʱ�������������ɾ��ʱ��̫�õļ�¼�������̫��
CREATE TABLE `gis_account_type_once` (
  `account` char(32) NOT NULL DEFAULT '',
  `cardpref` char(4) NOT NULL DEFAULT '',			-- ����ǰ׺
  `lasttime` int(10) unsigned DEFAULT 0,			-- ���һ�γɹ���ȡ��ʱ��
  `num` int(10) unsigned DEFAULT 0,					-- �Ѿ���ȡ��������
  PRIMARY KEY (`account`,`cardpref`),
  KEY `firsttime` (`lasttime`)
) DEFAULT CHARSET=utf8;

-- ��ɫ��ȡ��N�εĶ�Ӧ������ʱ�������������ɾ��ʱ��̫�õļ�¼�������̫��
CREATE TABLE `gis_char_type_once` (
  `charname` char(32) NOT NULL DEFAULT '',
  `cardpref` char(4) NOT NULL DEFAULT '',			-- ����ǰ׺
  `lasttime` int(10) unsigned DEFAULT 0,			-- ���һ�γɹ���ȡ��ʱ��
  `num` int(10) unsigned DEFAULT 0,					-- �Ѿ���ȡ��������
  PRIMARY KEY (`charname`,`cardpref`),
  KEY `firsttime` (`lasttime`)
) DEFAULT CHARSET=utf8;



-- --
-- GMGS_GMģ�����ڱ��������GM�ύ�������GM�ظ��ı�
-- --
CREATE TABLE `gmgs_gm_player_gm_msg` (
  `messageid` int(11) NOT NULL auto_increment,
  `srv_group` int(3) unsigned NOT NULL default '0',
  `charname` char(32) default NULL,
  `msg_type` int(1) unsigned NOT NULL default '0',		-- ��Ϣ����,�ṩ���ͻ����ύ����ʱʹ��
  `request_time` int(10) unsigned NOT NULL default '0',		-- �ύʱ��
  `respond_time` int(10) unsigned NOT NULL default '0',		-- �ظ�ʱ��
  `request_content` blob,					-- �ύ����������
  `respond_content` blob,					-- �ظ�������
  `status` int(2) NOT NULL default '0',				-- 0:������ 1:���ڴ��� 2:�Ѿ��ظ������͵���Ϣ 3:�ظ�������ɵ���Ϣ
  `gm_name` char(32) not null default '',
  PRIMARY KEY  (`messageid`),
   index (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ����ͼ�����
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
