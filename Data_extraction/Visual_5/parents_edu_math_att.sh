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

education parents_edu_att_math.csv
format parents_edu_att_math.csv parents_edu_att_math_2.csv
rename_common parents_edu_att_math.csv
question_28 parents_edu_att_math.csv
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
