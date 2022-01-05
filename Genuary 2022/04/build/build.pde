color[] palette = {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
int 	scl = 15;
float 	inc = .05;
int 	cols, rows;
float 	xoff, yoff, zoff;
color 	c;

void setup() {
	size(600, 600);
	cols = width / scl;
	rows = height / scl;
}
void draw() {
	background(palette[0]);
	yoff = 0.0;
	for (int y = 0; y <= rows; y++) {
		xoff = 0.0;
		for (int x = 0; x <= cols; x++) {
			float r = noise(xoff, yoff, zoff);
			pushMatrix();
			translate(x * scl, y * scl);
			PVector a = PVector.fromAngle(r * TWO_PI);
			a.mult(scl);
			noFill();
			if (r < .5) {
				r = map(r, 0, .5, -.5, 1);
				c = lerpColor(palette[3], palette[1], (int)Math.round(r));
			} else {
				r = map(r, .5, 1, 0, 1.5);
				c = lerpColor(palette[0], palette[2], (int)Math.round(r));
			}
			stroke(c);
			strokeWeight(scl * .75);
			strokeCap(SQUARE);
			line(0, 0, a.x, a.y);
			popMatrix();
			xoff += inc;
		}
		yoff += inc;
	}
	zoff += inc / 2;
	float vidLength = 5;
	float fps       = 30;
	saveFrame("../exports/frames2/###.png"); if (frameCount == vidLength*fps) exit();
}