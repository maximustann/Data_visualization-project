#!/bin/bash 

if [ -e skip_class.csv ]
then
	truncate skip_class.csv -s 0
else
	touch skip_class.csv
fi


if [ -e late.csv ]
then
	truncate late.csv -s 0
else
	touch late.csv
fi


awk '{if(NR==1 || NR==4 || NR==5) print $0}' ./truancy_summary.csv >> skip_class.csv
awk '{if(NR==1 || NR==6 || NR==7) print $0}' ./truancy_summary.csv >> late.csv
sed -i '4,7d' truancy_summary.csv

awk -f ./percentage.awk skip_class.csv >> skip_class.csv
awk -f ./percentage.awk late.csv >> late.csv
awk -f ./percentage.awk truancy_summary.csv >> truancy_summary.csv
