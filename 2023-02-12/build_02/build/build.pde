import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
String  fileName;
void setup() {
	size(900, 900);
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
	pushMatrix();
	translate(width / 2, height / 2);
	rectMode(CENTER);
	float r = atan(2);
	float s = width/3*2;
	circle(0,0,hypo(s));
	while (s > 30) {
		square(0, 0, s);
		rotate(r);
		s = s * sqrt(5) / 3;
	}
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
}
float hypo(float a) {
	double c = Math.sqrt((a * a) + (a * a));
	return (float)c;
}
