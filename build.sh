#!/bin/bash
if [ $# -ne 1 ]; then
	echo $#
	exit 1
fi
mode=$1
for i in {0..511}; do
	oct=$(echo "obase=8;$i"|bc)
	file=$(printf "%03d" $oct)
	file=$mode/$file
	mkdir -p $file
	if [ "$mode" = "original" ]; then
		chmod $oct $file
	fi
done
