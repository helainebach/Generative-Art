
import java.text.SimpleDateFormat;
import java.util.Date;
import processing.pdf.*;

String  folderName;
boolean exportSVG = false;
String  fileName;
int rand = 1;

void setup() {
	size(800, 800);
	background(255);
	folderName  = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}

void draw() {
	noFill();
	stroke(0);
	//--------------------------------------------
	blend(50, 8, 0, 0, width, height, rand);
	//--------------------------------------------
}

void mouseReleased() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	beginRecord(PDF, "../exports/pdf/" + folderName + "/" + fileName);
	background(255);
	rand++;
}

void mousePressed() {
	endRecord();
}

void keyPressed() {
switch (key) {case 'x': endRecord(); exit(); break;}
}

void blend(int lineNumber, int points, int xl, int yl, int w, int h, int rand) {
	translate(xl, yl);
	int[] a = new int[points];
	int[] b = new int[points];
	for (int i = 1; i < points; i++) {
		randomSeed(1000 * i * rand);
		a[i] = (int)random(0, w / points * 2);
		b[i] = ((w / points) * points) - (int)random(0, w / points * 2);
	}
	for (int j = 0; j <= lineNumber; j++) {
		beginShape();
		curveVertex((w / lineNumber) * j - 1, 0);
		curveVertex((w / lineNumber) * j, 0);
		for (int i = 1; i < points; i++) {
			float l = map(j, 0, lineNumber, 0, 1);
			float x = lerp(a[i], b[i], l);
			float y = i * (h / points);
			curveVertex(x, y);
		}
		curveVertex((w / lineNumber) * j, h);
		curveVertex((w / lineNumber) * j + 1, h);
		endShape(OPEN);
	}
}