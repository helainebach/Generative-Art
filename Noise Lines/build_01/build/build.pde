float off;
import java.text.SimpleDateFormat;
import java.util.Date;
import processing.pdf.*;
String  folderName;
void setup() {
	size(600, 600);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	background(255);
}

void draw() {
	noiseSeed(1);
	float nX = noise(off);
	noiseSeed(30);
	float nY = noise(off);
	float x = nX * width;
	float y = nY * height;
	seg(x, y, (nY * 300), nX * 2 * TWO_PI);
	off += .009;
}

void seg(float x, float y, float l, float r) {
	float adj = l * cos(r);
	float opp = l * sin(r);
	float x1 = x;
	float y1 = y;
	float x2 = x + adj;
	float y2 = y + opp;;
	line(x1, y1, x2, y2);
}

void mouseReleased() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	beginRecord(PDF, "../exports/" + folderName + "/" + fileName);
	background(255);
}

void mousePressed() {
	endRecord();
}

void keyPressed() {
switch (key) {case 'x': endRecord(); exit(); break;}
switch (key) {case 'c': background(255); break;}
}

