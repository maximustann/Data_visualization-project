function extract(filename){
	//console.log(filename)
	var dataset = new Array();
	var dataset_mother = [
				["mother_line"],
				["mother_negative"],
				["mother_positive"]
			]

	var dataset_father= [
				["father_line"],
				["father_negative"],
				["father_positive"]
			]

	for(var i = 0; i < filename.length - 1; i += 2){
		dataset_mother[0].push(summ(filename[i]));
		dataset_father[0].push(summ(filename[i + 1]));
		//dataset_mother[1].push(neg(filename[i]));
		//dataset_father[1].push(neg(filename[i + 1]));
		//dataset_mother[2].push(pos(filename[i]));
		//dataset_father[2].push(pos(filename[i + 1]));
	}
	dataset.push(dataset_mother);
	dataset.push(dataset_father);
	console.log(dataset)
	return dataset;
}
function neg(array){
	neg = parseFloat(array["Disagree"]) + parseFloat(array["Stronglydisagree"]);
	total = parseFloat(array["Agree"]) + parseFloat(array["Disagree"]) + parseFloat(array["Stronglyagree"]) + parseFloat(array["Stronglydisagree"]);
	return neg / total * 100
}

function pos(array){
	pos = parseFloat(array["Agree"]) + parseFloat(array["Stronglyagree"])
	total = parseFloat(array["Agree"]) + parseFloat(array["Disagree"]) + parseFloat(array["Stronglyagree"]) + parseFloat(array["Stronglydisagree"]);
	return pos / total * 100
}

function summ(array){
	var sum = parseInt(array["Agree"]) + parseInt(array["Disagree"]) + parseInt(array["Stronglyagree"]) + parseInt(array["Stronglydisagree"]);
	return sum
}
