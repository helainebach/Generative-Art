color  	bg = 0;
color  	fg = 255;
int 	u  = 12;
float 	x, y, r;
void setup() {
	size(600, 600);
	noFill();
}
void draw() {
	bg();
	r = map(mouseX, 0, width, 0, (u / 2) + 1);
	int n = (int)map(mouseY, 0, height, 3, u);
	beginShape();
	for (float i = 0; i <= TWO_PI; i = i + TWO_PI / n) {
		polar(i);
		stroke(255);
		strokeWeight(5);
		vortex(x, y);
	}
	endShape(CLOSE);
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		strokeWeight(.2);
		square(x, y, cell);
	}
	for (int i = 0; i <= count; i++) {
		strokeWeight(.5);
		circle(width / 2, height / 2, i * cell * 2);
	}
}
void bg() {
	background(bg);
	stroke(75);
	grid(u);
}
void polar(float a) {
	x = width / 2 + sin(a) * r * (width / u);
	y = height / 2 + cos(a) * r * (width / u);
}