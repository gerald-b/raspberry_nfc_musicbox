#!/bin/bash
# -x
#

date

dataDir=/daten/

crt=`cat ${dataDir}recreate.txt`


if [ "${crt}" == "yes" ]; then
	# echo no > /daten/recreate.txt
	find ${dataDir}/* -type d > /tmp/cardlist.txt
	anz=`cat /tmp/cardlist.txt | wc -l`
	echo "${anz} directories found"
	for (( c=1; c<=${anz}; c++ ))
	do
#   		echo "Welcome $c times"
		cfile=`sed -n ${c}p /tmp/cardlist.txt`
		cfile=`basename ${cfile}`
		echo "Create ${dataDir}/${cfile}.m3u"
		touch ${dataDir}/${cfile}.m3u
		#find /daten/${cfile}/* -type f > /daten/${cfile}.m3u
		find ${dataDir}/${cfile}/* -type f > ${dataDir}/${cfile}.m3u
	done
	echo no > ${dataDir}/recreate.txt
else
	echo "No recreate"
fi
