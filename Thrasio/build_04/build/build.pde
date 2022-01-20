color[] palette = {#000F41,#55FFF5,#1ECD1E,#A500FA,#FA7823,#FFFA37,#DE1C1C};
float p = 7.0;
void setup() {
	size(600, 600);
	noStroke();
}

void draw() {
	set(0, width / p, 0);
	set(5, width / p, height / p*2);
	set(4, width / p / 2, -height / p);
}

void set(int coff, float xoff, float yoff) {
	pushMatrix();
	for (float i = 0; i < p; i++) {
		fill(palette[(coff + (int)i) % palette.length]);
		rect(0, 0, width / p, height);
		translate(xoff, yoff);
	}
	popMatrix();
}