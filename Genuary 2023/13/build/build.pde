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
int 	day 	 = 13;
PImage  img;
int     count = 5;
PVector[] l = new PVector[(int)count*count];
IntList newOrder;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	img = loadImage("hes.png");
	img.resize(width,height);
	newOrder = new IntList();
	for (int n = 0; n < count*count; n++) {
		l[n]=new PVector(n%count* width/count, n/count*height/count);
		newOrder.append(n);
	}
}
void draw() {
	newOrder.shuffle();
	frameRate(3);
	background(palette[1]);
	for (int i = 0; i < count*count; i++) {
		// int oP = (int)random(count*count);
		int oP = newOrder.get(i);
		piece(oP,i);	
	}
	grid(count);
	blendMode(REPLACE);
	sig(day, prompts.getString(day - 1, 0), true, 0, 2);
	off += rate;
	record();
}
void grid(int count){
	int area = count*count;
	int cell = width/count;
	for (int n = 0; n < area; n++) {
		int x = (n%count)*cell;
		int y = (n/count)*cell;
		blendMode(LIGHTEST);
		fill(palette[(int)random(2,palette.length)]);
		strokeWeight(2);
		stroke(palette[4]);
		square(x,y,cell);
	}
}
void piece(int oP, int nP){
	copy(img, (int)l[oP].x, (int)l[oP].y, width/count, height/count, (int)l[nP].x, (int)l[nP].y, width/count, height/count);
	filter(GRAY);
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
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}