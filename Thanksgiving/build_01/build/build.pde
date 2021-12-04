color[] palette = {#432009,#512D15,#E4A83B,#75AD2D,#2DAD91,#2B4CA6,#622BA6};
void setup() {
	size(600, 600);
}
void draw() {
	background(#152715);
	// int count = 3;
	// int area = count * count;
	// int cell = width / count;
	// for (int n = 0; n < area; n++) {
	// 	int x = (n % count) * cell;
	// 	int y = (n / count) * cell;
	// 	turkey(x+cell/2, y+cell/2, cell/5);
	// }
	turkey(mouseX,mouseY,100);
}
void turkey(float x, float y, float s) {
	float mY = map(y, 0, height, 9, 20);
	float mX = map(x, 0, width, mY, mY * 2);
	stroke(0);
	strokeWeight(5);
	line(x - s / 5, y, 			x - s / 5, y + s * .75);
	line(x - s / 5, y + s * .6, x - s / 5 + s / 10, y + s * .7);
	line(x - s / 5, y + s * .6, x - s / 5 - s / 10, y + s * .7);
	line(x + s / 5, y, 			x + s / 5, y + s * .75);
	line(x + s / 5, y + s * .6, x + s / 5 + s / 10, y + s * .7);
	line(x + s / 5, y + s * .6, x + s / 5 - s / 10, y + s * .7);
	noStroke();
	ellipseMode(CORNER);
	for (int i = 0; i < mY; i++) {
		fill(palette[2 + i % (palette.length - 2)]);
		pushMatrix();
		translate(x, y);
		rotate(PI + ((PI / mX) * i));
		ellipse(- s / 6, 0, s / 3, s * 2);
		popMatrix();
		pushMatrix();
		translate(x, y);
		rotate(PI + (PI / mX) * -i);
		ellipse(- s / 6, 0, s / 3, s * 2);
		popMatrix();
	}
	ellipseMode(CENTER);
	fill(palette[0]);
	circle(x, y, s);
	fill(palette[1]);
	circle(x, y - s / 2, s / 2);
	fill(0);
	circle(x - s / 10, y - s / 2, s / 15);
	circle(x + s / 10, y - s / 2, s / 15);
	translate(0, s / 20);
	fill(palette[2]);
	triangle(x - s / 20, y - s / 2, x + s / 20, y - s / 2, x, y - s / 2 + s / 10);
}