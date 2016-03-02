DROP TABLE IF EXISTS shop_global_limit;
-- ----------------------------
-- Table structure for shop_global_limit
-- ----------------------------
CREATE TABLE `shop_global_limit` (
  `act_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_global_limit` int(11) DEFAULT NULL,
  `item_person_limit_max` int(11) DEFAULT NULL,
  `item_global_limit_max` int(11) DEFAULT NULL,
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

