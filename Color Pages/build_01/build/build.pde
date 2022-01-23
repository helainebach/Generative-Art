// press 'r' to change random seed
// press ▲ and ▼ to change slices in rotational symmetry
// press 'e' to export svg
import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
int r = 0;
// int n = (int)random(4, 12);
int n = 4;
boolean exportSVG = false;
float size;
String  fileName;
String  folderName;
void setup() {
	size(600, 600, P2D);
	folderName  = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}
void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/" + folderName + "/" + fileName + ".svg");
	}
	noFill();
	stroke(0);
	drawing();
	if (exportSVG) {
		endRecord();
		exportSVG = false;
	}
}
void keyPressed() {
	if (key == CODED) {
		if (keyCode == UP) {
			n ++;
		} else if (keyCode == DOWN) {
			n --;
		}
	}
	if (key == 'e') {
		exportSVG = true;
	}
	if (key == 'r') {
		r ++;
	}
	if (key == 'p') {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		saveFrame("../exports/" + folderName + "/" + fileName + ".png");
	}
}
void drawing() {
	for (int i = 0; i < n; i++) {
		pushMatrix();
		translate(width / 2, height / 2);
		rotate((TWO_PI / n) * i);
		sec();
		popMatrix();
	}
	rectMode(CORNER);
	rect(0, 0, width, height);
}
/*void sec() {
	randomSeed(r * 1000);
	for (int i = 1; i < 6; i++) {
		if (i < 3) {
			size = random(10, 50);
		} else {
			size = random(150, 300);
		}
		circle(random(10, width / 2), 0, size);
	}
}*/
void sec() {
	randomSeed(r * 1000);
	for (int i = 0; i < 3; i++) {
		int u = i * 10;
		triangle(0, 0, width / 3 + u, 0, 0, height / 3 + u);
	}
	for (int j = 1; j < 4; j++) {
		int u = j * 20;
		float s = width / 3;
		triangle(s, s, s + u, s, s, s + u);
	}
}