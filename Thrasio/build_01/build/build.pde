color[] palette = {#000F41,#FFFFFF,#A500FA,#FBA422,#61FF82,#55FFF5,#FA7823};
float off;
float rate = .05;
void setup() {
	size(600, 600);

}

void draw() {
	background(0);
	circle(width / 2, height / 2, width / 2 * sin(off));
	off += rate;
	if (frameCount > TWO_PI / rate)exit();

}