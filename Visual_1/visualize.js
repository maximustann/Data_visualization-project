function visualize(dataset) {
		var xScale = d3.scale.linear()
					.domain([0, d3.max(dataset)])
					.range([0, width])


		var xAxis = d3.svg.axis()
					.scale(xScale)
					.orient("bottom")

		var svg = d3.select("body").append("svg")
					.attr("width", width)
					.attr("height", height)

		svg.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0, " + (height - 20) + ")")
			.call(xAxis)

		svg.selectAll("rect")
			.data(dataset)
			.enter()
			.append("rect")
			.attr("x", 0)
			.attr("y", function(d, i) {
					return i * 150;
					})
			.attr("width", function(d) {
					return xScale(d);
					})
			.attr("height", 100)
			.attr("fill", "#3366ff")
	}


