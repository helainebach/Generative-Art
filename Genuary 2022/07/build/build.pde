// Genuary 2022 - Day 05
// Sol LeWitt Wall Drawing.

// Helaine Bach Wall Drawing Number 01

// Draw 100 Lines.
// The first point of each line should be on the right edge of the wall.
// The second point of each line should be on the bottom edge of the wall.
// Alternate color every 20 lines.

color   wall     = 255;
color[] palette  = {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};

void setup() {
	strokeWeight(5);
	size(1080, 1080);
	background(wall);
	// Draw 100 Lines.
	for (float i = 0; i < 100; i++) {
		// The first point of each line should be on the right edge of the wall.
		float x1 = 0;
		float y1 = random(height);
		float x2 = random(width);
		//The second point of each line should be on the bottom edge of the wall.
		float y2 = height;
		float s = (i / 100) * 5;
		// Alternate color every 20 lines.
		stroke(palette[(int)s]);
		line(x1, y1, x2, y2);
	}
}