int x;
int y;
int r;
void setup() {
	size(600, 600);
}
void draw() {
	background(255);
	grid(10);
	beginShape();
	for (int i = 0; i <= 10; i++) {
		randomSeed((int)i * 1000);
		x = i * (width / 10);
		y = width - i * (height / 10) + r;
		if (i < 1 || i > 8) {
			r = 0;
		} else {
			r = (int)random(width / 10) * 3;
		}
		strokeWeight(10);
		point(x, y);
		noFill();
		strokeWeight(3);
		vertex(x, y);
	}
	endShape(OPEN);
}
void grid(int count) {
	strokeWeight(1);
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		square(x, y, cell);
	}
}