import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
int 	x,y, cell, col;
int 	offset;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 1;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	noLoop();
}
void draw() {
	grid(6);
	rectMode(CORNER);
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	off += rate;
	// record();
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
	if (frameCount > TWO_PI / rate) exit();
}
void keyPressed() {
	switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/" + folderName+"/"+fileName);
		redraw();
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

void grid(int count){
	int area = count*count;
	cell = width/count;
	for (int n = 0; n <= area; n++) {
		offset = cell/2;
		x = (n%count)*cell+offset;
		y = (n/count)*cell+offset;
		noStroke();
		col = (int)random(palette.length);
		fill(palette[col]);
		rectMode(CENTER);
		square(x,y,cell);
		shape((int)random(1,8),col);
		// shape(2, col);
	}
}
void shape (int r, int notC){
	float scl = .75;
	while (col == notC) {
		col = (int)random(palette.length);
	}
	fill(palette[col]);
	switch(r) {
		case 1: 
		circle(x,y,cell*scl);
		break;
		case 2: 
		square(x,y,cell*scl);
		break;
		case 3: 
		pushMatrix();
		translate(x,y);
		rotate(radians(45));
		square(0,0,cell*.6);
		popMatrix();
		break;
		case 4: 
		ellipse(x,y,cell/2,cell*scl);
		break;
		case 5: 
		ellipse(x,y,cell*scl,cell/2);
		break;
		case 6: 
		pushMatrix();
		translate(x,y);
		triangle(0,-offset*scl, offset*scl,offset*scl, -offset*scl,offset*scl);
		popMatrix();
		break;
		case 7: 
		pushMatrix();
		translate(x,y);
		rotate(PI);
		triangle(0,-offset*scl, offset*scl,offset*scl, -offset*scl,offset*scl);
		popMatrix();
		break;
	}
}