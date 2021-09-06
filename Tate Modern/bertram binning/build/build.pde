//Inspired by: Bertram Binning Merging Sides 1967/8
void setup() {
	size(730, 600);
	noStroke();
}
void draw() {
	background(255);
	fill(255, 0, 0);
	rect(0, 0, width / 4, height);
	for (int i = 0; i < 9; i++) {
		ellipseMode(CENTER);
		circle(width / 4 + 40, i * height / 8, 60);
	}
	for (float i = .5; i < 8; i++) {
		ellipseMode(CENTER);
		circle(width / 4 + 110, i * height / 8, 60);
	}
	for (int i = 0; i < 9; i++) {
		if (i % 2 == 0) {fill(255, 0, 0);} else {fill(#0D7E24);};
		ellipseMode(CENTER);
		circle(width / 2, i * height / 8, 60);
	}
	for (float i = .5; i < 8; i++) {
		fill(#0D7E24);
		ellipseMode(CENTER);
		circle(width / 2 + 70, i * height / 8, 60);
	}
	for (int i = 0; i < 9; i++) {
		fill(#0D7E24);
		ellipseMode(CENTER);
		circle(width - width / 4 - 40, i * height / 8, 60);
	}
	fill(#0D7E24);
	translate(width - width / 4, 0);
	rect(0, 0, width / 4, height);
}