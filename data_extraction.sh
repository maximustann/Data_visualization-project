#!/bin/bash

format() {
	cat $1 | cut -d"," -f2- > $2
	sed -i 's/"//g' $2
	sed -i 's/ //g' $2
	mv $2 $1
}
rename_common() {
	sed -i 's/ST03Q02/BirthYear/g' $1
	sed -i 's/ST04Q01/Gender/g' $1
}

question_28() {
	sed -i 's/ST29Q01/EnjoyReading/g' $1
	sed -i 's/ST29Q02/WorthwhileWork/g' $1
	sed -i 's/ST29Q03/LookForwardLesson/g' $1
	sed -i 's/ST29Q04/EnoyMath/g' $1
	sed -i 's/ST29Q05/CareerChances/g' $1
	sed -i 's/ST29Q06/Interested/g' $1
	sed -i 's/ST29Q07/FutureStudy/g' $1
	sed -i 's/ST29Q08/GetJob/g' $1
}

parents_opinion() {
	sed -i 's/ST35Q04/ParentsBelieveImportant/g' $1
	sed -i 's/ST35Q05/ParentsBelieveCareer/g' $1
	sed -i 's/ST35Q06/ParentsLikeMath/g' $1
}

repeat_grade() {
	sed -i 's/ST07Q01/Repeat<01>/g' $1
	sed -i 's/ST07Q02/Repeat<02>/g' $1
	sed -i 's/ST07Q03/Repeat<03>/g' $1
}

parents_education() {
	sed -i 's/ST13Q01/MotherEducation/g' $1
	sed -i 's/ST17Q01/FatherEducation/g' $1
}
format truancy.csv truancy_2.csv
rename_common truancy.csv
repeat_grade truancy.csv
sed -i 's/ST08Q01/LateForSchool/g' truancy.csv
sed -i 's/ST09Q01/SkipWholeDay/g' truancy.csv
sed -i 's/ST115Q01/SkipClasses/g' truancy.csv

format parents_luxuries.csv parents_luxuries_2.csv
rename_common parents_luxuries.csv
parents_education parents_luxuries.csv
sed -i 's/books//g' parents_luxuries.csv
sed -i 's/ST26Q13/Dishwasher/g' parents_luxuries.csv
sed -i 's/ST27Q02/Tv/g' parents_luxuries.csv
sed -i 's/ST27Q03/Computers/g' parents_luxuries.csv
sed -i 's/ST27Q04/Cars/g' parents_luxuries.csv
sed -i 's/ST27Q05/Showers/g' parents_luxuries.csv
sed -i 's/ST28Q01/Books/g' parents_luxuries.csv

format job_interest.csv job_interest_2.csv
rename_common job_interest.csv
question_28 job_interest.csv

format parents_stu_math.csv parents_stu_math_2.csv
rename_common parents_stu_math.csv
question_28 parents_stu_math.csv
parents_opinion parents_stu_math.csv

format parents_edu_att_math.csv parents_edu_att_math_2.csv
rename_common parents_edu_att_math.csv
parents_opinion parents_edu_att_math.csv
parents_education parents_edu_att_math.csv
