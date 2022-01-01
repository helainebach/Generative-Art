int   u;
color [] palette = {#000F41,#55FFF5,#A500FA,#FA7823};

void setup() {
	size(600, 600);
	noFill();
	strokeCap(SQUARE);
	u = width / 7;
	strokeWeight(u / 2 + 1);
}
void draw() {
	background(palette[0]);
	for (float i = 0; i < 8; i++) {
		stroke(palette[(int)i % palette.length]);
		zigZag(i * u / 2, i * u / -2 - u / 2);
		// zigZag(i * u / -2, i * u / 2 - u / 2);
	}
}

void zigZag(float x, float y) {
	beginShape();
	while (y <= width) {
		vertex(x, y);
		y += u;
		vertex(x, y);
		x += u;
	}
	endShape(OPEN);
}