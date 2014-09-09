#!/bin/bash

cat truancy.csv | cut -d"," -f2- > truancy_2.csv
sed -i 's/"//g' truancy_2.csv
sed -i 's/ //g' truancy_2.csv
mv truancy_2.csv truancy.csv
sed -i 's/ST03Q02/BirthYear/g' truancy.csv
sed -i 's/ST04Q01/Gender/g' truancy.csv
sed -i 's/ST07Q01/Repeat<01>/g' truancy.csv
sed -i 's/ST07Q02/Repeat<02>/g' truancy.csv
sed -i 's/ST07Q03/Repeat<03>/g' truancy.csv
sed -i 's/ST08Q01/LateForSchool/g' truancy.csv
sed -i 's/ST09Q01/SkipWholeDay/g' truancy.csv
sed -i 's/ST115Q01/SkipClasses/g' truancy.csv

cat late.csv | cut -d"," -f2- > late_2.csv
sed -i 's/"//g' late_2.csv
sed -i 's/ //g' late_2.csv
mv  late_2.csv late.csv

cat parents_luxuries.csv | cut -d"," -f2- > parents_luxuries_2.csv
sed -i 's/"//g' parents_luxuries_2.csv
sed -i 's/ //g' parents_luxuries_2.csv
sed -i 's/books//g' parents_luxuries_2.csv
mv  parents_luxuries_2.csv parents_luxuries.csv

