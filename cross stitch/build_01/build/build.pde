import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
String  fileName;
PImage 	img;
void setup() {
	size(1000, 1000, P2D);
	img = loadImage("../../../0_data/photo/coral.png");
	img.resize(width, height);
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
	grid(100);
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
	translate(cell, cell);
	for (int n 	= 0; n < area; n++) {
		int  x 	= (n % count) * cell;
		int  y 	= (n / count) * cell;
		color col 	 = img.get(x, y);
		float bright = int(brightness(col) - 20);
		if (x < width - cell && y < height - cell) {
			cross(x, y, map(bright, 255, 1, 0, (cell / 2)*(sqrt(2))));
		}
	}
}
void cross(float x, float y, float u) {
	pushMatrix();
	translate(x, y);
	line(-u, -u, u, u);
	line(-u, u, u, -u);
	popMatrix();
}