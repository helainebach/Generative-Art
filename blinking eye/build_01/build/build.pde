color[] palette = {#1A93A0,#FAF6EB,#ADD8F3,#F3E0A8,#F99263};
String pathDATA = "../../../0_data/";
void setup() {
	size(1080, 1080);
}
void draw() {
	background(palette[0]);
	noFill();
	stroke(palette[1]);
	strokeWeight(.5);
	grid(12);
	strokeWeight(10);
	stroke(palette[3]);
	fill(palette[4]);
	curveTightness(-1);
	float openness = map(mouseX, 0, width, height / 2, height);
	strokeJoin(ROUND);
	beginShape();
	curveVertex (0, 				openness);
	curveVertex (width / 6, 		height / 2);
	curveVertex (width - width / 6, height / 2);
	curveVertex (width - width / 6, openness);
	vertex 		(width - width / 6, height / 2);
	curveVertex (width - width / 6, height - openness);
	curveVertex (width - width / 6, height / 2);
	curveVertex (width / 6, 		height / 2);
	curveVertex (0, height - openness);
	endShape(CLOSE);
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		square(x, y, cell);
	}
}