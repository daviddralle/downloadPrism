#!/bin/bash

#input: 
#	-start year as an integer
#	-end year as an integer
#	-directory in which to store data (e.g. 
#	-which variable to download (must be a PRISM variable, e.g. 'ppt', 'tdmean', etc)

START=$1
STOP=$2
DIR=$3
CLIM=$4

sudo mkdir $DIR/$CLIM
chmod 777 $DIR/$CLIM

for i in $(seq $START $STOP);
do
	VAR=$(curl ftp://prism.nacse.org/daily/$CLIM/$i/)
	COMM=$DIR/$CLIM/$i	
	echo $COMM
	sudo mkdir $COMM
	for j in $VAR
	do
		if [ "${j:0:1}" = "P" ]
		then	
			cd $COMM
			curl -O ftp://prism.nacse.org/daily/$CLIM/$i/$j
		fi
	done
done

	
