String pathDATA = "../../../0_data/";
PFont font;
void setup() {
	size(600, 600);
	stroke(0);
	font = createFont(pathDATA + "fonts/Gotham-Bold.otf", 20);
	textFont(font);
	fill(0);
	Tri tri1 = new Tri();
}
void draw() {
	background(255);
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(PI / 3);
	tri1.show();
	// tri();
	popMatrix();

}
// void tri (Array dig) {
// 	beginShape();
// 	fill(0);
// 	for (float a = 0; a < 3; a++) {
// 		float x = r * cos(radians(a * 120));
// 		float y = r * sin(radians(a * 120));
// 		vertex(x, y);
// 	}
// 	endShape(CLOSE);
// 	for (int n = 0; n < 3; n++) {
// 		pushMatrix();
// 		rotate(radians(n * 120));
// 		translate(r * .6, 0);
// 		rotate(radians(-90));
// 		fill(255);
// 		textAlign(CENTER);
// 		text(dig[n], 0, 0);
// 		popMatrix();
// 	}
// }
class Tri {
	float r;
	Tri (float r) {
		r = 100;
	}
	void show() {
		beginShape();
		fill(0);
		for (float a = 0; a < 3; a++) {
			float x = r * cos(radians(a * 120));
			float y = r * sin(radians(a * 120));
			vertex(x, y);
		}
		endShape(CLOSE);
		for (int n = 0; n < 3; n++) {
			pushMatrix();
			rotate(radians(n * 120));
			translate(r * .6, 0);
			rotate(radians(-90));
			fill(255);
			textAlign(CENTER);
			text(n, 0, 0);
			popMatrix();
		}
	}
}