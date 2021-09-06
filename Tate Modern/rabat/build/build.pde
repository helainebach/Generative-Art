String 	pathDATA = "../../../0_data/";
color 	blue = #0043A0;
color 	yellow = #E7B800;

void setup() {
	size(1080, 1080);
	stroke(#E0DCD6);
	strokeWeight(6);
	noLoop();
}
void draw() {
	float u = width / 26;
	background(#E0DCD6);
	for (int i = 1; i < 25; i++) {
		if (i % 2 == 0) {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u, (i + 1) * u, 25 * u, i * u, 25 * u, yellow);
		} else {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u, (i + 1) * u, 25 * u, i * u, 25 * u, blue);
		}
	}
	for (int i = 1; i < 25; i++) {
		if (i % 2 == 0) {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u,  25 * u, (i + 1) * u,  25 * u, i * u, blue);
		} else {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u,  25 * u, (i + 1) * u,  25 * u, i * u, yellow);
		}
	}
	paper(2, 3, 100); //noiseRes, speckSize, speckCount,
}
void shape(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, color col) {
	fill(col);
	beginShape();
	vertex(x1, y1);
	vertex(x2, y2);
	vertex(x3, y3);
	vertex(x4, y4);
	endShape(CLOSE);
}

void paper(int noiseRes, int speckSize, int speckCount) {
	noStroke();
	for (int i = 0; i < width - noiseRes / 2; i += noiseRes) {
		for (int j = 0; j < height - noiseRes / 2; j += noiseRes) {
			fill(random(170, 240), 25);
			rect(i, j, noiseRes, noiseRes);
		}
	}
	for (int i = 0; i < speckCount; i++) {
		blendMode(SCREEN);
		fill(random(130, 215), random(100, 170));
		rect(random(0, width - speckSize / 2), random(0, height - speckSize / 2), random((int)speckSize / 2, speckSize), random((int)speckSize / 2, speckSize));
	}
}