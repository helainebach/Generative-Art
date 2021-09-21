int [] 	rand 		 = new int[4];
int     count 		 = 100;
PImage  myColor;
color[] pickedColors = new color[count];
String 	pathDATA 	 = "../../../0_data/";

float off = 0.0;
void setup() {
	myColor = loadImage(pathDATA + "gradientStrip/rainbow_01.png");
	getColors();
	size(600, 600);
	rands();
	background(0);
	// noStroke();
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
	off += .05;
}
void quad() {
	fill(myColor.get(frameCount*10%myColor.width, 1 ));
	rect(width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3], 100 * rand[2], 100 * rand[1], 30);
}
void rands() {
	for (int i = 0; i < 4; i++) {
		rand[i] = (int) random(1, 4);
	}
}
void getColors() {
	for (int i = 0; i < count; ++i) {
		pickedColors[i] = myColor.get(Math.round( (int)random(myColor.width) ), 1 );
	}
}
import java.text.SimpleDateFormat;
import java.util.Date;
void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/coloredSquares/" + fileName);
		rands();
		background(0);
		break;
	case 'o':
		rands();
		background(0);
		break;
	}
}
