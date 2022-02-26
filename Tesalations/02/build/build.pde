import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
String  fileName;
int rand = 1;
void setup() {
	size(825, 825, P2D);
}
void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
	octGuides(800);
	noFill();
	stroke(0);
//--------------------------------------------
	for (int y = 0; y <= height; y += width / 10) {
		for (int x = 0; x <= width; x += width / 10) {
			noiseSeed(rand * x * y);
			randomSeed(rand * x * y + 100);
			float d = noise(x, y) * 200;
			x = x + (int)random(-20, 50);
			y = y + (int)random(-10, 10);
			if (d % 2 == 0) {
				d=-50;
			} else {
				d=d;
			}
			stroke(0);
			circle(x, y, d);
			if (d < 50) {
				stroke(255, 0, 0);
				circle(x, y, d + 10);
				stroke(0);
				circle(x, y, d + 20);
			} if (d > 50 && d < 100) {
				stroke(255, 0, 0);
				circle(x, y, d + 10);
			}
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
	if (key == 'r') {
		rand++;
	}
}
void octGuides(int u) {
	noFill();
	stroke(200);
	pushMatrix();
	translate(width / 2, height / 2);
	rectMode(CENTER);
	square(0, 0, u);
	line(0     ,  -u / 2,  0     ,  u / 2);
	line(-u / 2,  0     ,  u / 2 ,  0    );
	line(-u / 2,  -u / 2,  u / 2 ,  u / 2);
	line(u / 2 ,  -u / 2,  -u / 2,  u / 2);
	popMatrix();
}