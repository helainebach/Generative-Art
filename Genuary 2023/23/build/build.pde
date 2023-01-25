import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 23;
int[] r = new int[4];
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	rands(4);
}
void draw() {
	background(palette[1]);
	pushMatrix();
	translate(width / 2, height / 2);
	for (int i = 0; i < 4; ++i) {
		rands(i);
		cone();
	}
	popMatrix();
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	record();
}
void rands(int seed) {
	randomSeed(seed);
	for (int i = 0; i < r.length; i++) {
		r[i] = (int)random(-4, 4);
		if (r[i] == 0) {
			r[i] = (int)random(-4, 4);
		}
	}
}
void cone() {
	for (int i = 1; i < 100; i++) {
		strokeWeight(1);
		stroke(lerpColor(palette[0], palette[1], map(i, 0, 100, 0, 1)));
		noFill();
		circle(i * sin(off * r[0]) * r[1], i * cos(off * r[2]) * r[3], (width / 100) * i);
	}
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
	if (frameCount > TWO_PI / rate) exit();
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