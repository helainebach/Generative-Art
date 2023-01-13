import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
PImage  img;
float 	cell;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 1;
//
void setup() {
	size(1080, 1080);
	cell 		= width / 12;
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
}
void draw() {
	background(palette[1]);
	for (float y = -cell; y < height + cell; y = y + cell / 2) {
		for (float x = -cell; x < width + cell; x = x + cell / 2) {
			piece(x, y, cell / 4);
		}
	}
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	// off += rate;
	// record();
}
void piece(float x, float y, float c) {
	pushMatrix();
	translate(x, y);
	if (x * y % 2 == 0) {
		rotate(PI / 2);
	}
	for (int n = 0; n < 16; n++) {
		float cx = (n % 4) * c;
		float cy = (n / 4) * c;
		int col = (1 + Math.abs((int)x * (int)y)) % (palette.length - 1);
		// int col = n%palette.length;

		fill(palette[col]);
		// strokeWeight(1);
		noStroke();
		switch (n) {
		// case 0 : square(cx, cy, c);
		// case 1 : square(cx, cy, c);
		// case 2 : square(cx, cy, c);
		case 3 : square(cx, cy, c);

		// case 4 : square(cx, cy, c);
		case 5 : square(cx, cy, c);
		case 6 : square(cx, cy, c);
		// case 7 : square(cx, cy, c);

		// case 8 : square(cx, cy, c);
		case 9 : square(cx, cy, c);
		case 10 : square(cx, cy, c);
		case 11 : square(cx, cy, c);


		case 12 : square(cx, cy, c);
		// case 13 : square(cx, cy, c);
		case 14 : square(cx, cy, c);
		case 15 : square(cx, cy, c);
		}
		noFill();
		strokeWeight(2);
		stroke(palette[4]);
		rect(0, 0, cell, cell);
	}
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