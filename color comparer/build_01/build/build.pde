int[] 	c1n 	= new int[3];
int[] 	c2n 	= new int[3];
float[] c 		= new float[3];
int 	cell 	= 100;
color 	c1, c1r, c1g, c1b;
color 	c2, c2r, c2g, c2b;
color 	cr, cg, cb;
float percent;
void setup() {
	size(600, 600, P2D);
	colSet();
	textAlign(CENTER, CENTER);
	textSize(40);
}
void draw() {
	// Color 1
	noStroke();
	fill(c1);
	rect(0, 0, width / 2, height);

	stroke(255);
	fill(c1r);
	rect(width / 2 - cell * 1.5, cell * .25, cell, cell / 2);
	fill(c1g);
	rect(width / 2 - cell * 1.5, cell * 1, cell, cell / 2);
	fill(c1b);
	rect(width / 2 - cell * 1.5, cell * 1.75, cell, cell / 2);
	// Color 2
	noStroke();
	fill(c2);
	rect(width / 2, 0, width / 2, height);

	stroke(255);
	fill(c2r);
	rect(width / 2 + cell * .5, cell * .25, cell, cell / 2);
	fill(c2g);
	rect(width / 2 + cell * .5, cell * 1, cell, cell / 2);
	fill(c2b);
	rect(width / 2 + cell * .5, cell * 1.75, cell, cell / 2);


	fill(cr);
	rect(width / 2 - cell * .5, cell * .25, cell, cell / 2);
	fill(cg);
	rect(width / 2 - cell * .5, cell * 1, cell, cell / 2);
	fill(cb);
	rect(width / 2 - cell * .5, cell * 1.75, cell, cell / 2);
	// Guides
	fill(255);
	text("#" + hex(c1, 6), width / 4, height / 2);
	text("#" + hex(c2, 6), width * .75, height / 2);
	println(percent);
}
// void colSet() {
// 	for (int i = 0; i < 3; i++) {
// 		c1n[i] = (int)random(255);
// 	}
// 	c1 = color(c1n[0], c1n[1], c1n[2]);
// 	c1r = color(c1n[0], 0, 0);
// 	c1g = color(0, c1n[1], 0);
// 	c1b = color(0, 0, c1n[2]);
// 	for (int i = 0; i < 3; i++) {
// 		c2n[i] = (int)random(255);
// 	}
// 	c2 = color(c2n[0], c2n[1], c2n[2]);
// 	c2r = color(c2n[0], 0, 0);
// 	c2g = color(0, c2n[1], 0);
// 	c2b = color(0, 0, c2n[2]);

// 	cr = color(255-(c1n[0]-c2n[0]), 0, 0);
// 	cg = color(0, c2n[1], 0);
// 	cb = color(0, 0, c2n[2]);
// }


void colSet() {
	for (int i = 0; i < 3; i++) {
		c1n[i] = (int)random(255);
	}
	c1 = color(c1n[0], c1n[1], c1n[2]);
	c1r = color(c1n[0]);
	c1g = color(c1n[1]);
	c1b = color(c1n[2]);
	for (int i = 0; i < 3; i++) {
		c2n[i] = (int)random(255);
	}
	c2 = color(c2n[0], c2n[1], c2n[2]);
	c2r = color(c2n[0]);
	c2g = color(c2n[1]);
	c2b = color(c2n[2]);

	cr = color(abs(c1n[0] - c2n[0]) / 255);
	cg = color(abs(c1n[1] - c2n[1]) / 255);
	cb = color(abs(c1n[2] - c2n[2]) / 255);

	for (float i = 0; i < 3; i++) {
		c[i] = (c1n[0] - c2n[0]) / 255;
	}
	percent = (c[0]+c[1]+c[2])*3;
}
void mousePressed() {
	colSet();
}