// Genuary 2022 - Day 08
// Single curve only.

color[] palette = {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
float   off = 1.0;
int 	n = 15;
void setup() {
	size(1080, 1080);
}
void draw() {
	background(palette[1]);
	stroke(palette[0]);
	grid(20);
	stroke(palette[0], 50);
	grid(40);
	noFill();
	beginShape();

	for (int i = 0; i <= n; i++) {
		float nX = noise(i) * width;
		float nY = noise(i, off) * height;
		float a  = sin(off * 10) * 1;
		color c  = lerpColor(palette[2], palette[3], a);

		stroke(c);
		strokeWeight(3);
		noFill();

		curveVertex(nX, nY);

		if (i == 1 || i == n - 1) {
			fill(c);
			circle(nX, nY, 10);
		}

	}
	endShape(OPEN);
	off += .003;
	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength*fps) exit();
}

void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		noFill();
		strokeWeight(1);
		square(x, y, cell);
	}
}