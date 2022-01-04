String  pathDATA 	= "../../../0_data/";
color[] palette 	= {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B,255,255,255};
color  	bg 			= 0;
float 	off 		= 0.0;
float 	rate 		= 0.005;
Star [] stars = new Star[1500];
PFont   font;
void setup() {
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 100);
	size(600, 600);
	for (int i = 0; i < stars.length; i++) {
		stars[i] = new Star();
	}
}
void draw() {
	background(bg);
	translate(width / 2, height / 2);
	rotate(off);
	for (int i = 0; i < stars.length; i++) {
		stars[i].update();
		stars[i].show();
	}
	off+=rate;

	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength*fps) exit();
}