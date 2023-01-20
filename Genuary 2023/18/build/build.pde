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
int 	day 	 = 18;
int   	count 	 = 10;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	background(palette[0]);
	for (int x = width/count/2; x < width; x+=width/count) {
		for (int y = height/count/2; y < height; y+=height/count) {
			rectMode(CENTER);
			fill(palette[2]);
			float xoff = width/count-noise(off,y,x)*width/count*2;
			float yoff = height/count-noise(off,x,y)*height/count*2;
			stroke(palette[1]);
			strokeWeight(1);
			square(x+xoff,y+yoff,width/count*.7);
			dashedSquare(x,y,width/count*.7,15);
		}	
	}
	sig(day, prompts.getString(day - 1, 0), true, 3, 1);
	off += rate;
	record();
}
void dashedSquare(float x, float y, float s, int seg){
	pushMatrix();
	translate(x-s/2,y-s/2);
	int d = (int)s/seg;
	for (int i = 0; i < s; i++) {
		if ((int)(i/d)%2==0) {
			stroke(palette[1]);
			strokeWeight(1);
		}else{
			noStroke();
		}
		point(i,0);
		point(i,s);
		point(0,i);
		point(s,i);
	}
	popMatrix();
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