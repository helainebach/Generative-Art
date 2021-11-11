color[] palette = {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F};
void setup() {
	size(500, 500);
	background(palette[0]);
	noLoop();
	// noStroke();
}
void draw() {
	translate(width / 2, height / 2);
	rotate(PI / 4);
	drawCircle(0, 0, width / 1.5);
}
void drawCircle(float x, float y, float s) {
	fill(palette[(int)random(1, palette.length)]);
	circle(x, y, s);
	if (s > 15) {
		drawCircle(x + s / 2, y,         s / 2);
		drawCircle(x - s / 2, y,         s / 2);
		drawCircle(x,         y + s / 2, s / 2);
		drawCircle(x,         y - s / 2, s / 2);
	}
}