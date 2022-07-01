color  c1 = 255;
color  c2 = 0;
void setup() {
	size(100, 100);
	for (int y = 0; y < height; ++y) {
		for (int x = 0; x < width; x++) {
			color c = lerpColor(c1, c2, map(y,0,height,0,1));
			stroke(c);
			point(x, y);
		}
	}
}