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
	sed -i 's/ST29Q04/EnjoyMath/g' $1
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

education() {
	sed -i 's/She did not complete /NotFinished/g' $1
	sed -i 's/He did not complete /NotFinished/g' $1
	sed -i 's/<ISCED level 1>/Primary/g' $1
	sed -i 's/<ISCED level 2>/Junior_secondary/g' $1
	sed -i 's/<ISCED level 2C>/Junior_vocational/g' $1
	sed -i 's/<ISCED level 3A>/General_secondary/g' $1
	sed -i 's/<ISCED level 3B, 3C>/Vocational/g' $1
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


