BEGIN {
	FS=","
}
NR == 2{
	nontotal = $1
	onetotal = $2
	threetotal = $3
	fivetotal = $4
}
NR == 3{
	nontarget = $1
	onetarget = $2
	threetarget = $3
	fivetarget = $4
	array[0] = nontarget / nontotal
	array[1] = onetarget / onetotal
	array[2] = threetarget / threetotal
	array[3] = fivetarget / fivetotal
}

END {
	num = length(array)
	for(i = 0; i < length(array) - 1; ++i){
		printf("%s%s,", array[i] * 100,"%")
		}
	printf("%s%s", array[num - 1] * 100, "%")
	}
