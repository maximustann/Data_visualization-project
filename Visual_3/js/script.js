var w = 500,
	h = 500;

function extract(data){
	d = [
			[
				{axis:"Enjoy Reading", value:parseFloat(data[0].male) / parseFloat(data[8].male)},
				{axis:"Worthwhlie Work", value:parseFloat(data[1].male) / parseFloat(data[8].male)},
				{axis:"Look Forward", value:parseFloat(data[2].male) / parseFloat(data[8].male)},
				{axis:"Enjoy Math", value:parseFloat(data[3].male) / parseFloat(data[8].male)},
				{axis:"Career Chance", value:parseFloat(data[4].male) / parseFloat(data[8].male)},
				{axis:"Interested", value:parseFloat(data[5].male) / parseFloat(data[8].male)},
				{axis:"Future Study", value:parseFloat(data[6].male) / parseFloat(data[8].male)},
				{axis:"Get Job", value:parseFloat(data[7].male) / parseFloat(data[8].male)}
			],
			[
				{axis:"Enjoy Reading", value:parseFloat(data[0].female) / parseFloat(data[8].female)},
				{axis:"Worthwhlie Work", value:parseFloat(data[1].female) / parseFloat(data[8].female)},
				{axis:"Look Forward", value:parseFloat(data[2].female) / parseFloat(data[8].female)},
				{axis:"Enjoy Math", value:parseFloat(data[3].female) / parseFloat(data[8].female)},
				{axis:"Career Chance", value:parseFloat(data[4].female) / parseFloat(data[8].female)},
				{axis:"Interested", value:parseFloat(data[5].female) / parseFloat(data[8].female)},
				{axis:"Future Study", value:parseFloat(data[6].female) / parseFloat(data[8].female)},
				{axis:"Get Job", value:parseFloat(data[7].female) / parseFloat(data[8].female)}
			]
	]
	return d
}


function display(select) {
	filename = "data/" + select + "/job_interest_summary.csv"
	d3.csv(filename, function(data){

		var d = extract(data)




var colorscale = d3.scale.category10();

//Legend titles
var LegendOptions = ['male','female'];

//Options for the Radar chart, other than default
var mycfg = {
  w: w,
  h: h,
  maxValue: 0.6,
  levels: 6,
  ExtraWidthX: 300
}

//Call function to draw the Radar chart
//Will expect that data is in %'s
RadarChart.draw("#chart", d, mycfg);

////////////////////////////////////////////
/////////// Initiate legend ////////////////
////////////////////////////////////////////

var svg = d3.select('#body')
	.selectAll('svg')
	.append('svg')
	.attr("width", w+300)
	.attr("height", h)

//Create the title for the legend
var text = svg.append("text")
	.attr("class", "title")
	.attr('transform', 'translate(90,0)') 
	.attr("x", w - 70)
	.attr("y", 10)
	.attr("font-size", "12px")
	.attr("fill", "#404040")
	.text("What % of different gender student think about Math");
		
//Initiate Legend	
var legend = svg.append("g")
	.attr("class", "legend")
	.attr("height", 100)
	.attr("width", 200)
	.attr('transform', 'translate(90,20)') 
	;
	//Create colour squares
	legend.selectAll('rect')
	  .data(LegendOptions)
	  .enter()
	  .append("rect")
	  .attr("x", w - 65)
	  .attr("y", function(d, i){ return i * 20;})
	  .attr("width", 10)
	  .attr("height", 10)
	  .style("fill", function(d, i){ return colorscale(i);})
	  ;
	//Create text next to squares
	legend.selectAll('text')
	  .data(LegendOptions)
	  .enter()
	  .append("text")
	  .attr("x", w - 52)
	  .attr("y", function(d, i){ return i * 20 + 9;})
	  .attr("font-size", "11px")
	  .attr("fill", "#737373")
	  .text(function(d) { return d; })
	  ;	

		})
}
