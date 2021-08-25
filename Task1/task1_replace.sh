#!/bin/bash

column=$1
initial_txt="$2"
final_txt="$3"

filename="final_list.txt"

touch final_list2.txt

IFS='-'
if [ $column == "employeeId" ]
then
	while read -a line
	do
        	if [ ${line[0]} == $initial_txt ]
        	then
                	echo "$final_txt-${line[1]}-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
       		else
                	echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
                fi
	done <$filename

elif [ $column == "name" ]
then
        while read -a line
        do
                if [[ "${line[1]}" == *"$initial_txt"* ]]
                then
                        echo "${line[0]}-$final_txt-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
                else
                        echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
                fi
        done <$filename

elif [ $column == "phone" ]
then
        while read -a line
        do
                if [ ${line[2]} == $initial_txt ]
                then
                        echo "${line[0]}-${line[1]}-$final_txt-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
                else
                        echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
               	fi
        done <$filename

elif [ $column == "salaries" ]
then
        while read -a line
        do
                if [ ${line[3]} == $initial_txt ]
                then
                        echo "${line[0]}-${line[1]}-${line[2]}-$final_txt-${line[4]}-${line[5]}" >> final_list2.txt
                else
                        echo "${line[0]}-${line[1]}]-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
                fi
        done <$filename

elif [ $column == "email" ]
then
        while read -a line
        do
                if [[ "${line[4]}" == *"$initial_txt"* ]]
                then
                        echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-$final_txt-${line[5]}" >> final_list2.txt
                else
                        echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
		fi
        done <$filename

elif [ $column == "year" ]
then
        while read -a line
        do
                if [ ${line[5]} == $initial_txt ]
                then
                        echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-${line[4]}-$final_txt" >> final_list2.txt
                else
                        echo "${line[0]}-${line[1]}-${line[2]}-${line[3]}-${line[4]}-${line[5]}" >> final_list2.txt
        	fi
	done <$filename
fi
