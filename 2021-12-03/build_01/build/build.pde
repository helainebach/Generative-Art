color[] palette = {#03A08F,#0160B6,#FFDD5E,#FFA051,#FF3C1B};
boolean record 	= false;
float 	rate 	= 0.05;
float 	off;
float   x, y, r;
color 	bg = palette[0];
void setup() {
	size(600, 600, P2D);
	strokeWeight(5);
	stroke(bg);
	noFill();
}
void draw() {
	background(bg);
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(TWO_PI * cos(off));
	recursion(0, 0, width / 2, 6);
	popMatrix();
	off += rate;
	if (record) saveFrame("../exports/frames/###.png");
	if (frameCount > PI / rate) exit();
}
void recursion(float x, float y, float s, int l) {
	s = s * abs((sin(off)));
	fill(palette[1+l % (palette.length-1)]);
	circle(x, y, s);
	fill(bg);
	circle(x, y, s - 20);
	l--;
	if (l > 1) {
		recursion(x - s / 2, y + s / l, s / 2, l);
		recursion(x + s / 2, y - s / l, s / 2, l);
	}
}