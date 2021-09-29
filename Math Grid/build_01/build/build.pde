color[] palette = {#F60000,#FF8C00,#FFEE00,#4DE94C,#3783FF,#4815AA};
int m, s;
void setup() {
	size(600, 600);
	strokeWeight(2);
	noFill();
	rectMode(CENTER);

}
void draw() {
	frameRate(1);
	background(0);
	stroke(palette[0]);
	square(width / 2, height / 2, 520);
	translate((600 - 512) / 2 + 2, (600 - 512) / 2);
	strokeWeight(3);
	m = (int)random(9, 15);
	s = (int)random(2, 4);
	grid(m, s);
	saveFrame("../exports/stills/"+m+"-"+s+".png");
}
void grid(int m, int s) {
	int count = 128;
	int cell = 4;
	int area = 16384;
	for (int n = 0; n < area; n++) {
		int x = (n % count);
		int y = (n / count);
		int num = ((128 + x + y) ^ (256 + x - y)) % m;
		if (num <= s) {
			if (num >= s / 2) {
				stroke(palette[n * 2 % palette.length]);

			} else {
				stroke(palette[4]);
			}
			point(x * cell, y * cell);
		}
	}
}