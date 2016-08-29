#!/bin/bash

START=$1
STOP=$2
DIR=$3

for i in $(seq $START $STOP);
do
	VAR=$(curl ftp://prism.nacse.org/monthly/ppt/$i/)
	COMM=$DIR$i	
	echo $COMM
	sudo mkdir $COMM
	for j in $VAR
	do
		if [ "${j:0:1}" = "P" ]
		then	
			cd $COMM
			curl -O ftp://prism.nacse.org/monthly/ppt/$i/$j
		fi
	done
done

	
