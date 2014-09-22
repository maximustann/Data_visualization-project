function visualize(dataset_skip, dataset_fail, dataset_key) {
	function make_x_axis() {
		return d3.svg.axis()
				.scale(xScale)
				.orient("bottom")
				.ticks(5)
	}

	function make_y_axis() {
		return d3.svg.axis()
				.scale(yScale)
				.orient("left")
				.ticks(5)
	}


		var xScale = d3.scale.linear()
					.domain([0, d3.max(dataset_skip)])
					.range([0, width])

		var yScale = d3.scale.ordinal()
					.domain(d3.range(dataset_skip.length))
					.rangeBands([0, height])

		var xAxis = d3.svg.axis()
					.scale(xScale)
					.orient("bottom")

		var yAxis = d3.svg.axis()
					.scale(yScale)
					.orient("left")

		var svg = d3.select("body").append("svg")
					.attr("width", width)
					.attr("height", height)

		svg.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(" + padding + "," 
					+ (height - padding) + ")")
			.call(xAxis)

		svg.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(" + padding + ", 0)")
			.call(yAxis)

		svg.append("g")
			.attr("class", "grid")
			.attr("transform", "translate(" + padding + height + ")")
			.call(make_x_axis()
					.tickSize(-height, 0, 0)
					.tickFormat(""))

		svg.append("g")
			.attr("class", "grid")
			.call(make_y_axis()
					.tickSize(-width, 0, 0)
					.tickFormat(""))

		svg.append("g")
			.attr("class", "skip")
			.selectAll("rect")
			.data(dataset_skip)
			.enter()
			.append("rect")
			.attr("x", 0)
			.attr("y", function(d, i) {
					return i * 100;
					})
			.attr("width", function(d) {
					return xScale(d);
					})
			.attr("height", 50)
			.attr("fill", "#0099FF")
			.attr("transform", "translate(" + padding + ", 0)")
			.on("mouseover", function(d) {
				d3.select(this)
					.transition()
					.duration(250)
					.attr("fill", "#666699")
			})
			.on("mouseout", function(d) {
				d3.select(this)
					.transition()
					.duration(250)
					.attr("fill", "#0099FF")
			})
		svg.append("g")
			.attr("class", "fail")
			.selectAll("rect")
			.data(dataset_fail)
			.enter()
			.append("rect")
			.attr("x", 0)
			.attr("y", function(d, i) {
					return i * 100;
					})
			.attr("width", function(d) {
					return xScale(d);
					})
			.attr("height", 50)
			.attr("fill", "#FFFFCC")
			.attr("transform", "translate(" + padding + ", 0)")
			.on("mouseover", function(d) {
				d3.select(this)
					.transition()
					.duration(250)
					.attr("fill", "#E6E6B8")
			})
			.on("mouseout", function(d) {
				d3.select(this)
					.transition()
					.duration(250)
					.attr("fill", "#FFFFCC")
			})

	}


