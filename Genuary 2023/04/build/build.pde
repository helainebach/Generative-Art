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
int 	day 	 = 12;
float 	r;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	background(palette[2]);
	r = 108;
	float hexHeight = r * 2;
	float hexWidth = sqrt(3) / 2 * hexHeight;
	for (int i = 0; i < height / r; i++) {
		for (int j = 0; j < width / r; j++) {
			float xSpacing = hexWidth * j;
			float ySpacing = hexHeight * 0.75 * i;
			strokeWeight(8);
			if ((i % 2) == 0) {
				hexagon(xSpacing, ySpacing, r);
			} else {
				hexagon(xSpacing + hexWidth / 2, ySpacing, r);
			}
		}
		sig(day, prompts.getString(day - 1, 0), true, 3, 1);
		off += rate;
		// record();
	}
}
void hexagon(float cx, float cy, float r) {
	float angle = TWO_PI / 6;
	r = r * .75;
	beginShape();
	for (var i = 0; i <= 6; i++) {
		var x = cx + cos(angle * (i + .5)) * r;
		var y = cy + sin(angle * (i + .5)) * r;
		vertex(x, y);
	}
	endShape();
}
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
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}