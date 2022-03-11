void setup() {
	size(825, 825, P2D);
	background(255);
	octGuides(800);
}
void octGuides(int u) {
	noFill();
	stroke(200);
	pushMatrix();
	translate(width / 2, height / 2);
	rectMode(CENTER);
	square(0, 0, u);
	line(0     ,	-u / 2,		0     ,     u / 2);
	line(-u / 2,	0     ,		u / 2 ,  	0    );
	line(-u / 2,	-u / 2,		u / 2 ,   	u / 2);
	line(u / 2 ,	-u / 2,		-u / 2, 	u / 2);
	popMatrix();
}