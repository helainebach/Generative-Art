int u;
color[] palette = {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};

void setup() {
	size(600, 600);
	background(255);
	strokeCap(SQUARE);
	u = width / 5;
	noFill();
}
void draw() {
	strokeWeight(u/2 + 1);
	for (float i = 0; i < 7; i++) {
		stroke(palette[(int)i%palette.length]);
		zigZag(i * u/2, i * u/-2);
		zigZag(i * u/-2, i * u/2);
	}
	grid(20);
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		noFill();
		stroke(255);
		strokeWeight(1);
		square(x, y, cell);
	}
}
void zigZag(float x, float y) {
	beginShape();
	while (y <= height) {
		vertex(x, y);
		y += u;
		vertex(x, y);
		x += u;
	}
	endShape(OPEN);
}