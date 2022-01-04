// Genuary 2022 - Day 02
// Dithering
String  pathDATA 	= "../../../0_data/";
color[] palette 	= {#2E294E,#F1E9DA,#541388,#FFD400,#D90368};
color  	bg 			= palette[0];
color  	fg 			= palette[1];
PImage 	img;
void setup() {
	size(1200, 600);
	img = loadImage(pathDATA + "photo/fish.png");
	// img.filter(GRAY);
	image(img, 0, 0, width / 2, height);
}
void draw() {
	img.loadPixels();
	for (int y = 0; y < img.height - 1; y++) {
		for (int x = 1; x < img.width - 1; x++) {
			
			int   factor = 1;
			color pix = img.pixels[index(x, y)];

			float oldR = red(pix);
			float oldG = green(pix);
			float oldB = blue(pix);

			int   newR = round(factor * oldR / 255) * (255 / factor);
			int   newG = round(factor * oldG / 255) * (255 / factor);
			int   newB = round(factor * oldB / 255) * (255 / factor);

			img.pixels[index(x, y)] = color(newR, newG, newB);

			float errR = oldR - newR;
			float errG = oldG - newG;
			float errB = oldB - newB;

			int   index = index(x + 1, y    );
			color c = img.pixels[index];
			float r = red(c);
			float g = green(c);
			float b = blue(c);
			r = r + errR * 7 / 16.0;
			g = g + errG * 7 / 16.0;
			b = b + errB * 7 / 16.0;
			img.pixels[index] = color(r, g, b);

			index = index(x - 1, y + 1);
			c = img.pixels[index];
			r = red(c);
			g = green(c);
			b = blue(c);
			r = r + errR * 3 / 16.0;
			g = g + errG * 3 / 16.0;
			b = b + errB * 3 / 16.0;
			img.pixels[index] = color(r, g, b);

			index = index(x, 	y + 1);
			c = img.pixels[index];
			r = red(c);
			g = green(c);
			b = blue(c);
			r = r + errR * 5 / 16.0;
			g = g + errG * 5 / 16.0;
			b = b + errB * 5 / 16.0;
			img.pixels[index] = color(r, g, b);

			index = index(x + 1, y + 1);
			c = img.pixels[index];
			r = red(c);
			g = green(c);
			b = blue(c);
			r = r + errR * 1 / 16.0;
			g = g + errG * 1 / 16.0;
			b = b + errB * 1 / 16.0;
			img.pixels[index] = color(r, g, b);

		}
	}
	img.updatePixels();
	image(img, width / 2, 0, width / 2, height);
}

int index (int x, int y) {
	return x + y * img.width;
}
