--
-- LBA辅助相关的表都放在这里
--

--
-- 角色起名缓冲表
--
DROP TABLE IF EXISTS `lba_charname_cache`;
CREATE TABLE `lba_charname_cache` (
	`charname`				char(32)		NOT NULL,
	`bDeleted`				int(1)			NOT NULL default 0,		-- 是否被删除了，如果为1，则说明用户可以起这个名字
	`nLastTryTime`			int(11)			NOT NULL default 0,		-- 上次尝试向全局GC服务器起名的时间（即有人试图起这个名字的时间，如果距离现在超过指定时间了，则可以考虑向全局起一下）
	`nAccessCount`			int(11)			NOT NULL default 0,		-- 总共这个名字被尝试起的次数
	`nAccessCountSinceLastTry`	int(11)		NOT NULL default 0,		-- 从上次尝试到现在的次数
	PRIMARY	KEY		(`charname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- IP黑白表
--
DROP TABLE IF EXISTS `lba_ip_white`;
CREATE TABLE `lba_ip_white` (
	`ip`					int unsigned	NOT NULL default 0,		-- 以整数方式表示的IP（就是每个字节表示网络IP的一段，可以用lba_inet_ntoa转换为字串）
	PRIMARY	KEY				(`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `lba_ip_black`;
CREATE TABLE `lba_ip_black` LIKE `lba_ip_white`;

--
-- 禁止用户登录表（因为在DBS那层已经有禁止登录的机制了。所以这个就不用了）
--
DROP TABLE IF EXISTS `lba_ban_accounts`;
CREATE TABLE `lba_ban_accounts` (
	`account`				char(32)		NOT NULL,
	`endtime`				int unsigned	NOT NULL default 0,		-- 禁止登录的结束时间
	PRIMARY	KEY				(`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 网吧IP表
--
DROP TABLE IF EXISTS `lba_ip_netbar`;
CREATE TABLE `lba_ip_netbar` (
	`ip`					int unsigned	NOT NULL default 0,		-- 以整数方式表示的IP（就是每个字节表示网络IP的一段，可以用lba_inet_ntoa转换为字串）
	`type`					int unsigned	NOT NULL default 0,		-- 表示网吧的类型（这个数由使用层来定义）
	PRIMARY	KEY				(`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 禁言IP表
--
DROP TABLE IF EXISTS `lba_ip_estop`;
CREATE TABLE `lba_ip_estop` (
	`ip`					int unsigned	NOT NULL default 0,		-- 以整数方式表示的IP（就是每个字节表示网络IP的一段，可以用lba_inet_ntoa转换为字串）
	`endtime`				int unsigned	NOT NULL default 0,		-- 禁言结束的时刻
	PRIMARY	KEY				(`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- VIP状态表
--
DROP TABLE IF EXISTS `lba_vipstatus`;
CREATE TABLE `lba_vipstatus` (
	`account`				char(32)		NOT NULL,
	`endtime`				int unsigned	NOT NULL default 0,		-- VIP状态的结束时间
	`vipstatus`			BIGINT UNSIGNED NOT NULL default 0,	-- VIP状态
	PRIMARY	KEY				(`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
