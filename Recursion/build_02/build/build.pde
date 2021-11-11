color[] palette = {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F};
void setup() {
	size(500, 500);
	background(palette[0]);
	noLoop();
	// noStroke();
}
void draw() {
	drawSquare(0, 0, width, 6);
}
void drawSquare(float x, float y, float s, int l) {
	fill(palette[(int)random(1, palette.length)]);
	square(x, y, s);
	if (l > 1) {
		l--;
		float r = random(1);
		if (r > .5) {
			drawSquare(x, y, s / 2, l);
			drawSquare(x + s / 2, y, s / 2, l);
			drawSquare(x, y + s / 2, s / 2, l);
			drawSquare(x + s / 2, y + s / 2, s / 2, l);
		} else {
			drawSquare(x, y, s, l);

		}
	}
}