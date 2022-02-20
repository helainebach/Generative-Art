import java.text.SimpleDateFormat;
import java.util.Date;
import processing.pdf.*;
String  folderName;
color[] palette = {#ed0ebd, #ef28b3, #f142aa, #f35ca0, #f57696, #f78f8d, #f9a983, #fbc379, #fddd70, #fff766};
float d, seg, b, e, n;
int rand = 1;
int density = 10;
int l = 10;
int s = 45;
void setup() {
	size(800, 800);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}
void draw() {
	background(palette[0]);
	noFill();
	strokeCap(SQUARE);
	strokeWeight(width / l / 2);
//--------------------------------------------
	translate(width / 2, width / 2);
	for (int j = l / 3; j < l; ++j) {
		for (int i = 0; i < s; ++i) {
			d = j * (width / l);
			d = d - (width / l / 2);
			seg = TWO_PI / s;
			b = i * seg;
			e = b + seg;
			n = noise(j, i, rand) * palette.length-1;
			stroke(palette[1+(int)n]);
			arc(0, 0, d, d, b, e);
		}
	}
//--------------------------------------------
}
void mouseReleased() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	beginRecord(PDF, "../exports/" + folderName + "/" + fileName);
	rand++;
	// background(palette[0]);
}
void mousePressed() {
	endRecord();
}
void keyPressed() {
	if (key == 'r') {
		rand++;
	}
	if (key == 'x') {
		endRecord();
		exit();
	}
}

