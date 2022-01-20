color[] palette = {#000F41,#55FFF5,#1ECD1E,#A500FA,#FA7823,#FFFA37,#DE1C1C};
PFont anton;
String pathDATA = "../../../0_data/";

void setup() {
	size(600,600);
	anton = createFont(pathDATA+"fonts/Anton-Regular.ttf",36);
}

void draw() {
	background(palette[0]);
	textFont(anton);
	textAlign(CENTER);

	text("THRASIO", mouseX, mouseY);
}