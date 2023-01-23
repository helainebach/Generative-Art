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
int 	day 	 = 21;
int 	count 	 = 25;
int[][] myArray = new int[(int)Math.floor(count / 2)][count + 1];
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	// noLoop();
}
void draw() {
	// frameRate(3);
	for (int i = 0; i < (int)Math.floor(count / 2); ++i) {
		for (int j = 0; j < count + 1; j++) {
			// myArray[i][j] = (int)random(2);
			myArray[i][j] = (int)Math.floor(noise(off,i, j) * 2);
			println(myArray[i][j]);
		}
	}
	background(palette[0]);
	noFill();
	strokeWeight(24);
	stroke(palette[2]);
	lines();
	strokeWeight(8);
	stroke(palette[3]);
	lines();
	sig(day, prompts.getString(day - 1, 0), true, 0, 1);
	off += rate;
// record();
}
void lines() {
	for (int x = 0; x < (int)Math.floor(count / 2); x++) {
		beginShape();
		for (int y = 0; y < count + 1; y ++) {
			vertex((x * (width / count * 2)) + (width / count * (myArray[x][y])) + width / count, y * (height / count));
		}
		endShape();
		beginShape();
		for (int y_ = 0; y_ < count + 1; y_ ++) {
			myArray[x][y_] = (myArray[x][y_] - 1) * -1;
			vertex((x * (width / count * 2)) + (width / count * (myArray[x][y_])) + width / count, y_ * (height / count));
		}
		endShape();
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