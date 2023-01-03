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
int 	day 	 = 2;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	bg();
	stroke(palette[1]);
	grid(3);
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
	// record();
}
void pie(float x, float y, int n){
	n = n+1;
	strokeWeight(2);
	fill(palette[0]);
	arc(x, y, width/4, height/4, 0, TWO_PI/9*n,PIE);
}
void grid(int count){
	int area = count*count;
	int cell = width/count;
	for (int n = 0; n <= area; n++) {
		int x = (n%count)*cell+cell/2;
		int y = (n/count)*cell+cell/2;
		pie(x,y,n);
	}
}

void bg() {
	background(palette[0]);
	for (int y = 0; y < height; y++) {
		for (int x = 0; x < width; ++x) {
			color col = lerpColor(palette[2], palette[3], map(y,0,height,0,1));
			stroke(col);
			point(x, y);
		}
	}
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