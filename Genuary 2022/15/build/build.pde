color[] palette  	= {#03A08F,#0160B6,#FFDD5E,#FFA051,#FF3C1B};
int  [][] sandpiles;
void setup() {
	size(600, 600);
	sandpiles = new int[width][height];
	sandpiles[width / 2][height / 2] = 800000;
}
void draw() {
	frameRate(1);
	background(palette[0]);
	scale(2);
	show();
}
void topple() {
	int [][] nextpiles = new int[width][height];
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			int num = sandpiles[x][y];
			if (num < 16) {
				nextpiles[x][y] = sandpiles[x][y];
			}
		}
	}
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			int num = sandpiles[x][y];
			if (num >= 16) {
				nextpiles[x][y] += (num - 16);
				if (x + 1 < width)
					nextpiles[x + 1][y]+=4;
				if (x - 1 >= 0)
					nextpiles[x - 1][y]+=4;
				if (y + 1 < height)
					nextpiles[x][y + 1]+=4;
				if (y - 1 >= 0)
					nextpiles[x][y - 1]+=4;
			}
		}
	}
	sandpiles = nextpiles;
}
void render() {
	pushMatrix();
	scale(5.0);
	loadPixels();
	for (int x = 0; x < width; x++) {
		for (int y = 0; y < height; y++) {
			int num = sandpiles[x][y];
			color col = palette[(1 + num) % palette.length];
			pixels[x + y * width] = col;
		}
	}
	updatePixels();
	popMatrix();
}
void show(){
	render();
	for (int i = 0; i < 1000; i++) {
		topple();
	}
}