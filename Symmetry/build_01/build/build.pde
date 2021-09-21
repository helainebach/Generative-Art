float off = 0.0;
void setup() {
	size(600, 600);
	rands();
	background(255);
	strokeWeight(3);
}
void draw() {
	pushMatrix();
	scale(.5);
	quad();
	popMatrix();
	pushMatrix();
	scale(.5);
	translate(width * 2, 0);
	rotate(PI / 2);
	quad();
	popMatrix();
	pushMatrix();
	scale(.5);
	translate(width * 2, height * 2);
	rotate(PI);
	quad();
	popMatrix();
	pushMatrix();
	scale(.5);
	translate(0, height * 2);
	rotate(-PI / 2);
	quad();
	popMatrix();
	off += .03;
}
void quad() {
	rect(width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3], 100 * rand[2], 100 * rand[1], 10);
	// rose(width / 2 + rand[0], height / 2 + rand[1], rand[2], rand[3], width / 2 * rand[4]);
}
void rands() {
	// rand[0] = (int) random(-width / 3, width / 3);
	// rand[1] = (int) random(-width / 3, width / 3);
	// rand[2] = (int) random(1, 7);
	// rand[3] = (int) random(1, 9);
	// rand[4] = (int) random(1, 5);
	for (int i = 0; i < 4; i++) {
		rand[i] = (int) random(1, 4);
	}
}
import java.text.SimpleDateFormat;
import java.util.Date;
void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/squares/" + fileName);
		rands();
		background(255);
		break;
	case 'o':
		rands();
		background(255);
		break;
	}
}
void rose(float px, float py, float n, float d, float rad) {
	pushMatrix();
	translate(px, py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI * d; a += .01) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x, y);
	}
	endShape(OPEN);
	popMatrix();
}