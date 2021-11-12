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
	// guides();
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
	for (int i = 0; i < 9; i++) {
		pushMatrix();
		float t;
		if (i < 4) {
			t = 1 + i;
		} else {
			t = ((i - (i - 4.5) * 2));
		}
		if (i < 8) {
			pushMatrix();
			translate(u * 3, u * 8);
			if (i<4) {
				x(i * u * 2, u*i*2);	
			}else{
				x(i * u * 2, u*(i-(i-4.5)*2)*2-u*4);
			}
			popMatrix();
		}
		for (int j = 0; j < t * 2; j++) {
			pushMatrix();
			translate(u * 2, u * 7);
			if (i != 4) {
				x(i * u * 2, j * u);
			}
			popMatrix();
		}
		popMatrix();
	}
	lights();
	for (int i = 0; i < 14; i++) {
		x(10 * u, 5 * u + i * u);
	}
	for (int i = 0; i < 5; i++) {
		x(8 * u + i * u, 19 * u);
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
void lights() {
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
}