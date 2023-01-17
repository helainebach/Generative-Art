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
int 	day 	 = 15;
//
void setup() {
	frameRate(30);
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	background(palette[1]);
}
void draw() {
	float x = width/2+sin(off/4)*width/3;
	float y = height/2+sin(off)*height/4;
	float w = map(Math.abs(sin(off)),0,1,20,5);
	color c = lerpColor(palette[4],palette[2],Math.abs(sin(off)));
	if(frameCount > TWO_PI*4 / rate) {
		strokeWeight(w+2);
		stroke(palette[1]);
	}else{
		strokeWeight(w);
		stroke(c);
	}

	if (frameCount%5==0) point(x,y);
	grid(20);
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	record();
}

void grid(int count){
	int area = count*count;
	int cell = width/count;
	for (int n = 0; n < area; n++) {
		int x = (n%count)*cell;
		int y = (n/count)*cell;
		stroke(palette[4]);
		noFill();
		strokeWeight(1);
		square(x,y,cell);
	}
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
	if (frameCount > TWO_PI*8 / rate) exit();
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