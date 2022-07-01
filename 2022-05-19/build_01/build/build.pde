color  bg = 255;
color  fg = 0;
String pathDATA = "../../../0_data/";

PImage img;

void setup() {
	size(600, 600, P2D);
	img = loadImage(pathDATA + "photo/fish.png");
	img.resize(width, height);
}

void draw() {
	image(img, 0, 0);
}
