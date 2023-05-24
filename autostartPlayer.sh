#!/bin/bash
# -x
#

pmode=0;
while true
do
	echo "Wait for a key"
	read aok
	echo ${aok}
	if [ "${aok}" == "0580751364" ]; then
		if [ "${pmode}" == "1" ]; then
			pmode=0
			echo "Parentmode is set to OFF"
		else
			pmode=1
			echo "Parentmode is set to ON"
			killall runplaylist.sh
			killall omxplayer.bin
		fi
	else
		if [ "${pmode}" == "0" ]; then
			echo "Parentmode OFF"
			killall runplaylist.sh
			killall omxplayer.bin
			/usr/local/bin/runplaylist.sh ${aok} &
		else
			echo "Parentmode ON"
		fi
	fi
done
