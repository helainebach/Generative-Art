PFont font;
String pathDATA = "../../../0_data/";
void setup() {
	size(600, 600);
	font = createFont(pathDATA + "fonts/Gotham-Bold 2.otf", 32);
	noStroke();
	noLoop();
}
void draw() {
	background(50);
	textAlign(CENTER, CENTER);
	for (int i = 1; i < 10; i++) {
		int f = 8 * i;
		textFont(font, f);
		fill(255, f * 2.5);
		text("hello world", width / 2, height / 3 + f);
		if (i == 9) {
			textFont(font, f);
			fill(255);
			text("hello world", width / 2, height / 3 + f);
		}
	}
	fill((int)random(100, 255), (int)random(100, 255), (int)random(100, 255));
	blendMode(MULTIPLY);
	rect(0, 0, width, height);
	blendMode(ADD);
	// fill(255);
	// text("hello world", width / 2, 200 + 90);
}

void mousePressed() {
	redraw();
}