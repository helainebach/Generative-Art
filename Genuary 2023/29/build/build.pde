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
int 	day 	 = 29;
int 	u 		 = 20;
//
void setup() {
	size(1080, 1080);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	noLoop();
}
void draw() {
	frameRate(6);
	bg();
	strokeWeight(u);
	noFill();
	for (int i = 1; i < width / u; i++) {
		stroke(palette[(frameCount + i) % palette.length]);
		circle(width / 2, height / 2, u + (u * 6) * i);
	}
	for (int i = 0; i < 200; i++) {
		pushMatrix();
		translate(u * (int)random(width / u), u * (int)random(height / u));
		piece();
		popMatrix();
	}
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	// record();
}
void bg() {
	background(palette[1]);
	for (int x = 0; x < width / u; x++) {
		for (int y = 0; y < height / u; y++) {
			fill(palette[4]);
			noStroke();
			circle(u / 2 + x * u, u / 2 + y * u, u / 2);
		}
	}
	for (int i = 0; i < 750; i++) {
		pushMatrix();
		translate(u * (int)random(width / u), u * (int)random(height / u));
		piece();
		popMatrix();
	}
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
	if (frameCount > TWO_PI / rate) exit();
}
void piece () {
	PVector a = new PVector((int)random(1, 5), (int)random(1, 5), (int)random(palette.length - 1));
	stroke(palette[0]);
	strokeWeight(2);
	fill(palette[1 + (int)a.z]);
	rect(0, 0, u * a.x, u * a.y);
	for (int x = 0; x < a.x; x++) {
		for (int y = 0; y < a.y; y++) {
			fill(palette[0]);
			circle(u / 2 + x * u, u / 2 + y * u, u / 2);
		}
	}
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