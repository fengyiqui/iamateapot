#!/bin/sh
# 判断目标是否是文件，获得目标目录
# 下面替换的意思是把从行尾向左的第一个'/'号之间的东西全部替换为空
#DSTDIR=`echo $2 | sed -e 's/\/[^\/]*$//'`
DSTDIR=$2
# 判断目标目录是否存在，不存在就创建之
if [ ! -d $DSTDIR ]
then
	mkdir -p $DSTDIR
fi
# 拷贝文件
echo surecopying $1 to $2 ...
cp -f $1 $2
