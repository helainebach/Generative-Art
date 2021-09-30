import processing.svg.*;
String[] 	code;
String 		path;
PFont 		ubuntu;
void setup() {
	size(400, 500);
	ubuntu = createFont("../../../0_data/fonts/ubuntu.ttf", 10);
	path   = "shofar";
	code   = loadStrings(path + ".txt");
}
void draw() {
	beginRecord (SVG, "../output/" + path + ".svg");
	background  (255);
	textAlign   (LEFT, TOP);
	textFont    (ubuntu);
	fill(0);
	int y = 0;
	for (String line : code) {
		text(line, 10, 10 + y);
		y += textAscent() + textDescent() + 2;
	}
	endRecord();
}