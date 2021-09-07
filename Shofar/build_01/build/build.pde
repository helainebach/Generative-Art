float u = 200;
float uL, uG;
void setup() {
	size(600, 800);
	background(255);
}
void draw() {
	stroke(0);
	strokeWeight(5);
	translate (u / 3, u / 3); 		tekiah();
	translate (0, u / 3); 			shevarim();
	translate (u * 1.25, 0);		teruah();
	translate (-u * 1.25, u / 3);	tekiah();
	translate (0, u / 2);			tekiah();
	translate (0, u / 3);			shevarim();
	translate (0, u / 3);			tekiah();
	translate (0, u / 2);			tekiah();
	translate (0, u / 3);			teruah();
	translate (0, u / 3);			tekiahGdola();
}
void tekiah() {
	line(0, 0, u, 0);
}
void shevarim() {
	uL = u  / 4;
	uG = uL / 2;
	for (int i = 0; i < 3; i++) {
		line(i * uL + i * uG, 0, (i * uL + i * uG) + uL, 0);
	}
}
void teruah() {
	uL = u / 17;
	uG = uL;
	for (int i = 0; i < 9; i++) {
		line(i * uL + i * uG, 0, (i * uL + i * uG) + uL, 0);
	}
}
void tekiahGdola() {
	line(0, 0, u * 2.25, 0);
}