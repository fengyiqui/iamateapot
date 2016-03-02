--
-- LBA������صı���������
--

--
-- ��ɫ���������
--
DROP TABLE IF EXISTS `lba_charname_cache`;
CREATE TABLE `lba_charname_cache` (
	`charname`				char(32)		NOT NULL,
	`bDeleted`				int(1)			NOT NULL default 0,		-- �Ƿ�ɾ���ˣ����Ϊ1����˵���û��������������
	`nLastTryTime`			int(11)			NOT NULL default 0,		-- �ϴγ�����ȫ��GC������������ʱ�䣨��������ͼ��������ֵ�ʱ�䣬����������ڳ���ָ��ʱ���ˣ�����Կ�����ȫ����һ�£�
	`nAccessCount`			int(11)			NOT NULL default 0,		-- �ܹ�������ֱ�������Ĵ���
	`nAccessCountSinceLastTry`	int(11)		NOT NULL default 0,		-- ���ϴγ��Ե����ڵĴ���
	PRIMARY	KEY		(`charname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- IP�ڰױ�
--
DROP TABLE IF EXISTS `lba_ip_white`;
CREATE TABLE `lba_ip_white` (
	`ip`					int unsigned	NOT NULL default 0,		-- ��������ʽ��ʾ��IP������ÿ���ֽڱ�ʾ����IP��һ�Σ�������lba_inet_ntoaת��Ϊ�ִ���
	PRIMARY	KEY				(`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `lba_ip_black`;
CREATE TABLE `lba_ip_black` LIKE `lba_ip_white`;

--
-- ��ֹ�û���¼����Ϊ��DBS�ǲ��Ѿ��н�ֹ��¼�Ļ����ˡ���������Ͳ����ˣ�
--
DROP TABLE IF EXISTS `lba_ban_accounts`;
CREATE TABLE `lba_ban_accounts` (
	`account`				char(32)		NOT NULL,
	`endtime`				int unsigned	NOT NULL default 0,		-- ��ֹ��¼�Ľ���ʱ��
	PRIMARY	KEY				(`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ����IP��
--
DROP TABLE IF EXISTS `lba_ip_netbar`;
CREATE TABLE `lba_ip_netbar` (
	`ip`					int unsigned	NOT NULL default 0,		-- ��������ʽ��ʾ��IP������ÿ���ֽڱ�ʾ����IP��һ�Σ�������lba_inet_ntoaת��Ϊ�ִ���
	`type`					int unsigned	NOT NULL default 0,		-- ��ʾ���ɵ����ͣ��������ʹ�ò������壩
	PRIMARY	KEY				(`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ����IP��
--
DROP TABLE IF EXISTS `lba_ip_estop`;
CREATE TABLE `lba_ip_estop` (
	`ip`					int unsigned	NOT NULL default 0,		-- ��������ʽ��ʾ��IP������ÿ���ֽڱ�ʾ����IP��һ�Σ�������lba_inet_ntoaת��Ϊ�ִ���
	`endtime`				int unsigned	NOT NULL default 0,		-- ���Խ�����ʱ��
	PRIMARY	KEY				(`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- VIP״̬��
--
DROP TABLE IF EXISTS `lba_vipstatus`;
CREATE TABLE `lba_vipstatus` (
	`account`				char(32)		NOT NULL,
	`endtime`				int unsigned	NOT NULL default 0,		-- VIP״̬�Ľ���ʱ��
	`vipstatus`			BIGINT UNSIGNED NOT NULL default 0,	-- VIP״̬
	PRIMARY	KEY				(`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
