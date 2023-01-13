import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
float 	off 	 = PI;
float   rate 	 = PI / 150;
int 	day 	 = 11;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	// noLoop();
}
void draw() {
	frameRate(3);
	background(palette[3]);
	pushMatrix();
	translate(width / 2, height / 20);
	for (int i = 1; i < 9; ++i) {
		rectMode(CENTER);
		noStroke();
		fill(palette[(int)random(3)]);
		wrongRect(0, width / 10 * i, width / 3 * 2, width / 20, width / 40);
		if (i % 2 == 0) {
			fill(palette[4]);
			circle(random(-width / 3, width / 3), width / 10 * i + (int)random(-3, 3), random(width / 20, width / 3));
		}
	}
	popMatrix();
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	record();
}
void wrongRect(float x, float y, float w, float h, float o) {
	beginShape();
	vertex(x - w / 2 + random(-o, o), y - h / 2 + random(-o, o));
	vertex(x + w / 2 + random(-o, o), y - h / 2 + random(-o, o));
	vertex(x + w / 2 + random(-o, o), y + h / 2 + random(-o, o));
	vertex(x - w / 2 + random(-o, o), y + h / 2 + random(-o, o));
	endShape(CLOSE);
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
		redraw();
		break;
	case 'n':
		redraw();
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