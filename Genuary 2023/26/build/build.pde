import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
float 	off 	 = 0;
float   rate 	 = PI / 100;
int 	day 	 = 26;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	// noLoop();
}
void draw() {
	background(palette[1]);
	pushMatrix();
	translate(width / 2, height / 2);
	noFill();
	strokeWeight(2);
	int n = 100;
	while (n < width - 100) {
		if (n % 20 == 0) {
			rotate(degrees(n));
			randomSeed(n*100);
			int c = (int)random(palette.length);
			if (c==1) {
				c = (int)random(palette.length);
			}
			stroke(palette[c]);
			noiseSeed(n);
			wSquare(n, n / 20);
		}
		n++;
	}
	popMatrix();
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	record();
}
void wSquare(int w, int a) {
	int   p = 0;
	int   p_;
	float x = 0;
	float y = 0;
	float n;
	int   tic = w / a;
	pushMatrix();
	translate(-w / 2, -w / 2);
	beginShape();
	while (p <= (w * 4) + (tic * 2)) {
		p_ = p % (w * 4);
		int s = (int)Math.floor(p_ / w) % 4;
		if (p % w == 0) {
			n = 0;
		} else {
			n = map(noise(p, s, off), 0, 1, -1, 1) * 5;
		}
		switch (s) {
		case 0 :
			x = p_;
			y = n;
			break;
		case 1 :
			x = w + n;
			y = p - w;
			break;
		case 2 :
			x = w - (p - w * 2);
			y = w + n;
			break;
		case 3 :
			x = n;
			y = w - (p - w * 3);
			break;
		}
		if (p >= w * 4) {
			n = map(noise(p_, s, off), 0, 1, -1, 1) * 5;
			y = n;
		}
		if (p % tic == 0) curveVertex(x, y);
		p++;
	}
	endShape(CLOSE);
	popMatrix();
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
	if (frameCount > TWO_PI / rate) exit();
}
void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/" + folderName + "/" + fileName);
		break;
	}
}
void sig(int d, String prompt, boolean bg, int textCol, int bgCol) {
	String txt = "#genuary" + d + " // " + prompt + " // @helainebach";
	int n = txt.length();
	if (bg) {
		fill(palette[bgCol]);
		stroke(palette[bgCol]);
		strokeWeight(10);
		rectMode(CORNER);
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}