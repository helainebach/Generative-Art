class Box  {
	float x, y, w, h;
	color c;
	Box (float _x, float _y, float _w, float _h) {
		x = _x;
		y = _y;
		w = _w;
		h = _h;
		c = color(random(255),random(255),random(255));
		display();
	}
	void display() {
		fill(255);
		rect(x, y, w, h);
	}
	void update(){
		randomSeed(299);
		fill(c);
		rect(x, y, w, h);
	}
}