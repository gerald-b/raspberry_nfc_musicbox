#!/bin/bash -x
#

playlist=/daten/${1}.m3u
anz=`cat ${playlist} | wc -l`
#echo ${anz}
for (( c=1; c<=${anz}; c++ ))
do
	cfile=`sed -n ${c}p ${playlist}`
	omxplayer -o local "${cfile}"
done


#while read line
#do
#	#if [[ "$line" == *"$1"* ]]; then
#		omxplayer \"${line}\" -o local
#	#fi
#done < ${1}
