import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts, words;
String  folderName;
PFont 	font;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 28;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	words = loadTable("poetic words.csv", "header");
	// noLoop();
	textFont(font);
}
void draw() {
	frameRate(3);
	background(palette[0]);
	dotGrid(108 / 2, 1, palette[2]);
	fill(palette[0]);
	for (int i = 0; i < 23; i++) {
		// randomSeed(i*1000);
		textAlign(LEFT, BOTTOM);
		fill(palette[(int)random(palette.length)]);
		text(line(), (int)random(1, 5) * 100, 100 + (i * 40));
	}
	sig(day, prompts.getString(day - 1, 0), true, 0, 2);
	off += rate;
	record();
}
void dotGrid(int count, int dotSize, color c) {
	int cell = width / count;
	int area = count * (height / cell);
	pushMatrix();
	translate(cell, cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		if (x < width - cell && y < height - cell) {
			stroke(c);
			strokeWeight(dotSize);
			point(x, y);
		}
	}
	popMatrix();
}
String line() {
	int adjNum1 = (int)random(10);
	int adjNum2 = (int)random(10);
	while (adjNum2 == adjNum1) {
		adjNum2 = (int)random(10);
	}
	int pNounNum1 = (int)random(10);
	int pNounNum2 = (int)random(10);
	while (pNounNum2 == pNounNum1) {
		pNounNum2 = (int)random(10);
	}
	String[] word = new String[7];
	word[0]	= words.getString(adjNum1, 0);
	word[1]	= words.getString(pNounNum1, 1);
	word[2]	= words.getString((int)random(10), 2);
	word[3]	= words.getString((int)random(10), 3);
	word[4]	= words.getString((int)random(10), 4);
	word[5]	= words.getString(adjNum2, 0);
	word[6]	= words.getString(pNounNum2, 1);
	String line = join(word, " ");
	return line;
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
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}