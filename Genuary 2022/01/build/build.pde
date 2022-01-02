// Genuary 2022 - Day 01
// Draw 10,000 of something.
String  pathDATA = "../../../0_data/";
color[] palette  = {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
color  	bg 		 = 255;
color  	fg 		 = 0;
PFont   font;
//
void setup() {
	// noLoop();
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 100);
	size(1080, 1080);
	frameRate(8);
}
//
void draw() {
	bg();
	labels(frameCount * 8);
	drawingGrid();
	record();
}
//
void drawing(float x, float y, float s) {
	s = s * random(.5, 1);
	pushMatrix();
	translate(x + random(-s*.1, s*.1), y + random(-s*.1, s*.1));
	for (int i = 0; i < 4; i++) {
		l(random(360), random(360), s);
	}
	noFill();
	stroke(fg);
	strokeWeight(5);
	circle(0, 0, s);
	for (int i = 0; i < 3; i++) {
		c(random(8) * PI / 4, s);
	}
	popMatrix();
}
void c(float r, float s) {
	fill(palette[(int)random(palette.length)]);
	noStroke();
	rotate(r);
	circle(s / 2, 0, s / random(5, 8));

}
void l(float a, float b, float s) {
	strokeWeight(3);
	stroke(palette[(int)random(palette.length)]);
	line(sin(a) * s / 2, cos(a) * s / 2, sin(b) * s / 2, cos(b) * s / 2);
}
//
void bg() {
	background(bg);
	stroke(fg);
	strokeWeight(2);
	line(width / 3, 0, width / 3, height);
	line(width / 3 * 2, 0, width / 3 * 2, height);
	line(0, height / 3, width, height / 3);
	line(0, height / 3 * 2, width, height / 3 * 2);
}
void labels(int n) {
	fill(fg);
	textAlign(CENTER, CENTER);
	textFont(font, 50);
	text(n + "/10000\nDRAWINGS", width / 2, height / 2);
}
void drawingGrid() {
	int c = 3;
	int cell   = width / c;
	for (int n = 0; n < c * c; n++) {
		int x  = (n % c) * cell + cell / 2;
		int y  = (n / c) * cell + cell / 2;
		noStroke();
		if (n != 4) drawing (x, y, cell * .75);
	}
}
void record() {
	if (frameCount <= 10000 / 8) {
		saveFrame("../exports3/frames/###.png");
	} else {
		exit();
	}
}