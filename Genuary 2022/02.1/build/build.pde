// Genuary 2022 - Day 02
// Dithering
PImage 	img;
color   newCol;
String  pathDATA 	= "../../../0_data/";
color[] palette 	= {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
color  	bg 			= 0;
int 	factor 		= 6;

void setup() {
	size(1080, 1080);
	background(bg);
}
void draw() {
	img = loadImage(pathDATA + "photo/coral.png");
	img.resize(1080, 1080);
	for (int y = 0; y < img.height; y += factor) {
		for (int x = 0; x < img.width; x += factor) {
			int   index   = index(x, y);
			color pix     = img.pixels[index];
			float minDist = 255 * 255 + 255 * 255 + 255 * 255 + 1;
			for (int i = 0; i < palette.length; i++) {
				float rDiff = red  (pix) - red  (palette[i]);
				float gDiff = green(pix) - green(palette[i]);
				float bDiff = blue (pix) - blue (palette[i]);
				float dist  = rDiff * rDiff + gDiff * gDiff + bDiff * bDiff;
				if (dist < minDist) {
					minDist = dist;
					newCol  = palette[i];
				}
			}
			noStroke();
			fill(newCol);
			rect(x, y, factor, factor);
		}
	}

}
int index (int x, int y) {
	return x + y * img.width;
}
