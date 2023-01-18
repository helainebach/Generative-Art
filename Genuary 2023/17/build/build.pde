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
int 	day 	 = 17;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");

}
void draw() {
	frameRate(2);
	background(palette[0]);
	drawSquare(0, 0, width, 6);
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	record();
}

void drawSquare(float x, float y, float s, int l) {
	fill(palette[(int)random(1, palette.length)]);
	strokeWeight(10);
	square(x, y, s);
	if (l > 1) {
		l--;
		float r = random(1);
		if (r > .5) {
			s = s * .5;
			pushMatrix();
			drawSquare(x, y, s, l);
			drawSquare(x + s, y, s, l);
			drawSquare(x, y + s, s, l);
			drawSquare(x + s, y + s, s, l);
			popMatrix();
		} else {
			drawSquare(x, y, s, l);

		}
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
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}