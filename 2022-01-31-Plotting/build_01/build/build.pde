import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
String 	pathDATA = "../../../0_data/svg/truchet/";
String  fileName;
boolean exportSVG = false;
boolean g = false;
PShape 	s;
PFont 	f;
int 	cell;

int n = 4;
int[][] tileArray = {
	{0, 3},
	{1, 1}
};
//
void setup() {
	f = createFont("../../../0_data/fonts/Rubik-Medium.ttf", 32);
	textFont(f);
	textAlign(CENTER, CENTER);
	s = loadShape(pathDATA + n + ".svg");
	s.disableStyle();
	shapeMode(CENTER);
	rectMode(CENTER);
	size(600, 600);
	noFill();
	stroke(0);
}
void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
//--------------------------------------------
	grid(10);
//--------------------------------------------
	if (exportSVG) {
		endRecord();
		exportSVG = false;
	}
}
void grid(int count) {
	cell = width / count;
	int area = count * (height / cell);
	translate(cell / 2, cell / 2);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		randomSeed(x * y);
		pushMatrix();
		translate(x, y);
		int dir = tileArray[(int)(y / cell) % tileArray.length][(int)(x / cell) % tileArray.length];
		rotate(dir * PI / 2);
		shape(s, 0, 0, cell, cell);
		if (g == true) guides();
		popMatrix();
	}
}
//
// Controls
//
void keyPressed() {
	if (key == 'e') {
		exportSVG = true;
	}
}
void mousePressed() {g = true;}
void mouseReleased() {g = false;}

void guides() {
	square(0, 0, cell);
	fill(255, 0, 0);
	text(">", 0, 0);
	noFill();
}