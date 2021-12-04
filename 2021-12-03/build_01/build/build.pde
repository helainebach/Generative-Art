color[] palette = {#FFFFFF,#A500FA,#FBA422,#61FF82,#55FFF5,#FA7823};
boolean record = true;
float off = 0.0;
int r = (int)random(palette.length);
void setup() {
	size(1080, 1920, P2D);
	noFill();
	strokeWeight(5);
	stroke(#000F41);
}
void draw() {
	background(#000F41);
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(TWO_PI * cos(off));
	recursion(0, 0, width - 100, 7);
	popMatrix();
	off += .05;
	if (record) {saveFrame("../exports/frames/###.png"); if (frameCount >= TWO_PI * 10) exit();}
}
void recursion(float x, float y, float s, int l) {
	s = s * (sin(off));
	fill(palette[(r + l) % palette.length]);
	circle(x, y, s);
	fill(#000F41);
	circle(x, y, s - 18);
	l--;
	if (l > 1) {
		recursion(x - s / 2, y + s / l, s / 2, l);
		recursion(x + s / 2, y - s / l, s / 2, l);
	}
}
void mousePressed() {
	println(frameCount);
}