import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
color col;
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
PImage  fargo;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 7;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	fargo = loadImage("Fargo.png");
	fargo.resize(width, height);
	grid();
}
void draw() {
	// bg();
	sig(day, prompts.getString(day - 1, 0), true, 1, 3);
	off += rate;
	// record();
}
void bg() {
	image(fargo, 0, 0);
}
void grid() {
	for (int n 	= 0; n < width * height; n++) {
		int  x 	= (n % width);
		int  y 	= (n / height);
		color fcol = fargo.get(x, y);
		int b = (int)brightness(fcol);
		if (b < 100) {
			col = palette[0];
		} else if (b > 200) {
			col = palette[1];
		} else {
			col = palette[3];
		}
		stroke(col);
		strokeWeight(1);
		point(x, y);
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