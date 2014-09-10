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
	sed -i 's/ST07Q01/Repeat01/g' $1
	sed -i 's/ST07Q02/Repeat02/g' $1
	sed -i 's/ST07Q03/Repeat03/g' $1
}

parents_education() {
	sed -i 's/ST13Q01/MotherEducation/g' $1
	sed -i 's/ST17Q01/FatherEducation/g' $1
}

sed -i 's/Yes, //g' truancy.csv
sed -i 's/No, //g' truancy.csv
format truancy.csv truancy_2.csv
rename_common truancy.csv
repeat_grade truancy.csv
sed -i 's/ST08Q01/LateForSchool/g' truancy.csv
sed -i 's/ST09Q01/SkipWholeDay/g' truancy.csv
sed -i 's/ST115Q01/SkipClasses/g' truancy.csv
cat truancy.csv | cut -d"," -f10 > skipclasses.csv
sed -i 's/1/None/g' skipclasses.csv
sed -i 's/2/Oneortwotimes/g' skipclasses.csv
sed -i 's/3/Threeorfourtimes/g' skipclasses.csv
sed -i 's/4/Fiveormoretimes/g' skipclasses.csv
sed -i 's/^/,/g' skipclasses.csv
cat truancy.csv | cut -d"," -f1,2,3,4,5,6,7,8,9 > truancy_2.csv
rm truancy.csv
paste truancy_2.csv skipclasses.csv > truancy.csv
rm truancy_2.csv
rm skipclasses.csv
sed -i 's/\t//g' truancy.csv


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

format confidence_external_factors.csv confidence_external_factors_2.csv
rename_common confidence_external_factors.csv
sed -i 's/ST43Q01/EnoughEffort/g' confidence_external_factors.csv
sed -i 's/ST43Q02/UptoMe/g' confidence_external_factors.csv
sed -i 's/ST43Q05/CouldPerformWell/g' confidence_external_factors.csv
sed -i 's/ST43Q03/FamilyProblems/g' confidence_external_factors.csv
sed -i 's/ST43Q04/TeacherProblems/g' confidence_external_factors.csv
sed -i 's/ST44Q05/MaterialTooHard/g' confidence_external_factors.csv
