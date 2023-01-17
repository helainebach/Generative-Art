import java.text.SimpleDateFormat;
import java.util.Date;
import java.lang.*;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	pathDATA = "../../../0_data/";
Table 	prompts;
String  folderName;
PFont 	font;
int 	count;
int 	cell;
int 	area;
float 	scl = .85;
float 	off 	 = 0;
float   rate 	 = PI / 150;
int 	day 	 = 14;
String[]lines;
String [] alph = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
String [] chars = {"┘","└","┌", "═","─","┤","╧","╬","═","╝"};
String 	pageText, leftPageText, rightPageText;
//
void setup() {
	size(1080, 1080);
	folderName	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font     	= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts  	= loadTable("../../prompts.csv", "header");
	lines    	= loadStrings("text.txt");	
	pageText 	= lines[0];
	leftPageText = pageText;
	count = 20;
	cell = width / 2 / count;


}
void draw() {
	background(palette[0]);
	textAlign(LEFT,BOTTOM);
	textSize(17);
	textLeading(cell);

	pushMatrix();
	translate(0,50);

	pushMatrix();
	translate(width/2,height*(1-(scl*scl))/2);
	scale(scl);

	page();
	rightPage();
	scale(-1, 1);
	page();

	popMatrix();

	leftPage();
	popMatrix();

	sig(day, prompts.getString(day - 1, 0), true, 1, 3);
}
void leftPage(){
	pushMatrix();
	translate(width*(1-scl)/2,height*(1-(scl*scl))/2);
	scale(scl);
	text(leftPageText,2*cell,2*cell,15*cell,25*cell);
	popMatrix();
}
void rightPage(){
	String temp = pageText;
	for (int c = 0; c < alph.length; c++) {
		pageText = temp.replaceAll(alph[c],chars[c%chars.length]);
		temp = pageText;
	}
	String rightPageText = temp;
	text(rightPageText,width*(1-scl)/2,2*cell,15*cell,25*cell);
}
void page(){
	float h = height*(scl*scl);
	area = count * ((int)h / cell);
	translate(width/50,0);
	stroke(palette[2]);
	strokeWeight(h/count/3);
	fill(palette[1]);
	rect(0, 0, width/2, h);
	pushMatrix();
	translate(cell, cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		if (x < (width/2) - cell && y < h - cell) {
			stroke(palette[4]);
			strokeWeight(3);
			point(x, y);
		}
	}
	popMatrix();
	pushMatrix();
	translate(h/count/2,h/count-(count/2));
	for (float i = 0; i < h-(h/count); i=i+h/count) {
		fill(palette[0]);
		noStroke();
		rect(0,i,h/(count*2), h/(count*2));
		stroke(palette[3]);
		strokeWeight(h/(count*2)/3);
		line(h/(count*4),i+h/(count*4),-h/count,i+h/(count*4));
	}

	popMatrix();
}
void keyPressed() {
	switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/" + folderName+"/"+fileName);
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