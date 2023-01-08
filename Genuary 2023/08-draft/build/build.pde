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
int 	day 	 = 8;
//
void setup() {
	size(1000, 1000);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	background(palette[1]);
	guides();
	stroke(palette[0]);
	noFill();
	float r = hypo(200, 200);
	rectMode(CENTER);
	square(width / 2, height / 2, r * 2);
	pushMatrix();
	translate(width / 2, height / 2 + r / 4);
	float[][] triPoints = {
		{sin((5 * PI) / 3) * r, cos((5 * PI) / 3) * r},
		{sin(PI) * r, cos(PI) * r},
		{sin(PI / 3) * r, cos(PI / 3) * r}
	};
	triangle(triPoints[0][0], triPoints[0][1], triPoints[1][0], triPoints[1][1], triPoints[2][0], triPoints[2][1]);
	for (int i = 0; i < 3; i++) {
		stroke(palette[2 + i]);
		strokeWeight(10);
		point(triPoints[i][0], triPoints[i][1]);
	}
	popMatrix();
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	// record();
}
float hypo(float a, float b) {
	double c = Math.sqrt((a * a) + (b * b));
	return (float)c;
}
void guides () {
	stroke(palette[4]);
	strokeWeight(1);
	noFill();
	grid(20);
	polarGrid(10, 36);
	pushMatrix();
	translate(mouseX - 10, mouseY - 10);
	PVector p = new PVector(mouseX, mouseY);
	if (p.x <= width / 2) {
		p.x = (width / 2 - p.x) * -1;
	} else {
		p.x = p.x - width / 2;
	}
	if (p.y <= height / 2) {
		p.y = height / 2 - p.y;
	} else {
		p.y = (p.y - height / 2) * -1;
	}
	fill(palette[0]);
	textAlign(RIGHT, BOTTOM);
	text(int(p.x) + "," + int(p.y), 0, 0);
	popMatrix();
	fill(palette[1], 150);
	rectMode(CORNER);
	noStroke();
	square(0, 0, width);
}
void polarGrid(float c, int s) {
	float d = (float) sqrt((width / 2) * (width / 2) + (width / 2) * (width / 2)) * 2;
	pushMatrix();
	translate(width / 2, height / 2);
	for (float j = 0; j <= c; j++) {
		circle(0, 0, (d / c) * j);
	}
	for (float i = 0; i < s; i++) {
		float a = map(i, 0, s, 0, TWO_PI);
		float x = sin(a) * d / 2;
		float y = cos(a) * d / 2;
		if (i == 6 || i == 18 || i == 30) {
			stroke(palette[0]);
		} else {
			stroke(palette[4]);
		}
		line(0, 0, x, y);
	}
	popMatrix();
}
void grid(int count) {
	int area = count * count;
	float cell = width / count;
	for (int n = 0; n < area; n++) {
		float x = (n % count) * cell;
		float y = (n / count) * cell;
		square(x, y, cell);
	}
}
///
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