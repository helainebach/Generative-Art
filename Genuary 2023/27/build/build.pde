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
int 	day 	 = 27;
PGraphics flower, pieColor;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	pieColor = createGraphics(width, height);
	flower = createGraphics(width, height);
	pieColor.beginDraw();
	pie(width / 2, height / 2, width / 3, 8);
	pieColor.endDraw();
	flower.beginDraw();
	flower.stroke(palette[0]);
	flower.strokeWeight(15);
	rose1(width / 2, height / 2, 4, 1, width / 3);
	flower.endDraw();
	pieColor.mask(flower);
}
void draw() {
	background(palette[4]);
	stroke(palette[2]);
	fill(palette[3]);
	strokeWeight(20);
	circle(width / 2, height / 2, width / 3 * 2 + 50);
	noStroke();
	fill(palette[1]);
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(PI / 8);
	rose(0,0, 4, 2, width / 3 - 50);

	rotate(PI / 4);
	rose(0,0, 4, 2, width / 3 - 50);
	popMatrix();
	image(flower, 0, 0);
	image(pieColor, 0, 0);
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	// record();
}
void rose1(float px, float py, float n, float d, float rad) {
	flower.pushMatrix();
	flower.translate(px, py);
	float k = n / d;
	flower.beginShape();
	for (float a = 0; a < TWO_PI * d; a += .01) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		flower.vertex(x, y);
	}
	flower.endShape(OPEN);
	flower.popMatrix();
}
void rose(float px, float py, float n, float d, float rad) {
	// pushMatrix();
	// translate(px, py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI * d; a += .01) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x, y);
	}
	endShape(OPEN);
	// popMatrix();
}
void pie(float px, float py, float rad, int n) {
	float a    = TWO_PI / n;
	float inc  = a / 2;
	for (int i = 0; i < n; i++) {
		pieColor.noStroke();
		pieColor.fill(palette[2 + (i % (palette.length - 2))]);
		pieColor.arc(px, py, rad * 2, rad * 2, inc, inc + a, PIE);
		inc = inc + a;
	}
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