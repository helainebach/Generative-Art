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
int 	day 	 = 19;
int 	i = 0;
int 	j = 0;
int 	cell, count, area;
PVector[] l;
PImage  img;
IntList order;
//
void setup() {
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	img 		= loadImage(pathDATA + "/photo/oldfam.png"); img.resize(width, height);
	//
	size(1080, 1080);
	//
	cell 		= 20;
	count 		= width / cell;
	area 		= count * count;
	order 		= new IntList();
	l 			= new PVector[area];
	for (int n 	= 0; n < area; n++) {
		l[n] = new PVector((n % count) * cell, (n / count) * cell);
		color c = img.get((int)l[n].x, (int)l[n].y);
		order.append((int)brightness(c));
	}
}
void swap(IntList arr, int j, int a, int b) {
	int temp = a;
	arr.set(j, b);
	arr.set(j + 1, temp);
}
void draw() {
	if (i < order.size()) {
		for (int j = 0; j < order.size() - i - 1; j++) {
			int a = order.get(j);
			int b = order.get(j + 1);
			if (a > b) {
				swap(order, j, a, b);
			}
		}
		record();
	} else {
		noLoop();
		exit();
	}
	i++;
	for (int i = 0; i < area; i++) {
		int n = order.get(i);
		fill(lerpColor(palette[0], palette[1], map(n, 100, 255, 0, 1)));
		noStroke();
		square((int)l[i].x, (int)l[i].y, cell);
	}
	blendMode(REPLACE);
	sig(day, prompts.getString(day - 1, 0), true, 0, 1);
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
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