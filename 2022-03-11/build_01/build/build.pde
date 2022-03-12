color[] palette = {#5b5f97, #ffc145, #b8b8d1};
int p = palette.length;
void setup() {
	size(600, 600);
	noFill();
}
void draw () {
	frameRate(2);
	background(#ff6b6c);
	for (int i = 0; i < 5; i++) {
		target(random(width), random(height), (int)random(2, 6), (int)random(20, 50));
	}
}
void target(float x, float y, int l, int stroke) {
	strokeWeight(stroke);
	int c = (int)random(p);
	for (int i = 1; i <= l; i++) {
		stroke(palette[(c + i) % p]);
		circle(x, y, i * stroke * 2);
	}
}