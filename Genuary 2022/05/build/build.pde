// Genuary 2022 - Day 05
// Destroy a square.

color[] palette  	= {#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B};
color  	bg 			= palette[0];
color  	fg 			= palette[3];
void setup() {

	size(450, 450);
}

void draw() {
	background(bg);
	fill(fg);
	noStroke();
	rectMode(CENTER);
	destroy();
	square(width / 2, height / 2, width * .75);
}

void destroy() {

	// I'm suposed to destroy this sqaure today,
	// but I needed something to go right.

}