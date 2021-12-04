color[] palette = {#75AD2D,#2DAD91,#2B4CA6,#622BA6};
float m = 20;
void setup() {
	size(600, 600);
}
void draw() {
	background(#152715);
	pushMatrix();
	translate(width / 2, height / 2);
	float r = mouseX * mouseY;
	rotate(map(r, 0, width * height, 0, TWO_PI));
	flower(0, 0, map(mouseY, 0, height, 20, 50));
	popMatrix();
}
void flower(float x, float y, float s) {
	noStroke();
	ellipseMode(CORNER);
	for (int i = 0; i < m; i++) {
		fill(palette[i % (palette.length)]);
		pushMatrix();
		translate(x, y);
		rotate((TWO_PI / m) * i);
		ellipse(- s / 6, 0, s / 2, s * 2);
		popMatrix();
	}
	ellipseMode(CENTER);
	fill(#E4A83B);
	circle(x, y, s);
}
void mousePressed() {
	m--;
}