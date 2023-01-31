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
int 	day 	 = 31;
PImage  []images  = new PImage[30];
int count = 6;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	for (int i = 0; i < images.length; i ++ ) {
		images[i] = loadImage(i + 1 + ".png" );
		images[i].resize(width / count, width / count);
	}
}
void draw() {
	background(palette[2]);
	int area = count * count;
	int cell = width / count;
	for (int h = 0; h <= height / count; h++) {
		for (int n = 0; n < images.length; n++) {
			int x = (width / 30) * n;
			int y = height / count * h;
			if (n % 2 == 0) {
				copy(images[n], (width / 30) * h, 0, width / 30, width / count, x, y, width / images.length, width / count);
			} else {
				copy(images[n], (width / 30) * h, 0, width / 30, width / count, x, y + height / count, width / images.length, width / count);
			}
		}
	}
	sig(day, prompts.getString(day - 1, 0), true, 2, 0);
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