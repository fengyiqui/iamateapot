#!/bin/bash
mysql_host="localhost"
mysql_user="root"
mysql_passwd="passwd"
mysql_db="dbname"
port="3306"
mysql_charset="utf8"
#-----------------------------------------
cmd_date="date +%s"
if [ -z "$1" ]; then
	echo -e "Usage:\n sh $0 file_to_be_exported"
	exit 1
else
	dir_name=`dirname $1`
	if [ ! -d "$dir_name" ]; then
		echo -e "there is no dir: $dir_name\n"
		exit 2
	fi
fi
file_ext=`$cmd_date`
file_backup="$1_$file_ext"
#echo $file_backup
echo -e "backup db,$mysql_db ,`$cmd_date`\n"
mysqldump -h$mysql_host -u$mysql_user -p$mysql_passwd -P$port --default-character-set=$mysql_charset --extended-insert=false --single-transaction --flush-logs --database $mysql_db >> $file_backup
echo -e "backup db finished ,$mysql_db,`$cmd_date`\n"
#mysqldump -h$mysql_host -u$mysql_user -p$mysql_passwd -P$port --default-character-set=$mysql_charset --extended-insert=false --single-transaction --database $mysql_db --tables $table >> $1_0
