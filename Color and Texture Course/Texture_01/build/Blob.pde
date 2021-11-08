class Blob {

	color   c;
	int     res;
	float   [] x, y;
	float   r, slice, off, cx, cy;
	boolean wonky = true;

	Blob (int _res, float _cx, float _cy ) {
		r     = random(20, 80);
		res   = _res;
		x     = new float[res];
		y     = new float[res];
		cx    = _cx;
		cy    = _cy;
		slice = radians(360 / res);
		off   = r * .2;
		c     = palette[(int)random(1, palette.length)];
		init();
		noStroke();
	}

	void init() {
		for (int i = 0; i < res; i++) {
			float angle = i * slice;
			if (wonky == true) {
				x[i] = cx + cos(angle) * r + random(-off, off);
				y[i] = cy + sin(angle) * r + random(-off, off);
			} else {
				x[i] = cx + cos(angle) * r;
				y[i] = cy + sin(angle) * r;
			}
		}
	}

	void display() {
		fill(c);
		beginShape();
		curveVertex(x[res - 1], y[res - 1]);
		for (int i = 0; i < res; i++) {
			strokeWeight(1);
			curveVertex(x[i], y[i]);
		}
		curveVertex(x[0], y[0]);
		curveVertex(x[1], y[1]);
		endShape();
	}

	boolean collide(Blob other) {
		float d = dist(cx, cy, other.cx, other.cy);
		if (d < r + other.r * 1.5) {
			return true;
		} else {
			return false;
		}
	}
}