int 	h;
float 	hoff, n;
float 	off 	 = 0;
float   rate 	 = PI / 300;

void setup() {
	size(600, 600);
	rectMode(CENTER);
	noStroke();
}
void draw() {
	background(0);
	h = 10;
	translate(h / 2, 0);
	for (int i = 0; i < width / h; i++) {
		n = noise(i,off)*i/15;
		hoff = map(n, 0, 1, h, h * 50);
		rect(0, 0, h, hoff);
		translate(h, h);
	}
	off += rate;
}