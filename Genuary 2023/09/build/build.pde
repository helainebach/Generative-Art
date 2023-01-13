import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
float 	off 	 = 0;
float   rate 	 = PI / 200;
int 	day 	 = 9;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	background(palette[1]);
}
void draw() {
	// fill(palette[1],50);
	// rect(0, 0, width, height);
	stroke(palette[1]);
	strokeWeight(1);
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(off*2);
	// rose(0, 0, map(Math.abs(sin(off)), 0, 1, 1, 7), map(Math.abs(cos(off)), 0, 1, 1, 9), width * .4);
	color col = lerpColor(palette[4],palette[2],Math.abs(cos(off)));
	fill(col,20);
	rose(0, 0, 7,4, width * Math.abs(map(sin(off),0,1,.01,.4)));
	popMatrix();
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	record();
}
void rose(float px, float py, float n, float d, float rad) {
	pushMatrix();
	translate(px, py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI * d; a += .05) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x, y);
	}
	endShape(OPEN);
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
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}