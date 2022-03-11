PGraphics []pg = new PGraphics[4];
String s;
color[] palette = {#0083C6,#E83F45,#FE8D33,#FFE023};
color  bg = 255;
color  fg = 0;
String pathDATA = "../../../0_data/";
void setup() {
	size(600, 600, P2D);
	for (int i = 0; i < 4; i++) {
		pg[i] = createGraphics(width, height);
		pg(i);
	}
}
void draw() {
	background(255);
	int u = width / 2;
	// copy(pg[0],0,0,u,u,0,0,u,u);
	image(pg[1], 0, 0, width, height);
}
void pg(int n) {
	pg[n].beginDraw();
	pg[n].pushMatrix();
	pg[n].translate(width / 2, height / 2);
	pg[n].scale(width / (width * sqrt(2)));
	pg[n].rotate(PI / 4);
	pg[n].fill(palette[n]);
	pg[n].noStroke();
	pg[n].rectMode(CENTER);
	pg[n].rect(0, 0, width, height);
	for (int i = -4; i < 5; ++i) {
		for (int j = -4; j < 5; ++j) {
			if (i < 0 && j < 0) {
				s = String.valueOf(n) + " - TL";
			} if (i < 0 && j > 0) {
				s = String.valueOf(n) + " - BL";
			} if (i > 0 && j < 0) {
				s = String.valueOf(n) + " - TR";
			} if (i > 0 && j > 0) {
				s = String.valueOf(n) + " - BR";
			} if (i == 0 || j == 0) {
				s = " ";
			}

			pg[n].pushMatrix();
			pg[n].translate(i * width / 10, j * width / 10);
			pg[n].textSize(18);
			pg[n].fill(255);
			pg[n].textAlign(CENTER);
			pg[n].text(s, 0, 0);
			pg[n].popMatrix();
		}
	}
	pg[n].stroke(255);
	pg[n].line(0, 0, -width / 2, height / 2);
	pg[n].line(0, 0, width / 2, -height / 2);
	pg[n].line(0, 0, width / 2, height / 2);
	pg[n].line(0, 0, width / 2, 0);
	pg[n].line(0, 0, 0, height / 2);
	pg[n].line(0, 0, -width / 2, -height / 2);
	pg[n].line(0, 0, -width / 2, 0);
	pg[n].line(0, 0, 0, -height / 2);
	pg[n].popMatrix();
	pg[n].endDraw();
}