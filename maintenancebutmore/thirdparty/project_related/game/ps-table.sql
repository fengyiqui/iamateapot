--
-- 点数买卖和点数相关的表都放在这里
--

--
-- 买点请求表
--

DROP TABLE IF EXISTS `ps_point_buy`;
CREATE TABLE `ps_point_buy` (
	`seq` bigint(20) unsigned NOT NULL,
	`account` char(32) NOT NULL,					-- 用户帐号（因为将来给点是需要给帐号加的）
	`char_id` bigint(20) unsigned NOT NULL,
	`hand` int(11) NOT NULL,
	`handover` int(11) NOT NULL,
	`price` int(11) NOT NULL,
	`taxper` int(11) NOT NULL,						-- （买入出价）每手的游戏币税数
	`totalleft` int(11) NOT NULL,					-- 总的剩余冻结钱数（cancel以及最后结算时用，最后解冻）
	`uptime` int(11) NOT NULL,						-- 提交时间
	`minus_price` int(11) NOT NULL,					-- 用这个来反向给价格排序
	UNIQUE KEY `seq` (`seq`),
	KEY `char_id` (`char_id`),
	KEY `minus_price` (`minus_price`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 卖点请求表
--

DROP TABLE IF EXISTS `ps_point_sell`;
CREATE TABLE `ps_point_sell` (
	`seq` bigint(20) unsigned NOT NULL,
	`account` char(32) NOT NULL,					-- 用户帐号（因为将来扣点或者还点是需要给帐号加的）
	`char_id` bigint(20) unsigned NOT NULL,
	`hand` int(11) NOT NULL,
	`handover` int(11) NOT NULL,
	`price` int(11) NOT NULL,
	`taxper` int(11) NOT NULL,						-- （卖出）每手的税点数
	`totalleft` int(11) NOT NULL,					-- 总的剩余冻结点数（cancel时用，最后解冻，中间每成功一笔则扣除一些）
	`uptime` int(11) NOT NULL,						-- 提交时间
	UNIQUE KEY `seq` (`seq`),
	KEY `char_id` (`char_id`),
	KEY `price` (`price`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 下面的成交表主要用于让上层确认交易结果，把钱和点数给相应的各方
--
-- 卖出成交表（其中包括卖出cancel）
--
DROP TABLE IF EXISTS `ps_point_sell_deal`;
CREATE TABLE `ps_point_sell_deal` (
	`s_seq` bigint(20) unsigned NOT NULL,			-- 如果是cancel卖，则没有买家，则b_seq为非零（反之为0）
	`b_seq` bigint(20) unsigned NOT NULL,			-- 如果是cancel买，则没有卖家，则s_seq为非零（反之为0）
	`s_char_id` bigint(20) unsigned NOT NULL,
	`b_char_id` bigint(20) unsigned NOT NULL,
	`s_account` char(32) NOT NULL,
	`b_account` char(32) NOT NULL,
	`hand` int(11) NOT NULL,						-- 成交手数（如果成交手数为0，且b_taxperprice非0，则说明全部已经结束，中间有交易是买入中有低于自己报价的）
	`price` int(11) NOT NULL,						-- 成交价
	`s_taxper` int(11) NOT NULL,					-- 卖出每手的税点数（如果是cancel卖，则这个是totalleft的点数）
	`b_taxper` int(11) NOT NULL,					-- 买入出价每手的游戏币税数（如果是cancel买，则这个是totalleft的游戏币）
	`overtime` int(11) NOT NULL,					-- 成交时间
	UNIQUE KEY (`s_seq`,`b_seq`),
	KEY `s_char_id` (`s_char_id`),					-- 有角色ID做key主要是因为需要查询某个角色在某段时间的交易内容
	KEY `b_char_id` (`b_char_id`),
	KEY `overtime` (`overtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 买入成交表（其中包括买入cancel）
--
DROP TABLE IF EXISTS `ps_point_buy_deal`;
create table `ps_point_buy_deal` like `ps_point_sell_deal`;

--
-- 卖出成交，用户下线保存表
--
DROP TABLE IF EXISTS `ps_point_sell_deal_offline`;
create table `ps_point_sell_deal_offline` like `ps_point_sell_deal`;
--
-- 买入成交，用户下线保存表
--
DROP TABLE IF EXISTS `ps_point_buy_deal_offline`;
create table `ps_point_buy_deal_offline` like `ps_point_sell_deal`;

--
-- 成交历史表（这个不需要做交易seq号的索引）
--
DROP TABLE IF EXISTS `ps_point_deal_history`;
create table `ps_point_deal_history` like `ps_point_sell_deal`;
alter table `ps_point_deal_history` DROP INDEX `s_seq`;

--
-- 每10分钟的成交记录表，用于生成日线
--
DROP TABLE IF EXISTS `ps_10min_graph`;
create table `ps_10min_graph` (
	`t` int unsigned NOT NULL,						-- 每个10分钟的开头时刻
	`hand` int unsigned NOT NULL,					-- 总成手数
	`totalprice` int unsigned NOT NULL,				-- 总成交价
	PRIMARY KEY (`t`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 离线加点/扣点缓冲（先不用吧）
-- 
DROP TABLE IF EXISTS `ps_chg_point_offline`;
create table `ps_chg_point_offline`	(
	`account` char(32) NOT NULL						-- 要变换点数的帐号名
	, `davail` int(11)								-- avail点数改变量（应该只能为>=0）
	, `dfrozen` int(11)								-- frozen点数改变量（应该只能为<=0）
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

