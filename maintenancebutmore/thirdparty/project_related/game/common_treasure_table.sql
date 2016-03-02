DROP TABLE IF EXISTS common_treasure;
CREATE TABLE common_treasure(
	item_id bigint unsigned not null,
	char_id bigint unsigned not null default 0,
	excel_id smallint unsigned not null,
	exp int unsigned not null default 0,
	auto_id smallint unsigned not null default 0,
	type int unsigned not null default 0,
	lock_time int unsigned not null default 0,
	PRIMARY KEY(item_id),
	INDEX(char_id),
	INDEX(excel_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;