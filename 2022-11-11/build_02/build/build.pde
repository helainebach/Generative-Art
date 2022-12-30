import java.text.SimpleDateFormat;
import java.util.Date;
String 	pathDATA = "../../../0_data/";
String 	fileName;
PFont  	font;
float 	x, y, a, off;
int 	count 	= 12;
float 	rate 	= 0.04;
color   c1 		= #FF347F;
color   c2 		= #4B34FF;
color   bg 		= 255;
String  t 		= "≋";
//
void setup() {
	size(600, 600, P2D);
	font = createFont(pathDATA + "fonts/Arial Unicode.ttf", 100);
	fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	textFont (font);
}
//
void draw() {
	translate(width / 2, height / 2);
	bg();
	for (int i = 1; i < count; i++) {
		ring(width / count / 2 * i);
	}
	off += rate;
	record();
}
void ring(float r) {
	float circ = r * TWO_PI;
	int c = int(circ / (width * .05));
	for (float i = 0; i < c; i++) {
		a = map(i, 0, c, 0, TWO_PI);
		float n = noise(r, cos(a) * PI, off);
		polar(a, r);
		fill(lerpColor(c1, c2, n));
		textSize(n * (width / count) * .9);
		pushMatrix();
		translate(x, y);
		rotate(a * 2 + off);
		text(t, 0, 0);
		popMatrix();
	}
}
void polar(float a, float r) {
	x = sin(a) * r;
	y = cos(a) * r;
}
void bg() {
	background(bg);
	noFill();
}


void record() {
	saveFrame("../exports/" + fileName + "/###.png");
	if (frameCount > TWO_PI / rate*4) exit();
	println(frameCount+" / "+TWO_PI / rate*4);
}
