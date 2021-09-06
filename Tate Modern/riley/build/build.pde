//Inspired by: Bridget Riley Coloured Greys III 1972
color 	paper 	= #F7F2E6;
color 	purple 	= #9291A0;
color 	blue 	= #84909A;
color 	grey 	= #858980;
//
PImage 	img;
color 	c1, c2, grad;
//
float 	a 		= 0.0;
float 	inc 	= PI / 66;
//
void setup() {
	size(600, 600);
	noFill();
	strokeWeight(2.5);
}
void draw() {
	background(paper);
	for (int j = 0; j < 18; j++) {
		int m = 55;
		if (j < 9) {
			grad = lerpColor(blue, grey, map(j, 0, 9, 0, 1));
		} else {
			grad = lerpColor(grey, blue, map(j, 9, 18, 0, 1));
		}
		if (j % 2 == 0) {
			c1 = purple;
			c2 = grad;
		} else {
			c1 = grad;
			c2 = purple;
		}
		for (int i = 0; i < 20; i++) {
			if (i < 10) {
				stroke(c1);
			} else {
				stroke(c2);
			}
			wave(m + j * 28.5 + i, i * -.085 - j * 2);
		}
	}
}
void wave(float y, float s) {
	beginShape();
	for (int j = 30; j < width - 30; j++) {
		vertex(j, y + cos(s) * 10);
		s = s + inc;
	}
	endShape(OPEN);
}