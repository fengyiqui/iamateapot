--
-- ���������͵�����صı���������
--

--
-- ��������
--

DROP TABLE IF EXISTS `ps_point_buy`;
CREATE TABLE `ps_point_buy` (
	`seq` bigint(20) unsigned NOT NULL,
	`account` char(32) NOT NULL,					-- �û��ʺţ���Ϊ������������Ҫ���ʺżӵģ�
	`char_id` bigint(20) unsigned NOT NULL,
	`hand` int(11) NOT NULL,
	`handover` int(11) NOT NULL,
	`price` int(11) NOT NULL,
	`taxper` int(11) NOT NULL,						-- ��������ۣ�ÿ�ֵ���Ϸ��˰��
	`totalleft` int(11) NOT NULL,					-- �ܵ�ʣ�ඳ��Ǯ����cancel�Լ�������ʱ�ã����ⶳ��
	`uptime` int(11) NOT NULL,						-- �ύʱ��
	`minus_price` int(11) NOT NULL,					-- �������������۸�����
	UNIQUE KEY `seq` (`seq`),
	KEY `char_id` (`char_id`),
	KEY `minus_price` (`minus_price`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ���������
--

DROP TABLE IF EXISTS `ps_point_sell`;
CREATE TABLE `ps_point_sell` (
	`seq` bigint(20) unsigned NOT NULL,
	`account` char(32) NOT NULL,					-- �û��ʺţ���Ϊ�����۵���߻�������Ҫ���ʺżӵģ�
	`char_id` bigint(20) unsigned NOT NULL,
	`hand` int(11) NOT NULL,
	`handover` int(11) NOT NULL,
	`price` int(11) NOT NULL,
	`taxper` int(11) NOT NULL,						-- ��������ÿ�ֵ�˰����
	`totalleft` int(11) NOT NULL,					-- �ܵ�ʣ�ඳ�������cancelʱ�ã����ⶳ���м�ÿ�ɹ�һ����۳�һЩ��
	`uptime` int(11) NOT NULL,						-- �ύʱ��
	UNIQUE KEY `seq` (`seq`),
	KEY `char_id` (`char_id`),
	KEY `price` (`price`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ����ĳɽ�����Ҫ�������ϲ�ȷ�Ͻ��׽������Ǯ�͵�������Ӧ�ĸ���
--
-- �����ɽ������а�������cancel��
--
DROP TABLE IF EXISTS `ps_point_sell_deal`;
CREATE TABLE `ps_point_sell_deal` (
	`s_seq` bigint(20) unsigned NOT NULL,			-- �����cancel������û����ң���b_seqΪ���㣨��֮Ϊ0��
	`b_seq` bigint(20) unsigned NOT NULL,			-- �����cancel����û�����ң���s_seqΪ���㣨��֮Ϊ0��
	`s_char_id` bigint(20) unsigned NOT NULL,
	`b_char_id` bigint(20) unsigned NOT NULL,
	`s_account` char(32) NOT NULL,
	`b_account` char(32) NOT NULL,
	`hand` int(11) NOT NULL,						-- �ɽ�����������ɽ�����Ϊ0����b_taxperprice��0����˵��ȫ���Ѿ��������м��н������������е����Լ����۵ģ�
	`price` int(11) NOT NULL,						-- �ɽ���
	`s_taxper` int(11) NOT NULL,					-- ����ÿ�ֵ�˰�����������cancel�����������totalleft�ĵ�����
	`b_taxper` int(11) NOT NULL,					-- �������ÿ�ֵ���Ϸ��˰���������cancel���������totalleft����Ϸ�ң�
	`overtime` int(11) NOT NULL,					-- �ɽ�ʱ��
	UNIQUE KEY (`s_seq`,`b_seq`),
	KEY `s_char_id` (`s_char_id`),					-- �н�ɫID��key��Ҫ����Ϊ��Ҫ��ѯĳ����ɫ��ĳ��ʱ��Ľ�������
	KEY `b_char_id` (`b_char_id`),
	KEY `overtime` (`overtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ����ɽ������а�������cancel��
--
DROP TABLE IF EXISTS `ps_point_buy_deal`;
create table `ps_point_buy_deal` like `ps_point_sell_deal`;

--
-- �����ɽ����û����߱����
--
DROP TABLE IF EXISTS `ps_point_sell_deal_offline`;
create table `ps_point_sell_deal_offline` like `ps_point_sell_deal`;
--
-- ����ɽ����û����߱����
--
DROP TABLE IF EXISTS `ps_point_buy_deal_offline`;
create table `ps_point_buy_deal_offline` like `ps_point_sell_deal`;

--
-- �ɽ���ʷ���������Ҫ������seq�ŵ�������
--
DROP TABLE IF EXISTS `ps_point_deal_history`;
create table `ps_point_deal_history` like `ps_point_sell_deal`;
alter table `ps_point_deal_history` DROP INDEX `s_seq`;

--
-- ÿ10���ӵĳɽ���¼��������������
--
DROP TABLE IF EXISTS `ps_10min_graph`;
create table `ps_10min_graph` (
	`t` int unsigned NOT NULL,						-- ÿ��10���ӵĿ�ͷʱ��
	`hand` int unsigned NOT NULL,					-- �ܳ�����
	`totalprice` int unsigned NOT NULL,				-- �ܳɽ���
	PRIMARY KEY (`t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ���߼ӵ�/�۵㻺�壨�Ȳ��ðɣ�
-- 
DROP TABLE IF EXISTS `ps_chg_point_offline`;
create table `ps_chg_point_offline`	(
	`account` char(32) NOT NULL						-- Ҫ�任�������ʺ���
	, `davail` int(11)								-- avail�����ı�����Ӧ��ֻ��Ϊ>=0��
	, `dfrozen` int(11)								-- frozen�����ı�����Ӧ��ֻ��Ϊ<=0��
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

