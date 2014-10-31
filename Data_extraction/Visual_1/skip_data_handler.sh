#!/bin/bash 

./truan.sh 
python ./tr.py 
./tr_sep.sh 
./cp_paste.sh $1
