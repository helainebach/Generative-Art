color[] palette = {#000F41,#1ECD1E,#A500FA};
int f = 30;
int r = 0;
void setup() {
	size(1080, 1080);
}
void draw() {
	background(#55FFF5);
	int u = width / f;
	for (int i = 0; i < 150; i++) {
		randomSeed((i + r) * 1000);
		int x = (int)random(1, f) * u;
		int y = (int)random(1, f) * u;
		int w = (int)random(1, 5) * u;
		int h = (int)random(1, 5) * u;
		noStroke();
		fill(palette[(int)random(palette.length)]);
		if (width - x - u > w && height - y - u > h)
			rect(x, y, w, h);
	}
	// dotGrid(f, 2, palette[0]);
	r++;
	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames2/###.png"); if (frameCount == vidLength*fps) exit();
}
void dotGrid(int count, int dotSize, color c) {
	int cell = width / count;
	int area = count * (height / cell);
	translate(cell, cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		if (x < width - cell && y < height - cell) {
			stroke(c);
			strokeWeight(dotSize);
			point(x, y);
		}
	}
}