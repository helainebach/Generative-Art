import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
float 	off 	= 0;
float   rate 	= PI/10;
int 	day 	= 3;
//
int 	h 		= 10;
int 	gutter 	= 300;
double  gutterW = Math.sqrt((gutter / 2 * gutter / 2) + (gutter / 2 * gutter / 2));
float 	hoff, n;
//
void setup() {
	size(1080, 1080);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	frameRate(1);
}
void draw() {
	background(palette[1]);
	noStroke();
	rectMode(CENTER);
	// Yellow Layer
	pushMatrix();
	translate(h / 2, 0);
	for (int i = 0; i < width / h; i++) {
		n 	 = noise(i, off) * i / 15;
		hoff = map(n, 0, 1, h, h * 50);
		fill(palette[2]);
		if (i % 9 != 0) {
			rect(0, 0, h, hoff);
		}
		translate(h, h);
	}
	popMatrix();
	// Orange Layer
	pushMatrix();
	translate(0, h / 2);
	for (int i = 0; i < height / h; i++) {
		noiseSeed(100);
		n 	 = noise(i, off);
		hoff = map(n, 0, 1, h, h * width / h * 2);
		fill(palette[3]);
		rectMode(CENTER);
		if (i % 2 == 0) {
			rect(0, 0, hoff, h);
		}
		translate(h, h);
	}
	popMatrix();
	// Gutter
	stroke(palette[1]);
	strokeWeight(gutter);
	line(0, 0, width, height);
	noStroke();
	// Left Purple
	pushMatrix();
	translate(-(float)gutterW + h / 2, h / 2);
	for (int i = 0; i < height / h; i++) {
		fill(palette[4]);
		rect(0, 0, h, h);
		translate(h, h);
	}
	popMatrix();
	// Right Purple
	pushMatrix();
	translate((float)gutterW + h / 2, h / 2);
	for (int i = 0; i < height / h; i++) {
		fill(palette[4]);
		rect(0, 0, h, h);
		translate(h, h);
	}
	popMatrix();
	//
	off += rate;
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	record();
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