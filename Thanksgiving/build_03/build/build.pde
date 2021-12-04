color fg = 255;
color bg = 0;
void setup() {
	size(600, 600);
	colorMode(HSB);
	noLoop();
}
void draw() {
	background(0);
	int count = 3;
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell + cell / 2;
		int y = (n / count) * cell + cell / 2;
		pushMatrix();
		translate(x, y);
		rotate((int)random(1, 4) * PI / 2);
		fg = color(n * (255 / area), 150, 200);
		pie(0, 0, cell * .75);
		popMatrix();
	}
}
void pie(float x, float y, float s) {
	stroke(fg);
	noFill();
	strokeWeight(s / 5 / 4);
	strokeCap(SQUARE);
	arc(x, y, s, s, 0, PI / 2, PIE);
	for (int i = 0; i < 5; i++) {
		float x2 = x + sin((PI / 10) * i) * s / 2;
		float y2 = y + cos((PI / 10) * i) * s / 2;
		line(x, y, x2, y2);
	}
	arc(x, y, s, s, PI / 2, PI, PIE);
	for (int i = 1; i <= 5; i++) {
		pushMatrix();
		translate(x, y);
		arc(0, 0, i * s / 5, i * s / 5, PI, PI + PI / 2, PIE);
		popMatrix();
	}
	fill(255);
	arc(x, y, s, s, PI + PI / 2, TWO_PI, PIE);
}