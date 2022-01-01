void setup() {
	size(600, 600);
}
void draw() {
	graphPaper();
	strokeWeight(2);
	stroke(255, 0, 0);
	beginShape();
	point(0,150);
	point(mouseX,mouseY);
	point(300,100);
	point(300,200);
	point(mouseX,height-mouseY);
	point(0,150);
	endShape(OPEN);
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		square(x, y, cell);
	}
}
void graphPaper() {
	strokeWeight(1);
	background(255);
	noFill();
	stroke(0, 10);
	grid(width / 10);
	stroke(0, 40);
	grid(width / 50);
}

void point(float x, float y) {
	curveVertex(x, y);
	fill(255,0,0);
	circle(x, y, 10);
	noFill();
}

void mousePressed() {
	println(mouseX,mouseY);
}