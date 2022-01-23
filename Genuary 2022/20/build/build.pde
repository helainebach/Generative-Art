String  pathDATA 	= "../../../0_data/";
color[] palette  	= {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
color  	bg 			= palette[1];
color  	fg 			= palette[1];
PFont   font;
float 	n;
float 	off = 0.0;
void setup() {
	size(1080, 1080);
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 30);
	textAlign(CENTER, CENTER);
	textFont(font);
}
void draw() {
	background(bg);
	dotGrid(10);
	off += .005;
	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength*fps) exit();
}
void dotGrid(int count) {
	int cell = width / count;
	int area = count * (height / cell);
	translate(cell, cell);
	for (int i = 0; i < area; i++) {
		int x = (i % count) * cell;
		int y = (i / count) * cell;
		n = noise(x, y, off);
		float n_ = n * 126;
		int cn = Math.round(n_);
		String character = str(cn);
		if (x < width - cell && y < height - cell) {
			pushMatrix();
			translate(x, y);
			rotate(map(n, 0, 1, 0, TWO_PI));
			fill(palette[2+(int)(n * 2)]);
			c(0, 0, character);
			popMatrix();
		}
	}
}
void c(float x, float y, String s) {
	textSize(10 + n * 100);
	pushMatrix();
	translate(x, y);
	text(s, 0, 0);
	popMatrix();
	pushMatrix();
	translate(x, y);
	rotate(TWO_PI / 3);
	text(s, 0, 0);
	popMatrix();
	pushMatrix();
	translate(x, y);
	rotate((TWO_PI / 3) * 2);
	text(s, 0, 0);
	popMatrix();
}