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
int 	day 	 = 20;
float 	a, inc;
int 	c;
FloatList angles;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
	angles 	= new FloatList();
	while (inc < TWO_PI) {
		a 	= random(TWO_PI / 12, TWO_PI / 9);
		inc = inc + a;
		angles.append(a);
		c++;
	}
	println(angles);
	println(c);
	noLoop();
}
void draw() {
	bg();
	inc = 0;
	noStroke();
	fill(palette[0]);
	circle(random(width), random(width), random(width / 2, width));
	for (int i = 0; i < c ; i++) {
		float d = width / 3 * 2 * random(.5, 1.5);
		if (i < c - 1) {
			a 	= angles.get(i);
		} else {
			a = TWO_PI - inc;
		}
		stroke(palette[1]);
		color col = palette[(int)random(2, palette.length)];
		fill(col);
		strokeWeight(5);
		arc(width / 2, height / 2, d, d, inc, inc + a, PIE);
		inc = inc + a;
	}
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	// record();
}
void bg() {
	background(palette[1]);
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