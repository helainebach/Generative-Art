ArrayList <Poly> polys  = new ArrayList <Poly> ();
void setup() {
	size(500, 500);
	noFill();
	for (int i = 0; i < 10; i++) {
		polys.add(new Poly(+i * width / 10, random(100,height-100), (width / 10) * .75, (width / 10) * .75, 3));
	}
}
void draw() {
	frameRate(10);
	background(255);
	for (Poly poly : polys) {
		pushMatrix();
			translate(5,0);
			poly.display();
		popMatrix();
	}
}
