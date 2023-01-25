color[] palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
float 	off 	 = 0;
float   rate 	 = PI / 150;
void setup() {
	size(600, 600);
}
void draw() {
	background(palette[1]);
	dotGrid(60, palette[2], palette[3]);
}
void dotGrid(int count, color c1, color c2) {
	int cell = width / count;
	int area = count * (height / cell);
	translate(cell, cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		float dotSize = noise(x, y, off) * cell * 2;
		color c = lerpColor(c1, c2, map(n, 0, area, 0, 1));
		if (x < width - cell && y < height - cell) {
			stroke(c);
			strokeWeight(dotSize);
			point(x, y);
		}
	}
	off += rate;
}