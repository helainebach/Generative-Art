color  bg = #FFFAD8;
color  fg = #FA3FC7;
void setup() {
	size(600, 600);
	surface.setTitle("@helainebach");
}
void draw() {
	bg();
	style();
	//
	pushMatrix();
	translate(width / 2, height / 2);
	rectMode(CENTER);
	float r = atan(2);
	float s = width / 3*2;
	circle(0, 0, hypo(s));
	while (s > 20) {
		square(0, 0, s);
		rotate(r);
		s = s * sqrt(5) / 3;
	}
	popMatrix();
}
float hypo(float a) {
	double c = Math.sqrt((a * a) + (a * a));
	return (float)c;
}
void grid(int count) {
	rectMode(CORNER);
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		square(x, y, cell);
	}
}
void bg() {
	background(bg);
	strokeWeight(.5);
	noFill();
	stroke(fg, 50);
	grid(12);
}
void style() {
	stroke(fg);
	strokeWeight(2);
	// fill(fg, 20);
}