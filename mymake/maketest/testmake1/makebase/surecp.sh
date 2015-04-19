#!/bin/bash
DstDir=$2
if [ ! -d "$DstDir" ]; then
		mkdir -p "$DstDir"
fi

echo "surecopying $1 to $2"

cp -f $1 $2
