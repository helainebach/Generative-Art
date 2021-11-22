class Box {
	float x, y, w, h;
	Box (float _x, float _y, float _w, float _h) {
		w = _w;
		h = _h;
		x = _x;
		y = _y;
		noFill();
	}
	void display() {
		stroke(0);
		strokeWeight(1);
		rect(x, y, w, h);
	}
	void crossOut() {
		fill(0);
		rect(x, y, w, h);
	}
	void select() {
		noFill();
		stroke(255, 0, 0);
		strokeWeight(3);
		rect(x, y, w, h);
	}
}