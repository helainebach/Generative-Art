String pathDATA = "../../../0_data/";
PImage img;
int w = 20;
int o = 25;
void setup() {
	size(600, 600);
	img = loadImage(pathDATA + "photo/fish.png");
	img.resize(width, height);
}
void draw() {
	frameRate(3);
	image(img,0,0);
	for (int i = 0; i < width; i += width / w) {
		copy(img, i, 0, width / w, height, i, (int)random(-o, o), width / w, height);
	}
}