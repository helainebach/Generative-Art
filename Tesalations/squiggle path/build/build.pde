int u, l,  lnS, lnE, pl, c;
int rand = (int)random(1000);
void setup() {
	size(825, 825, P2D);
}
void draw() {
	background(255);
	octGuides(800);
	u = width / 25;
	c = width / 2;
	for (int y = u; y < height; y += u) {
		randomSeed(y * 1000* rand);
		// l = (int)random(1, 24);
		l = (int)random(1, 24);
		if (y % 2 != 0) {
			lnS =  c - (pl / 2) * u;
			lnE =  c + (l  / 2) * u;
			line(lnS, y, lnE, y);
			if (y < height - u) {
				arc(lnE, y + (u / 2), u, u, -PI / 2, PI / 2);
			}
		} else {
			lnS =  c + (pl / 2) * u;
			lnE =  c - (l  / 2) * u;
			line(lnS, y, lnE, y);
			if (y < height - u) {
				arc(lnE, y + (u / 2), u, u, PI / 2, PI + PI / 2);
			}
		}
		pl = l;
	}
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

void keyPressed(){

	if (key == 'r'){
  		rand = (int)random(1000);
  	}
}

