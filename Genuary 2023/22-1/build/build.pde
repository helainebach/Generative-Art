import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[]  palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 	 pathDATA = "../../../0_data/";
Table 	 prompts;
String   folderName;
PFont 	 font;
float 	 off 	 = 0;
float    rate 	 = PI / 300;
int 	 day 	 = 22;
Boundary[]walls = new Boundary[10];
Particle particle;
Ray 	 ray;
//
void setup() {
	size(1080, 1080);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	drawWalls();
	walls[walls.length - 4] = (new Boundary(0, 0, width, 0));
	walls[walls.length - 3] = (new Boundary(width, 0, width, height));
	walls[walls.length - 2] = (new Boundary(width, height, 0, height));
	walls[walls.length - 1] = (new Boundary(0, height, 0, 0));
	particle = new Particle();
}
void draw() {
	bg();
	strokeWeight(3);
	particle.update(width / 2 + sin(off) * width / 3, height / 2 + cos(off) * width / 3);
	particle.show();
	particle.look(walls);
	for (int i = 0; i < walls.length - 4; ++i) {
		strokeWeight(10);
		stroke(palette[(i % (palette.length - 2)) + 2]);
		walls[i].show();
	}
	sig(day, prompts.getString(day - 1, 0), true, 0, 4);
	off += rate;
	record();
}
void bg() {
	background(palette[0]);
}
void drawWalls() {
	walls = new Boundary[10 + 4];
	for (int i = 0; i < walls.length; i++) {
		float x1 = ((int)random(1, 10)) * 108;
		float x2 = ((int)random(1, 10)) * 108;
		float y1 = ((int)random(1, 10)) * 108;
		float y2 = ((int)random(1, 10)) * 108;
		float r = random(1);
		if (r > .5) {
			walls[i] = new Boundary(x1, y1, x1, y2);
		} else {
			walls[i] = new Boundary(x1, y1, x2, y1);
		}
	}
}
class Particle {
	PVector pos;
	Ray[] rays;
	Particle() {
		this.pos = new PVector(width / 2, height / 2);
		this.rays = new Ray[360];
		for (int a = 0; a < this.rays.length; a += 1) {
			this.rays[a] = new Ray(this.pos, radians(a));
		}
	}
	void update(float x, float y) {
		this.pos.set(x, y);
	}
	void look(Boundary[] walls) {
		for (int i = 0; i < this.rays.length; i += 3) {
			Ray ray = this.rays[i];
			PVector closest = null;
			float record = 500000000;
			for (Boundary wall : walls) {
				PVector pt = ray.cast(wall);
				if (pt != null) {
					float d = PVector.dist(this.pos, pt);
					if (d < record) {
						record = d;
						closest = pt;
					}
				}
			}
			if (closest != null) {
				stroke(palette[1]);
				line(this.pos.x, this.pos.y, closest.x, closest.y);
			}
		}
	}
	void show() {
		fill(palette[1]);
		for (Ray ray : this.rays) {
			ray.show();
		}
	}
}
class Boundary {
	PVector a, b;
	Boundary(float x1, float y1, float x2, float  y2) {
		this.a = new PVector(x1, y1);
		this.b = new PVector(x2, y2);
	}
	void show() {
		line(this.a.x, this.a.y, this.b.x, this.b.y);
	}
}
class Ray {
	PVector pos, dir;
	Ray(PVector _pos, float angle) {
		this.pos = _pos;
		this.dir = PVector.fromAngle(angle);
	}
	void lookAt(float x, float y) {
		this.dir.x = x - this.pos.x;
		this.dir.y = y - this.pos.y;
		this.dir.normalize();
	}
	void show() {
		push();
		translate(this.pos.x, this.pos.y);
		line(0, 0, this.dir.x * 10, this.dir.y * 10);
		pop();
	}
	PVector cast(Boundary wall) {
		float x1 = wall.a.x;
		float y1 = wall.a.y;
		float x2 = wall.b.x;
		float y2 = wall.b.y;
		float x3 = this.pos.x;
		float y3 = this.pos.y;
		float x4 = this.pos.x + this.dir.x;
		float y4 = this.pos.y + this.dir.y;
		float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
		if (den == 0) {
			return null;
		}
		float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
		float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
		if (t > 0 && t < 1 && u > 0) {
			PVector pt = new PVector();
			pt.x = x1 + t * (x2 - x1);
			pt.y = y1 + t * (y2 - y1);
			return pt;
		} else {
			return null;
		}
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