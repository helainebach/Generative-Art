int c = 12;
float a, inc;
void setup() {
	size(800, 200, P2D);
	colorMode(HSB, 400);
	noStroke();
}
void draw() {
	float d = (float) sqrt((width / 2) * (width / 2) + (width / 2) * (width / 2)) * 2;
	for (int i = c; i > 3; --i) {
		pushMatrix ();
		translate  (width / 2, height / 2);
		rotate     (frameCount / (TWO_PI * 2) / i);
		pie        (0, 0, i * (d / c), i * c / 2);
		popMatrix  ();
	}
	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength * fps) exit();
}
void pie(float x, float y, float d, int c) {
	a 	= TWO_PI / c;
	inc = 0;
	for (int i = 0; i < c; i++) {
		color col1 = color(map(i, 0, c, 0, 400), map(d, width, 0, 100, 200), 400);
		color col2 = color(map(i, 0, c, 0, 400), map(d, width, 0, 300, 500), 400);
		if (i % 2 == 0) {
			fill(col1);
		} else {
			fill(col2);
		}
		arc(x, y, d, d, inc, inc + a);
		inc = inc + a;
	}
}