import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
float   r;
float   x, y;
boolean exportSVG = false;
String  fileName;
void setup() {
	size(800, 800);
}
void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
	noFill();
	stroke(0);
//--------------------------------------------
	int count = 10;
	int cell = width / count;
	int area = count * (height / cell);
	translate(cell / 2, cell / 2);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		for (int i = 5; i > 1; i--) {
			star(6, ((cell / 2) / 6) * i, 1.75, x, y);
			rectMode(CENTER);
		}
		if (x < cell || y < cell) {
			stroke(200, 0, 0);
			rect(x, y, cell, cell);
			stroke(0);
		}
	}
//--------------------------------------------
	if (exportSVG) {
		endRecord();
		exportSVG = false;
	}
}
void keyPressed() {
	if (key == 'e') {
		exportSVG = true;
	}
}
void star(int n, float s, float d, float pX, float pY) {
	pushMatrix();
	translate(pX, pY);
	rotate(-PI / 2);
	beginShape();
	for (float a = 0; a < TWO_PI * .99; a += TWO_PI / n) {
		r = s;
		polar(a);
		vertex(x, y);
		r = r / d;
		polar(a + TWO_PI / (n * 2));
		vertex(x, y);
	}
	endShape(CLOSE);
	popMatrix();
}
void polar(float a) {
	x = r * cos(a);
	y = r * sin(a);
}