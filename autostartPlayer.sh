#!/bin/bash
# -x
#

pmode=0;
while true
do
	echo "Wait for a key"
	read aok
	echo ${aok}
	if [ "${aok}" == "$(more /daten/parentkey.txt)" ]; then
		if [ "${pmode}" == "1" ]; then
			pmode=0
			echo "Parentmode is set to OFF"
		else
			pmode=1
			echo "Parentmode is set to ON"
			killall mpg321
		fi
	else
		if [ "${pmode}" == "0" ]; then
			echo "Parentmode OFF"
			killall mpg321
			mpg321 /daten/${aok}/* &
		else
			echo "Parentmode ON"
		fi
	fi
done
