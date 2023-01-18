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
int 	day 	 = 16;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	bg();
	pushMatrix();
	translate(width / 2, height / 2);
	for (int x = 0; x < width / 2; x += width / 10) {
		for (int y = 0; y < height / 2; y += height / 10) {
			rectMode(CENTER);
			fill(palette[((int)off+x) % palette.length]);
			stroke(palette[((int)off+y) % palette.length]);
			float s = map(x + y, 0, width, width / 15, 10);
			if ((y + x) % 5 == 0) {
				circle(x, y, s);
				circle(-x, -y, s);
				circle(x, -y, s);
				circle(-x, y, s);
			} else {
				square(x, y, s);
				square(-x, -y, s);
				square(x, -y, s);
				square(-x, y, s);
			}
		}
	}
	popMatrix();
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	// record();
}
void bg() {
	background(palette[2]);
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