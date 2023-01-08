import 	java.text.SimpleDateFormat;
import 	java.util.Date;
import 	processing.pdf.*;
String 	pathDATA = "../../../0_data/";
String 	pathDATA2 	= "../../../0_data/svg/truchet/";

String 	fileName;
String 	folderName;
boolean guides 		= true;
PShape 	t;
PFont 	font;
float 	cell;
String 	path;
File[] 	files;
Table 	prompts;
int 	TN;
// Stuff to Change
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
int 	day 	 = 5;
color 	bg 			= palette[1];
color 	fg 			= palette[2];
int 	count 		= 7;
float 	strokeW 	= 2;
boolean stroke 		= true;
boolean record 		= true; // Export to PDF
int[][] tileArray = {
	{(int)random(4), (int)random(4)},
	{(int)random(4), (int)random(4)}
};
//
void setup() {
	noLoop();
	prompts = loadTable("../../prompts.csv", "header");
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	path 	 = sketchPath(pathDATA2);
	files 	 = listFiles(path);
	cell 	 = width / count;
	if (record) beginRecord(PDF, "../exports/" + fileName);

	//
	size(700, 700);
}
void draw() {
	TN 		 = (int)random(1,files.length+1);
	for (int i = 0; i < 2; i++) {
  		for (int j = 0; j < 2; j++) {
   			 tileArray[i][j] = int(random(4));
  		}
	}
	t = loadShape(pathDATA2 + TN + ".svg");
	background(bg);
	//
	for (float x = cell / 2; x < width; x += cell) {
		for (float y = cell / 2; y < height; y += cell) {
			float nX = x / cell;
			float nY = y / cell;
			float dir = tileArray[(int)nY % tileArray.length][(int)nX % tileArray.length];
			//
			if (stroke) {
				noFill();
				stroke(fg);
				strokeWeight(strokeW);
				strokeCap(PROJECT);
			} else {
				noStroke();
				fill(fg);
			}
			tile(x, y, cell, (int)dir);
		}
	}
	endRecord();
	if (guides) grid(count);
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
}
void tile(float x, float y, float s, int r) {
	pushMatrix();
	translate(x, y);
	rotate(HALF_PI * r);
	shapeMode(CENTER);
	t.disableStyle();
	shape(t, 0, 0, s, s);
	if (guides) guide();
	popMatrix();
}
// GUIDES //
void guide() {
	textAlign(CENTER, CENTER);
	fill(palette[3]);
	textFont(font, 32);
	text(">", 0, -8);
}
void grid(int cell) {
	for (int x = width / cell; x < width; x = x + width / cell) {
		for (int y = width / cell; y < height; y = y + width / cell) {
			strokeWeight(2);
			stroke(palette[3]);
			line(x, 0, x, height);
			line(0, y, width, y);
		}
	}
}
void mousePressed() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
	saveFrame("../exports/" + folderName+"/"+fileName);
	redraw();
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