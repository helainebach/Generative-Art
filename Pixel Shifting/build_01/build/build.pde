String pathDATA = "../../../0_data/";
PImage img;
float  off = 0;
void setup() {
	size(600, 600);
	img = loadImage(pathDATA + "photo/fish.png");
	img.resize(width, height);
}
void draw() {
	float x = sin(off)*width-200;
	image(img, 0, 0);
	copy(img, (int)x, 0, 1, height, (int)x, 0, 200, height);
	off = off + .01;
}