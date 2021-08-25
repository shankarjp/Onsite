#!/bin/bash

file1="file1.txt"
file2="file2.txt"
file3="file3.txt"

IFS=','

touch final_list.txt

while read -a line1
do
	while read -a line2
	do
		if [ ${line1[1]} == ${line2[0]} ]
		then
			while read -a line3
			do
				if [ ${line1[2]} == ${line3[1]} ]
				then
					echo "${line1[1]}-${line1[0]}-${line1[2]}-${line2[1]}-${line3[0]}-${line3[2]}" >> final_list.txt
				fi
			done <$file3
		fi
	done <$file2 
done <$file1
