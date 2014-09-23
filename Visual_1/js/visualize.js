function visualize(dataset_skip, dataset_fail, dataset_percent) {
	console.log(dataset_percent)
	var percent = new Array()
	percent = [100, 100, 100, 100]
	function make_x_axis() {
		return d3.svg.axis()
				.scale(xScale)
				.orient("bottom")
				.ticks(5)
	}
/*
	var zoom = d3.behavior.zoom()
				.scaleExtent([1, 10])
				.on("zoom", zoomed);
*/
	function make_y_axis() {
		return d3.svg.axis()
				.scale(yScale)
				.orient("left")
				.ticks(5)
	}

		var tip = d3.tip()
					.attr("class", "d3-tip")
					.offset([-10, 0])
					.html(function(d) {
						return "<span style='color:red'>" + "Hello" + "</span>"
					})

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
					//.call(zoom);
/*
		function zoomed() {
	  		svg.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
		}
*/
		svg.call(tip)
		svg.append("g")
			.attr("class", "axis_x")
			.attr("transform", "translate(" + padding + "," 
					+ (height - padding) + ")")
			.call(xAxis)

		svg.append("g")
			.attr("class", "axis_y")
			.attr("transform", "translate(" + padding + ", 0)")
			.call(yAxis)

		svg.append("g")
			.attr("class", "grid")
			.attr("transform", "translate(" + padding + "," + height + ")")
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
				tip.show()
			})
			.on("mouseout", function(d) {
				d3.select(this)
					.transition()
					.duration(250)
					.attr("fill", "#0099FF")
				tip.hide()
			})
			.on("click", function(d){
				d3.select(".skip")
				.selectAll("rect")
				.data(percent)
				//.attr("pointer-events", "none")
				.transition()
				.duration(2500)
				.attr("width", function(d) {
					xScale.domain([0, 100])
					return xScale(d)
				})
				d3.select(".fail")
				.selectAll("rect")
				.data(dataset_percent)
				.transition()
				.duration(2500)
				.attr("width", function(d) {
					xScale.domain([0, 100])
					return xScale(d)
				})
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
				tip.show()
			})
			.on("mouseout", function(d) {
				d3.select(this)
					.transition()
					.duration(250)
					.attr("fill", "#FFFFCC")
				tip.hide()
			})

	}


