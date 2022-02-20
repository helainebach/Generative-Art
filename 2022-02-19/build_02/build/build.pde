import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
String  fileName;
float d, seg, b, e, n;
int rand = 1;
int lev = 10;
int density = 10;
int l = lev * density;
int s = 45;
void setup() {
	size(800, 800);
}
void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
	noFill();
	strokeCap(SQUARE);
//--------------------------------------------
	translate(width / 2, width / 2);
	for (int j = l / 3; j < l; ++j) {
		for (int i = 0; i < s; ++i) {
			d = j * (width / l);
			d = d - (width / l / 2);
			seg = TWO_PI / s;
			b = i * seg;
			e = b + seg;
			n = noise(j / density, i, rand) * 2;
			stroke((int)(Math.floor(n)) * 255);
			arc(0, 0, d, d, b, e);
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