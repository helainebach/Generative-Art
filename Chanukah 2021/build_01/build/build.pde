import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
PShape  guide;
String  fileName;
int u;
void setup() {
	guide = loadShape("../../guide.svg");
	size(630, 630);
	background(255);
	guides();
	noFill();
	stroke(0);
	u = width / 21;
}
void draw() {
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
//--------------------------------------------
	float y1 = u * 7;
	float y2;
	float x;
	triangle(u * 2, u * 7, width / 2, height - u * 2, width - u * 2, u * 7);
	line(u * 8, height - u * 2, u * 13, height - u * 2);
	for (float i = 1; i <= 16; i++) {
		x = u * 2 + i * u;
		if (i < 9) {
			y2 = ((i * 12) / 8.5) * u;
			line(x, y1, x, y1 + y2);
		} else {
			float t = (i - 8.5) * 2;
			y2 = (((i - t) * 12) / 8.5) * u;
			line(x, y1, x, y1 + y2);
		}
	}
	for (int i = 0; i < 9; i++) {
		pushMatrix();
		translate(u * 2, u * 7);
		x(i * u * 2, 0);
		popMatrix();
	}
	for (int i = 0; i < 2; i++) {
		pushMatrix();
		translate(u * 10, u * 6);
		x(0, i * -u);
		popMatrix();
	}

	for (int i = 0; i < 9; i++) {
		pushMatrix();
		translate(u * 2, u * 4);
		if (i == 4) {
			square(i * u * 2, -u * 2, u);
		} else {
			square(i * u * 2, 0, u);
		}
		popMatrix();
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
void grid(int count) {
	int cell = width / count;
	int area = count * (height / cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		stroke(0, 20);
		noFill();
		square(x, y, cell);
	}
}
void guides() {
	fill(#47D7FF, 100);
	noStroke();
	guide.disableStyle();
	shape(guide, 0, 0, width, height);
	grid(21);
}
void x(float x, float y) {
	beginShape();
	vertex(x, y);
	vertex(x + u, y - u);
	vertex(x, y - u);
	vertex(x + u, y);
	endShape(OPEN);
}