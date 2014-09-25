#!/bin/bash

format() {
	cat $1 | cut -d"," -f2- > $2
	sed -i 's/"//g' $2
	mv $2 $1
}

format parents_att_math_general.csv parents_att_math_general_2.csv
format parents_att_math_junior.csv parents_att_math_junior_2.csv
format parents_att_math_not_finished.csv parents_att_math_not_finished_2.csv
format parents_att_math_primary.csv parents_att_math_primary_2.csv
format parents_att_math_vocational.csv parents_att_math_vocational_2.csv
