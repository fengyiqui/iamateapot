#!/bin/sh
# �ж�Ŀ���Ƿ����ļ������Ŀ��Ŀ¼
# �����滻����˼�ǰѴ���β����ĵ�һ��'/'��֮��Ķ���ȫ���滻Ϊ��
#DSTDIR=`echo $2 | sed -e 's/\/[^\/]*$//'`
DSTDIR=$2
# �ж�Ŀ��Ŀ¼�Ƿ���ڣ������ھʹ���֮
if [ ! -d $DSTDIR ]
then
	mkdir -p $DSTDIR
fi
# �����ļ�
echo surecopying $1 to $2 ...
cp -f $1 $2
