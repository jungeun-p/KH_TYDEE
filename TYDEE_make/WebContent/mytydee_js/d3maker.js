const width = Number(window.innerWidth)/2,
height = 600,
maxRadius = (Math.min(width, height) / 2) - 5;

const formatNumber = d3.format(",d");

const x = d3.scaleLinear()
.range([0, 2 * Math.PI])
.clamp(true);

const y = d3.scaleSqrt().range([maxRadius * .1, maxRadius]);

const partition = d3.partition();

const arc = d3
.arc()
.startAngle(d => x(d.x0))
.endAngle(d => x(d.x1))
.innerRadius(d => Math.max(0, y(d.y0)))
.outerRadius(d => Math.max(0, y(d.y1)));

const middleArcLine = d => {
	const halfPi = Math.PI / 2;
	const angles = [x(d.x0) - halfPi, x(d.x1) - halfPi];
	const r = Math.max(0, (y(d.y0) + y(d.y1)) / 2);

	const middleAngle = (angles[1] + angles[0]) / 2;
	const invertDirection = middleAngle > 0 && middleAngle < Math.PI; // On lower quadrants write text ccw
	if (invertDirection) {
		angles.reverse();
	}

	const path = d3.path();
	path.arc(0, 0, r, angles[0], angles[1], invertDirection);
	return path.toString();
};

const textFits = d => {
	const CHAR_SPACE = 6;

	const deltaAngle = x(d.x1) - x(d.x0);
	const r = Math.max(0, (y(d.y0) + y(d.y1)) / 2);
	const perimeter = r * deltaAngle;

	return d.data.name.length * CHAR_SPACE < perimeter;
};

const svg = d3
.select("#mytydee")
.append("svg")
.style("width", width+"px")
.style("height", height+"px")
.attr("viewBox", `${-width / 2} ${-height / 2} ${width} ${height}`)
.on("click", () => focusOn()); // Reset zoom on canvas click

//.attr("viewBox", `0 0 ${width} ${height}`)

let data = mytydeejson;
const root = d3.hierarchy(data)
.sum(d => d.value)
.sort((a, b) => b.value - a.value);
const color = d3.scaleOrdinal()
.range(d3.quantize(d3.interpolateViridis, root.children.length + 1));
//const color = d3.scaleOrdinal().range(d3.quantize(d3.interpolateTurbo, root.children.length + 1));
//const color = d3.scaleOrdinal(d3.schemeSet3);

const slice = svg.selectAll("g.slice").data(partition(root).descendants());

slice.exit().remove();

const newSlice = slice.enter()
.append("g")
.attr("class", "slice")
.attr("value", d => d.data.name)
.on("click", d => {
	d3.event.stopPropagation();
	focusOn(d);
})
.on("mouseover", d => {
	d3.select("[name=tiny_no]").attr("value", d.data.tiny_no);
	d3.select("[name=tiny_type]").attr("value", d.data.tiny_type);
	d3.select("[name=type]").attr("value", (d.data.tiny_type == 'D')?"TYDEE":((d.data.tiny_type == 'N')?"TINY":"USER"));
	d3.select("[name=name]").attr("value", d.data.name);
	d3.select("[name=location]").attr("value", `${d.ancestors().map(d => d.data.name).reverse().join("/")}`);
	d3.select("[name=content]").text(d.data.tiny_content);
	d3.select("[name=regdate]").attr("value", d.data.regdate);
});

newSlice
.append("path")
.attr("class", "main-arc")
.style("fill", d => color((d.depth > 1 ? d.parent : d).data.name))
.attr("fill-opacity", d => (d.children ? 0.8 : 0.6))
.attr("d", arc);

newSlice
.append("path")
.attr("class", "hidden-arc")
.attr("id", (_, i) => `hiddenArc${i}`)
.attr("d", middleArcLine);

const text = newSlice
.append("text")
.attr("display", d => (textFits(d) ? null : "none"));

//Add white contour
text
.append("textPath")
.attr("startOffset", "50%")
.attr("xlink:href", (_, i) => `#hiddenArc${i}`)
.attr("font-family","Font Awesome 5 Free")
.attr("font-weight",900)
.text(d => d.data.name)
.style("fill", "none")
.style("stroke", "#fff")
.style("stroke-width", 3)
.style("stroke-linejoin", "round");

text
.append("textPath")
.attr("startOffset", "50%")
.attr("xlink:href", (_, i) => `#hiddenArc${i}`)
.text(d=> d.data.name);


function focusOn(d = {x0: 0,
		x1: 1,
		y0: 0,
		y1: 1,}) {
	// Reset to top-level if no data point specified
	const transition = svg
	.transition()
	.duration(750)
	.tween("scale", () => {
		const xd = d3.interpolate(x.domain(), [d.x0, d.x1]),
		yd = d3.interpolate(y.domain(), [d.y0, 1]);
		return (t) => {
			x.domain(xd(t));
			y.domain(yd(t));
		};
	});

	transition.selectAll("path.main-arc").attrTween("d", d => () => arc(d));

	transition
	.selectAll("path.hidden-arc")
	.attrTween("d", d => () => middleArcLine(d));

	transition
	.selectAll("text")
	.attrTween("display", d => () => (textFits(d) ? null : "none"));

	moveStackToFront(d);

	function moveStackToFront(elD) {
		svg
		.selectAll(".slice")
		.filter(d => d === elD)
		.each(function (d) {
			this.parentNode.appendChild(this);
			if (d.parent) {
				moveStackToFront(d.parent);
			}
		});
	}
}