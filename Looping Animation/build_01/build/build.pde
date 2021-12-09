import java.text.SimpleDateFormat;
import java.util.Date;
float 	off;
String 	fileName;
float 	rate = 0.005;
float 	x, y, res, n, a, s, ang;
void setup() {
	size(600, 600);
	fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}
void draw() {
	background(255);
	blob(width / 2, height / 2, width / 3, 10, 100);
	// record();
	off += rate;
}
void record() {
	saveFrame("../exports/" + fileName + "/###.png");
	if (frameCount > TWO_PI / rate) exit();
}
void blob(float px, float py, float s, float res, float a) {
	translate(px, py);
	beginShape();
	// extraPoint(TWO_PI - (TWO_PI / res));
	for (float i = 0; i < TWO_PI; i = i + TWO_PI / res) {
		polar(i, s, a);
		curveVertex(x, y);
		// circle(x, y, 10);
	}
	extraPoint(TWO_PI);
	// extraPoint(TWO_PI / res);
	endShape(CLOSE);
}
void polar (float ang, float s, float a) {
	n = noise(ang, off) * a;
	x = n + sin(ang) * s;
	y = n + cos(ang) * s;
}
void extraPoint(float p) {
	polar(p, s, a);
	curveVertex(x, y);
	circle(x, y, 10);
}