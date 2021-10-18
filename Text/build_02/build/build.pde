import java.text.SimpleDateFormat;
import java.util.Date;
String  t 		 = "⣿";
PVector a 		 = new PVector(-10, -5);
float 	rate 	 = .01;
float 	n 		 = TWO_PI / rate;
float   off;
color 	c;
color[] palette  = {#E145E5,#FBDD73,#4F97F1,#B9CCE3};
String  pathDATA = "../../../0_data/";
PFont  	font;
boolean guide = false;
void setup() {
	frameRate(1000);
	// font = createFont(pathDATA + "fonts/SourceCodePro-Black.otf", 70);
	// font = createFont(pathDATA + "fonts/Arial Unicode.ttf", 100);
	font = createFont(pathDATA + "fonts/UBraille.ttf", 100);
	size(600, 600, P3D);
	background(palette[3]);
	textFont (font);
	textAlign(CENTER, CENTER);
	fill(#94B8E3);
	if (guide) {
		text(t, width / 2, height / 2);
	}
}
void draw() {
	translate(a.x, a.y);
	translate(width / 2 + (sin(off) * width / 3), height / 2 + (cos(off) * height / 3), cos(off * 8) * 100);
	if (frameCount <= n / 4 || frameCount >= n * .75) {
		c = lerpColor(palette[0], palette[1], abs(sin(off)));
	} else if (frameCount >= n / 4 && frameCount <= n * .75) {
		c = lerpColor(palette[2], palette[1], abs(sin(off)));
	}
	fill(c, 50);
	if (frameCount <= Math.ceil(n)) {
		text(t, 0, 0, 0);
	}
	off += rate;
}
void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		saveFrame("../exports/2/" + fileName + "-" + t + ".png");
		break;
	}
}