color[] palette = {#000F41,#55FFF5,#1ECD1E,#A500FA,#FA7823,#FFFA37,#DE1C1C};
PFont   anton;
String  pathDATA = "../../../0_data/";
void setup() {
	size(600, 600);
	anton = createFont(pathDATA + "fonts/Anton-Regular.ttf", 36);
	textFont(anton);
	textAlign(CENTER);
	fill(palette[0]);
}
void draw() {
	background(palette[2]);
	dotGrid(30, 3, palette[0]);
	text("THRASIO", mouseX, mouseY);
}
void dotGrid(int count, int dotSize, color c) {
	int cell = width / count;
	int area = count * (height / cell);
	translate(cell, cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		if (x < width - cell && y < height - cell) {
			stroke(c);
			strokeWeight(dotSize);
			point(x, y);
		}
	}
}