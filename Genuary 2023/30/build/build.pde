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
int 	day 	 = 30;
//
void setup() {
	size(1080, 1080);
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts = loadTable("../../prompts.csv", "header");
}
void draw() {
	background(palette[1]);
	noStroke();
	fill(palette[4]);
	circle(width / 2, height / 2, width / 2);
	fill(palette[1]);
	eTri(width / 2, height / 2, height / 2);
	rectMode(CENTER);
	fill(palette[4]);
	eTri(width/2,height/2,width/8);
	sig(day, prompts.getString(day - 1, 0), true, 1, 4);
	off += rate;
	// record();
}
void eTri(float x, float y, float r) {
	r = hypo(r/4, r/4);
	pushMatrix();
	translate(x, y);
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
		rectMode(CORNER);
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}