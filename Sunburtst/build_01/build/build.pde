color[] palette = {#CEBA9E,#A57B52,#996C54,#706560};
float   r;
float   x, y;

void setup() {
	size(600, 600);
	noStroke();
}

void draw() {
	background(#2E2D36);
	int count = 9;
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell + cell / 2;
		int y = (n / count) * cell + cell / 2;
		color c = palette[((n / count) * (n % count)) % palette.length];
		fill(c);
		star(6, cell / 2.5, 1.75, x, y);
	}
}

void star(int n, float s, float d, float pX, float pY) {
	pushMatrix();
	translate(pX, pY);
	rotate(-PI / 2);
	beginShape();
	for (float a = 0; a < TWO_PI; a += TWO_PI / n) {
		r = s;
		polar(a);
		vertex(x, y);
		r = r / d;
		polar(a + TWO_PI / (n * 2));
		vertex(x, y);
	}
	endShape(CLOSE);
	popMatrix();
}

void polar(float a) {
	x = r * cos(a);
	y = r * sin(a);
}