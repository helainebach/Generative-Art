int [] 	rand 		 = new int[6];
PImage  myColor;
String 	pathDATA 	 = "../../../0_data/";
float   r;
float   x, y;

float off = 0.0;
void setup() {
	myColor = loadImage(pathDATA + "gradientStrip/rainbow_01.png");
	size(600, 600);
	rands();
	background(0);
	// noStroke();
	strokeWeight(3);
}
void draw() {
	// star(10,20,2,mouseX,mouseY);
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
	off += .05;
}
void quad() {
	fill(myColor.get(frameCount * 10 % myColor.width, 1 ));
	// rect(width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3], 100 * rand[2], 100 * rand[1], 30);
	star(rand[4], (width / 5) * rand[0], .5 + (1 / rand[5]), width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3]);
}
void rands() {
	for (int i = 0; i < 4; i++) {
		rand[i] = (int) random(1, 4);
	}
	rand[4] = (int) random(4, 10);
	rand[5] = (int) random(1, 3);
}
import java.text.SimpleDateFormat;
import java.util.Date;
void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stars/" + fileName);
		rands();
		background(0);
		break;
	case 'o':
		rands();
		background(0);
		break;
	}
}

void star(int n, float s, float d, float pX, float pY) {
	pushMatrix();
	translate(pX, pY);
	rotate(-PI / 2);
	beginShape();
	for (float a = 0; a < TWO_PI * .99; a += TWO_PI / n) {
		r = s;
		polar(a);
		vertex(x, y);
		r = r / d;
		polar(a + TWO_PI / (n * 2));
		vertex(x, y);
	}
	endShape(CLOSE);
	popMatrix();
}
void polar(float a) {
	x = r * cos(a);
	y = r * sin(a);
}
