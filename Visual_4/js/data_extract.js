function construct(data){
	var dataset = [
			["Parents Like Math"],
			["Students Like Math"],
			["Parents think Math is worthwhile to learn"],
			["Students think Math is worthwhile to learn"],
			["Parents think Math is Important for career"],
			["Students think Math is Important for career"],
			]
	var i = 0;
	for(var j = 0; j < data.length - 1; j += 2){
		dataset[i].push(parseInt(data[j]["parents"]))
		dataset[i].push(parseInt(data[j + 1]["parents"]))
		dataset[i + 1].push(parseInt(data[j]["student"]))
		dataset[i + 1].push(parseInt(data[j + 1]["student"]))
		i += 2
	}
	return dataset
}
