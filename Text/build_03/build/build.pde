String  txt 		 = "Hello World!";
float 	rate 	 = .005;
float 	n 		 = TWO_PI / rate;
float   off;
color 	c;
color[] palette  = {#E145E5,#FBDD73,#4F97F1,#B9CCE3};
String  pathDATA = "../../../0_data/";
PFont  	font;
void setup() {
	size(600, 600);
	frameRate(30);
	font = createFont(pathDATA + "fonts/Gotham-Bold.otf", 50);
	textFont (font);
	textAlign(CENTER, CENTER);
	// noLoop();
	colorMode(HSB);
}
void draw() {
	frameRate(3);
	background(0);
	char c = (char) int(random(33, 127));
	// text(c, width / 2, width / 2);
	grid(10);
	// off += rate;
}

void grid(int count) {
	int cell = width / count;
	int area = count * (height / cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		char c = (char) int(random(33, 127));
		fill(n * 2 % 255, 255, 255);
		text(c, x + cell / 2, y + cell / 2);
	}
}

void mousePressed() {
	redraw();
}