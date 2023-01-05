import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
float 	n;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 4;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	ellipseMode(CORNER);
}
void draw() {
	bg();
	blendMode(MULTIPLY);
	for (int i = 1; i <= 4; ++i) {
		satellite(i, i, PI/2*i);
	}
	blendMode(REPLACE);
	sig(day, prompts.getString(day - 1, 0), false, 0, 0);
	off += rate;
	record();
}
void satellite(int c, int r, float s) {
	fill(palette[c]);
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(s + off * r);
	n = (float)(width / 2 * Math.sqrt(2)) / 2;
	n = n - width / 4;
	n = n * n;
	n = n / 2;
	n = (float)Math.sqrt(n);
	ellipse(-n, -n, width / 2, height / 2);
	popMatrix();
}
void bg() {
	noStroke();
	background(palette[1]);
	fill(palette[1]);
	rect(0, 0, width / 2, height / 2);
	fill(palette[2]);
	rect(0, height / 2, width / 2, height / 2);
	fill(palette[3]);
	rect(width / 2, 0, width / 2, height / 2);
	fill(palette[4]);
	rect(width / 2, height / 2, width / 2, height / 2);
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
void mousePressed() {
	println(mouseX, mouseY);
}
void sig(int d, String prompt, boolean bg, int textCol, int bgCol) {
	String txt = "#genuary" + d + " // " + prompt + " // @helainebach";
	int n = txt.length();
	if (bg) {
		fill(palette[bgCol]);
		stroke(palette[bgCol]);
		strokeWeight(10);
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}