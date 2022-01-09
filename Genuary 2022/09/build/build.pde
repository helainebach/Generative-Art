color bg  = #0160B6;
color fg  = 255;
float off = 0.0;
void setup() {
	size(1000, 1000);
	stroke(fg);
}
void draw() {
	background(bg);
	pushMatrix();
	margin(.9);

	noFill();
	stroke(255);
	strokeWeight(1);
	grid(10);
	
	strokeWeight(.25);
	grid(50);
	
	strokeWeight(5);
	rect(0, 0, width, width);
	
	strokeWeight(3);
	boxes();
	

	popMatrix();
	off += .005;
	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength*fps) exit();
}
void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		square(x, y, cell);
	}
}

void boxes() {
	int res = width / 25;
	for (int y = 0; y < height; y += res) {
		for (int x = 0; x < width; x += res) {
			float n = noise(x, y, off);
			if (n < .25) {
				noStroke();
				fill(255);
				square(x, y, res);
			}
			if (n > .65 && x < width - res * 2 && y < height - res * 2) {
				stroke(255);
				noFill();
				square(x, y, res * 2);
			}
		}
	}
}

void margin(float scl) {
	scale(scl);
	translate((width - width * scl) / 2, (height - height * scl) / 2);
}