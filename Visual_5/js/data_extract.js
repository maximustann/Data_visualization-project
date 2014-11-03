function negative(array){
	neg = parseFloat(array["Disagree"]) + parseFloat(array["Stronglydisagree"]);
	total = parseFloat(array["Agree"]) + parseFloat(array["Disagree"]) + parseFloat(array["Stronglyagree"]) + parseFloat(array["Stronglydisagree"]);
	return parseInt(neg / total * 100)
}

function positive(array){
	pos = parseFloat(array["Agree"]) + parseFloat(array["Stronglyagree"])
	total = parseFloat(array["Agree"]) + parseFloat(array["Disagree"]) + parseFloat(array["Stronglyagree"]) + parseFloat(array["Stronglydisagree"]);
	return parseInt(pos / total * 100)
}

function summ(array){
	var sum = parseInt(array["Agree"]) + parseInt(array["Disagree"]) + parseInt(array["Stronglyagree"]) + parseInt(array["Stronglydisagree"]);
	return sum
}


function extract(filename){
	//console.log(filename)
	var dataset = new Array();
	var dataset_mother = [
				["mother_number"],
				["mother_think_positive"],
				["mother_think_negative"]
			]

	var dataset_father= [
				["father_number"],
				["father_think_positive"],
				["father_think_negative"]
			]

	for(var i = 0; i < filename.length - 1; i += 2){
		dataset_mother[0].push(summ(filename[i]));
		dataset_father[0].push(summ(filename[i + 1]));
		dataset_mother[1].push(positive(filename[i]));
		dataset_father[1].push(positive(filename[i + 1]));
		dataset_mother[2].push(negative(filename[i]));
		dataset_father[2].push(negative(filename[i + 1]));
	}
	/*console.log(dataset_mother)*/
	dataset.push(dataset_mother);
	dataset.push(dataset_father);
	return dataset;
}

