import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
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
	int count = 10;
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell + cell / 2;
		int y = (n / count) * cell + cell / 2;
		// Squares
		rectMode(CENTER);
		stroke(palette[4]);
		strokeWeight(4);
		noFill();
		square(x, y, cell);
		// Triangles
		pushMatrix();
		translate(x, y);
		if (n % 3 == 0)rotate(PI);
		if (n % 4 == 0)rotate(PI / 2);
		if (n % 3 == 0) {
			fill(palette[0]);
		} else {
			fill(palette[2]);
		}
		noStroke();
		eTri(0, 0, cell * .9);
		popMatrix();
	}

	stroke(palette[4]);
	strokeWeight(4);
	square(width / 2, height / 2, width / 5 * 3);
	fill(palette[1]);
	eTri(width / 2, height / 2, width / 5 * 3*.9);
	sig(day, prompts.getString(day - 1, 0), true, 0, 4);
}
void eTri(float x, float y, float r) {
	r = hypo(r * 2 / 5, r * 2 / 5);
	pushMatrix();
	translate(x, y + r / 4);
	float[][] triPoints = {
		{sin((5 * PI) / 3) * r, cos((5 * PI) / 3) * r},
		{sin(PI) * r, cos(PI) * r},
		{sin(PI / 3) * r, cos(PI / 3) * r}
	};
	triangle(
		triPoints[0][0], triPoints[0][1], 
		triPoints[1][0], triPoints[1][1], 
		triPoints[2][0], triPoints[2][1]
		);
	popMatrix();
}
float hypo(float a, float b) {
	double c = Math.sqrt((a * a) + (b * b));
	return (float)c;
}
void guides () {
	stroke(palette[4]);
	strokeWeight(1);
	noFill();
	grid(40);
	// polarGrid(10, 36);
	// coordinates();
	fill(palette[1], 150);
	rectMode(CORNER);
	noStroke();
	square(0, 0, width);
}
void coordinates() {
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
		if (i % 9 == 0) {
			stroke(palette[3]);
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