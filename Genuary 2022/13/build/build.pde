color[] palette = {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
float   off 	= 0.0;
float   rate 	= 2;
float   yoff, ystart;
void setup() {
	size(800, 80);
	blendMode(EXCLUSION);
}
void draw() {
	background(0);
	grid(10);
	for (int i = -1; i < 10; i++) {
		fill(255);
		pushMatrix();
		if (i % 2 == 0) {
			yoff   = off * -2;
			ystart = 80;
		} else {
			yoff   = off * 2;
			ystart = -80;
		}
		translate((i * width / 10 + width / 20) + off, ystart + yoff);
		circle(0, 0, 40);
		popMatrix();
	}
	off += rate;
	if (off >= width / 10) {
		off = 0.0;
	}
	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength*fps) exit();
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		fill(palette[(int)(n + frameCount / (height / rate) ) % palette.length]);
		noStroke();
		square(x, y, cell);
	}
}