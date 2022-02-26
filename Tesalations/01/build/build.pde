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
	blend(50, 6, 0, 0, width, height, 2, rand);
	pushMatrix();
	translate(width, 0);
	rotate(PI / 2);
	blend(25, 6, 0, 0, width, height, 2, rand);
	popMatrix();
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
void blend(int lineNumber, int points, int xl, int yl, int w, int h, int randA, int rand) {
	translate(xl, yl);
	PVector[] a = new PVector[points];
	PVector[] b = new PVector[points];
	for (int i = 1; i < points; i++) {
		randomSeed(1000 * i * rand);
		a[i] = new PVector();
		b[i] = new PVector();
		a[i].x = (int)random(0, w / points * 2);
		b[i].x = ((w / points) * points) - (int)random(0, w / points * 2);
		a[i].y = i * (h / points) + random(-h / points / randA, h / points / randA);
		b[i].y = i * (h / points) + random(-h / points / randA, h / points / randA);
	}
	for (int j = 1; j <= lineNumber; j++) {
		beginShape();
		curveVertex((w / lineNumber) * j - 1, 0);
		curveVertex((w / lineNumber) * j, 0);
		for (int i = 1; i < points; i++) {
			float l = map(j, 0, lineNumber, 0, 1);
			float x = lerp(a[i].x, b[i].x, l);
			float y = lerp(a[i].y, b[i].y, l);
			curveVertex(x, y);
		}
		curveVertex((w / lineNumber) * j, h);
		curveVertex((w / lineNumber) * j + 1, h);
		endShape(OPEN);
	}
}

