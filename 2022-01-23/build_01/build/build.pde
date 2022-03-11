color bg = 255;
color fg = 0;
int   steps = 3;
void setup() {
	size(600, 600);
	noFill();
}
void draw() {
	background(bg);
	pushMatrix();
	translate(width / 2, height / 2);
	arc(0, 0, width, height, 0, PI / 2);
	beginShape();
	pushMatrix();
	translate(width / 2, 0);
	vertex(mouseX, 0);
	translate(-width / 2 / steps, 0);
	vertex(0, 0);
	endShape();
	popMatrix();
	popMatrix();
}