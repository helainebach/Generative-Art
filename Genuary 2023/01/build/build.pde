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
int 	day 	 = 1;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	bg();
	satellite();
	sig(day, prompts.getString(day - 1, 0), true, 0, 2);
	record();
}
void bg() {
	//background
	background(palette[4]);
	fill(palette[0]);
	noStroke();
	triangle(0, 0, 0, height, width, height);
	//circle guide
	stroke(palette[1]);
	strokeWeight(30);
	noFill();
	circle(width / 2, height / 2, width * .75);
}
void satellite() {
	//place dot
	PVector pos = new PVector (sin(off), cos(off));
	color col = lerpColor(palette[2], palette[3], Math.abs(pos.x));
	float d = map(Math.abs(pos.y), 0, 1, 30, 180);
	pos.mult(width * .75 / 2);
	pos.add(width / 2, height / 2);
	//line
	if (off % TWO_PI > PI / 4 && off % TWO_PI < 5 * PI / 4) {
		stroke(palette[0]);
	} else {
		stroke(palette[4]);
	}
	strokeWeight(3);
	line(width / 2, height / 2, pos.x, pos.y);
	//center dot
	noStroke();
	fill(palette[1]);
	circle(width / 2, height / 2, 30);
	//show dot
	fill(col);
	circle(pos.x, pos.y, d);
	//move dot
	off += rate;
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
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}