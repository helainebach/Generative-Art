// Tool to discover new truchet pattern arrangements

int a = 4; // Change fidelity of pattern (size of array)

//CONTROLS
	// click : change random output
	// s 	 : tile appearance
	// p 	 : save image and print array
//

import 	java.text.SimpleDateFormat;
import 	java.util.Date;
PShape 	t;
int 	r;
PFont 	font;
boolean tileStyle = true;
int[][] tileArray = new int[a][a];
//
void setup() {
	size(600, 700);
	font = createFont("../../../0_data/fonts/Gotham-Bold 2.otf", 32);
	textFont(font, 70 / tileArray.length - 10);
	textAlign(CENTER, CENTER);
}
void draw() {
	randomSeed(r);
	for (int i = 0; i < tileArray.length; i++) {
		for (int j = 0; j < tileArray.length; j++) {
			tileArray[i][j] = (int)random(4);
		}
	}
	background(255);
	//
	pushMatrix();
	translate(37, 135);
	scale(.88);
	grid(12);
	popMatrix();
	//
	pushMatrix();
	scale(1.12);
	translate(35, 25);
	guides();
	popMatrix();
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x   = (n % count);
		int y   = (n / count);
		int dir = tileArray[(int)y % tileArray.length][(int)x % tileArray.length];
		if (tileStyle == true) {
			tile1(x * cell + cell / 2, y * cell + cell / 2, (int)width / count + 1, dir);
		} else {
			tile2(x * cell + cell / 2, y * cell + cell / 2, (int)width / count + 1, dir);
		}
	}
	rectMode(CORNER);
	noFill();
	strokeWeight(2);
	stroke(0);
	rect(0, 0, cell * count, cell * count);
	stroke(255, 0, 0);
	strokeWeight(3);
	rect(0, 0, cell * tileArray.length, cell * tileArray.length);
	strokeWeight(2);
}
void guides() {
	guideGrid(tileArray.length, 2, 70 / tileArray.length);
	translate(80, 0);
	guideGrid(tileArray.length, 1, 70 / tileArray.length);
	pushMatrix();
	translate(115, 35);
	for (int i = 0; i < 4; i++) {
		if (tileStyle == true) {
			tile1(i * 80, 0, 70, i);
		} else {
			tile2(i * 80, 0, 70, i);
		}
		noFill();
		stroke(0);
		strokeWeight(2);
		square(i * 80, 0, 70);
	}
	popMatrix();
}
void tile1(float x, float y, float s, float r) {
	fill(0);
	noStroke();
	pushMatrix();
	translate(x, y);
	rotate((PI / 2) * r);
	beginShape();
	vertex(-s / 2 , -s / 2);
	vertex(-s / 2 , s / 2);
	vertex(s / 2 , s / 2);
	endShape(CLOSE);
	popMatrix();
}
void tile2(float x, float y, float s, float r) {
	stroke(0);
	noFill();
	strokeWeight(5);
	pushMatrix();
	translate(x, y);
	rotate((PI / 2) * r);
	strokeCap(SQUARE);
	arc(-s / 2, -s / 2, s, s, 0, PI / 2);
	arc(s / 2, s / 2, s, s, PI, PI + PI / 2);
	popMatrix();
	fill(0);
}
void guideGrid(int count, int p, float cell) {
	int area = count * count;
	for (int n = 0; n < area; n++) {
		int x   = (n % count);
		int y   = (n / count);
		int dir = tileArray[(int)y % tileArray.length][(int)x % tileArray.length];
		if (p == 1) {
			numberGuide(x * cell + cell / 2, y * cell + cell / 2, cell, dir);
		} else {
			arrowGuide(x * cell + cell / 2, y * cell + cell / 2, cell, dir);
		}
	}
}
void arrowGuide(float x, float y, float s, float r) {
	pushMatrix();
	translate(x, y);
	rotate((PI / 2) * r);
	text(">", s * -.05, s * -.01);
	rectMode(CENTER);
	noFill();
	stroke(0);
	square(0, 0, s);
	popMatrix();
}
void numberGuide(float x, float y, float s, float r) {
	pushMatrix();
	translate(x, y);
	text((int)r, 0, s * -.01);
	noFill();
	stroke(0);
	rectMode(CENTER);
	square(0, 0, s);
	popMatrix();
}
void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/" + fileName);
		for (int x = 0; x < tileArray.length; x++) {
			for (int y = 0; y < tileArray.length; y++) {
				System.out.printf("%2d", tileArray[x][y]);
			}
			System.out.println();
		}
		break;
	case 's':
		if (tileStyle) {
			tileStyle = false;
		} else {
			tileStyle = true;
		}
		break;
	}
}
void mousePressed() {r += 100;}

//Cool Arrays

// 2 2 0 2 2
// 3 3 1 0 2
// 2 0 2 3 1
// 1 3 3 0 1
// 2 3 0 1 3

 // 2 2 2 3 3 3
 // 1 1 3 3 3 0
 // 2 1 0 1 1 1
 // 3 2 3 2 1 0
 // 0 1 3 2 2 0
 // 0 0 2 2 2 0

 // 2 1 0 1
 // 3 2 3 0
 // 0 1 0 1
 // 3 0 0 2