class Star {
	float x;
	float y;
	float z;
	float pz;
	float rate;
	color c;

	Star() {
		x    = random(width / 4, width) * random(-2, 2);
		y    = random(height / 4, height) * random(-2, 2);
		z    = random(width);
		rate = map(z, 0, width, 12, 4);
		pz   = z;
		c    = palette[(int)random(palette.length)];
	}
	void update() {
		z = z - rate;
		if (z < 1) {
			z  = random(width);
			x  = random(width / 4, width) * random(-2, 2);
			y  = random(height / 4, height) * random(-2, 2);
			pz = z;

		}
	}
	void show() {
		fill(c);
		noStroke();
		float sx = map(x / z, 0, 1, 0, width);
		float sy = map(y / z, 0, 1, 0, width);
		float r  = map(z, 0, width, 8, 0);
		circle(sx, sy, r);
		float px = map(x / pz, 0, 1, 0, width);
		float py = map(y / pz, 0, 1, 0, width);
		stroke(c, 50);
		strokeWeight(map(z, 0, width, 0, 4));
		line(px, py, sx, sy);
	}
}