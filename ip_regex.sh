#!/bin/bash

octet='([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-4])'
mask='([0-9]|[1-2][0-9]|3[0-2])'

ipA_output=$(/usr/bin/ip a)

loop='127.0.0.1/8'

for words in $ipA_output
do
	if [[ $words =~ ^$octet(\.$octet){3}/$mask|^$octet(\.$octet){3} ]]; then
        	ip=$words
		if [[ $ip != $loop ]]; then
			echo $ip
		fi
	fi
done
