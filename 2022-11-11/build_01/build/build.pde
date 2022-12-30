float 	x, y, a, off;
int 	count 	= 10;
float 	rate 	= 0.01;
color   col 	= #FF4059;
//
void setup() {
	size(600, 600);
}
//
void draw() {
	translate(width / 2, height / 2);
	bg();
	for (int i = 1; i < count; i++) {
		randomSeed(i);
		rotate(random(45));
		ring(width / count / 2 * i);
	}
	off += rate;
}
void ring(float r) {
	float circ = r * TWO_PI;
	int c = int(circ / count * 4);
	for (float i = 0; i < c; i++) {
		a = map(i, 0, c, 0, TWO_PI);
		float n = noise(r, cos(a) * PI, off);
		polar(a, r);
		strokeWeight(n * width / 3 / count);
		stroke(col, n * 255);
		point(x, y);
	}
}
void polar(float a, float r) {
	x = sin(a) * r;
	y = cos(a) * r;
}
void bg() {
	background(255);
	noFill();
	// polarGrid(count, count);
}
void polarGrid(float c, int s) {
	stroke(200);
	strokeWeight(1);
	for (float i = 0; i <= c; i++) {
		circle(0, 0, (width / c) * i);
	}
	for (float i = 0; i < s; i++) {
		a = map(i, 0, s, 0, TWO_PI);
		polar(a, width / 2);
		line(0, 0, x, y);
	}
}