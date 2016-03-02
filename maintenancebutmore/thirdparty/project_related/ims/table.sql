-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- GMSI --
CREATE TABLE `gmsi_socket` (
	`gmsi_id`						tinyint				unsigned	NOT NULL default 0,
	`socket_id`					int						unsigned	NOT NULL default 0,
	PRIMARY KEY					(`gmsi_id`),
	UNIQUE KEY					(`socket_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- �����ʺ� --
CREATE TABLE `account` (`account` char(32) NOT NULL default '', `bg` smallint unsigned NOT NULL default '0', PRIMARY KEY (`account`), INDEX (`bg`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- ��ɫ���� --
CREATE TABLE `player` (`player` char(32) NOT NULL default '', PRIMARY KEY (`player`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- �������� --
CREATE TABLE `point_partition_0` (`account` char(32) NOT NULL default '', `available_point` int unsigned NOT NULL default '0', `frozen_point` int unsigned NOT NULL default '0', `last_login` int unsigned NOT NULL default 733832, PRIMARY KEY (`account`), INDEX(`last_login`))ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `point_partition_1` LIKE `point_partition_0`;
CREATE TABLE `point_partition_2` LIKE `point_partition_0`;
CREATE TABLE `point_partition_3` LIKE `point_partition_0`;
CREATE TABLE `point_partition_4` LIKE `point_partition_0`;
CREATE TABLE `point_partition_5` LIKE `point_partition_0`;
CREATE TABLE `point_partition_6` LIKE `point_partition_0`;
CREATE TABLE `point_partition_7` LIKE `point_partition_0`;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- �۵��¼ƫ�� --
CREATE TABLE `master_relay_index`	(`bg` smallint unsigned NOT NULL default '0', `cps_position` bigint unsigned NOT NULL default '0', PRIMARY KEY (`bg`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- �ʺ�ͣȨ --
CREATE TABLE `account_restricted` (`account` char(32) NOT NULL default '', `out_time` int unsigned NOT NULL default 0,`reason` SMALLINT NOT NULL default 0, PRIMARY KEY (`account`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- IP������ --
CREATE TABLE `ip_whitelist` (`ip` INT UNSIGNED NOT NULL default 0, PRIMARY KEY (`ip`))ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- IP������ --
CREATE TABLE `ip_blacklist` (`ip` INT UNSIGNED NOT NULL default 0, PRIMARY KEY (`ip`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- �����������¼
CREATE TABLE `reset_xianyu` (`reset_time` int unsigned NOT NULL default 0, `account` char(32) NOT NULL default '', `available_point` int unsigned NOT NULL default 0, INDEX (`reset_time`))ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- �����������ע����Ϣ�� --
CREATE TABLE `malay_playerinfo` (`account` char(32) NOT NULL default '', `pass` char(32) NOT NULL default '',`otpserial` int unsigned NOT NULL default 0, `out_time` int unsigned NOT NULL default 0,PRIMARY KEY (`account`))ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------------------------------------
-- -------------------------------------------------------------------------
-- EOF --

