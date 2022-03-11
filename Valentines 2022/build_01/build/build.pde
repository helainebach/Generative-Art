import java.text.SimpleDateFormat;
import java.util.Date;
import processing.pdf.*;
String  folderName;
boolean exportSVG = false;
String  fileName;
int rand = 1;
void setup() {
	size(850, 1100);
	background(255);
	folderName  = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}
void draw() {
	noFill();
	stroke(0);
	//--------------------------------------------

	// A dozen roses

	translate(width / 2, height / 3);
	for (int i = -6; i < 6; ++i) {
		randomSeed(1000 * i * rand);
		int r = (int)random(-3, 3);
		float x = i * 40;
		float y = r * 50;
		rose(x, y, 3, 4, random(30, 80));
		line(x, y, 0, height / 3);
	}
	
	//--------------------------------------------
}
void mouseReleased() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	beginRecord(PDF, "../exports/pdf/" + folderName + "/" + fileName);
	background(255);
}
void mousePressed() {
	endRecord();
}
void keyPressed() {
	switch (key) {
	case 'x': endRecord(); exit();
		break;

	case 'r': rand++; background(255);
		break;
	}
}
void rose(float px, float py, float n, float d, float rad) {
	pushMatrix();
	translate(px, py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI * d; a += .01) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x, y);
	}
	endShape(OPEN);
	popMatrix();
}