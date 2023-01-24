import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[]  palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	 pathDATA = "../../../0_data/";
Table 	 prompts;
String   folderName;
PFont 	 font;
float 	 off 	 = 0;
float    rate 	 = PI / 150;
int 	 day 	 = 22;
Boundary wall;
Particle particle;
//
void setup() {
	size(400, 400);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	wall 		= new Boundary(300, 100, 300, 300);
}
void draw() {
	particle 	= new Particle(mouseX, mouseY);
	bg();
	wall.show();
	particle.look(wall);
}
void bg() {
	background(palette[0]);
}
class Particle{
	Ray[] 	rays = new Ray[360];
	PVector pos;
	float 	x, y;
	Particle(float x, float y) {
		pos = new PVector(x, y);
		for (int i = 0; i < 360; i ++) {
			rays[i] = new Ray(pos, i);
		}
	}
	void look(Boundary wall) {
		for (int i = 0; i < rays.length; i += 2) {
			rays[i].cast(wall);
			line(pos.x, pos.y, rays[i].cast(wall).x, rays[i].cast(wall).y);
		}
	}
}
class Boundary{
	PVector a;
	PVector b;
	Boundary(float x1, float y1, float x2, float y2) {
		a = new PVector(x1, y1);
		b = new PVector(x2, y2);
	}
	void show() {
		stroke(palette[1]);
		strokeWeight(3);
		line(a.x, a.y, b.x, b.y);
	}
}
class Ray{
	PVector pos;
	PVector dir;
	float x1, y1, x2, y2;
	float x3, y3, x4, y4;
	Ray(PVector _pos, float angle) {
		pos = _pos;
		dir = PVector.fromAngle(radians(angle));
	}
	void lookAt(float x, float y) {
		dir.x = x - pos.x;
		dir.y = y - pos.y;
		dir.normalize();
	}
	PVector cast(Boundary wall) {
		x1 = wall.a.x;
		y1 = wall.a.y;
		x2 = wall.b.x;
		y2 = wall.b.y;
		//
		x3 = pos.x;
		y3 = pos.y;
		x4 = pos.x + dir.x;
		y4 = pos.y + dir.y;
		//
		PVector pt = new PVector();
		float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
		if (den == 0) {
			pt = pos;
		}
		float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
		float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
		if (t > 0 && t < 1 && u > 0) {
			pt.x = x1 + t * (x2 - x1);
			pt.y = y1 + t * (y2 - y1);
		} else {
			pt = pos;
		}
		return (pt);
	}
}
//
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