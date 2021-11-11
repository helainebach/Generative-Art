color[] palette = {#000F41,#FFFFFF,#A500FA,#FBA422,#61FF82,#55FFF5,#FA7823};

ArrayList<Sq> squares = new ArrayList<Sq>();
int m = 20;
void setup() {
	size(1920, 1920);
	noLoop();
	noStroke();
	squares.add(new Sq(m, m, width - m));
}
void draw() {
	background(palette[0]);
	drawSquare(5);
	for (Sq sq : squares) {
		sq.display();
	}
}
void drawSquare(int l) {
	ArrayList<Sq> temp = new ArrayList<Sq>();
	if (l > 1) {
		for (Sq sq : squares) {
			float r = random(1);
			if (r < .75) {
				temp.add(new Sq(sq.x,            sq.y,            sq.s / 2));
				temp.add(new Sq(sq.x + sq.s / 2, sq.y,            sq.s / 2));
				temp.add(new Sq(sq.x + sq.s / 2, sq.y + sq.s / 2, sq.s / 2));
				temp.add(new Sq(sq.x,            sq.y + sq.s / 2, sq.s / 2));
			} else {
				temp.add(new Sq(sq.x, sq.y, sq.s));
			}
		}
		squares = temp;
		l--;
		drawSquare(l);
	}
}

class Sq {
	float x, y, s;
	Sq (float _x, float _y, float _s) {
		x = _x;
		y = _y;
		s = _s;
	}
	void display() {
		fill(palette[(int)random(1, palette.length)]);
		square(x, y, s - m);
	}
}

void mousePressed() {
	redraw();
}

import java.text.SimpleDateFormat;
import java.util.Date;
void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		exit();
		break;
	}
}