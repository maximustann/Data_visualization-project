function visualize(dataset) {
		var scale = d3.scale.linear()
					.domain([0, d3.max(dataset)])
					.range([0, height])

		var svg = d3.select("body").append("svg")
					.attr("width", width)
					.attr("height", height)
		svg.selectAll("rect")
			.data(dataset)
			.enter()
			.append("rect")
			.attr("x", 0)
			.attr("y", function(d, i) {
					return i * 30;
					})
			.attr("width", function(d) {
					return scale(d);
					})
			.attr("height", 10)
			.attr("fill", "#3366ff")
	}

	d3.csv("truancy_summary.csv", function(data) {
		var dataset = data_extract(data[0])
		visualize(dataset)
	})

