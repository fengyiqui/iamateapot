#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: sh $0 backupdir"
	exit 1
fi
if [ ! -d "$1" ]; then
	echo "$1 is not a dir"
	exit 2 
fi

file_list="file_list.data"
splitter="_"
#	30 days
timeinterval=2592000

find $1 -name "*.sql$splitter*" >$file_list
datetime0=`date +%s`
curdate=`date +%s`

while read -r file
do
	datetime1=`echo $file |awk -F "$splitter" '{print $2}' |tr -d "\r\n"`
	diff=$(($datetime0-$datetime1))
	echo "$curdate $file diff is $diff"
	if [ $diff -gt $timeinterval ]; then
		echo "$curdate rm file,$file,$datetime1,$datetime0,$diff" 
		rm $file
	fi
done < $file_list
