import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
PImage 	img;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 24;
//
void setup() {
	size(1080, 1080);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	img 		= loadImage("../../../0_data/photo/coral.png");
	img.resize(width, height);
}
void draw() {
	background(palette[1]);
	stroke(palette[4]);
	strokeWeight(3);
	grid(108);
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	// record();
}
void grid(int count) {
	int cell = width / count;
	int area = count * (height / cell);
	pushMatrix();
	translate(cell, cell);
	for (int n 	= 0; n < area; n++) {
		int  x 	= (n % count) * cell;
		int  y 	= (n / count) * cell;
		color col 	 = img.get(x, y);
		float bright = int(brightness(col) - 20);
		if (x < width - cell && y < height - cell) {
			cross(x, y, map(bright, 255, 1, 0, (cell / 2) * (sqrt(2))));
		}
	}
	popMatrix();
}
void cross(float x, float y, float u) {
	pushMatrix();
	translate(x, y);
	line(-u, -u, u, u);
	line(-u, u, u, -u);
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
		rectMode(CORNER);
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}