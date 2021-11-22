ArrayList <Box> boxes  = new ArrayList <Box> ();
String 	pathDATA        = "../../../0_data/";
String 	[] mashTitle    = {"M", "A", "S", "H"};
int    	rand  = 6;
int 	count = 1;
PFont 	font;
Table  	mash;
void setup() {
	size(500, 800);
	font = createFont(pathDATA + "fonts/Rubik-Medium.ttf", 100);
	mash = loadTable("mash.csv");
}
void draw() {
	// frameRate(3);
	background(255);
	title();
	list(50,  300, 1);
	list(50,  550, 2);
	list(300, 50,  3);
	list(300, 300, 4);
	list(300, 550, 5);
	buildBoxes();
	// Box s2 = boxes2.get(count % boxes2.size());
	Box s1 = boxes.get(count % boxes.size());
	boxes.remove(count % boxes.size());
	for (Box box : boxes) {
		box.display();
	}
	count++;
}

void title() {
	fill(0);
	pushMatrix();
	translate(width / 2, height / 5);
	for (int i = 0; i < mashTitle.length; i++) {
		textFont(font, 50);
		textAlign(CENTER, CENTER);
		text(mashTitle[i], 0, i * height / 5);
	}
	popMatrix();
	text(rand, 100, 125);
}
void list(float x, float y, int n) {
	stroke(0);
	pushMatrix();
	translate(x, y);
	for (int i = 0; i < 5; i++) {
		textAlign(LEFT, TOP);
		textSize(20);
		if (i == 0) {
			String cat = mash.getString(0, n - 1);
			text(cat, 0, 0);
		} else {
			String s = mash.getString(i, n - 1);
			text(s, 6, 3);
		}
		translate(0, height / 19);
	}
	popMatrix();
}

void mousePressed() {
	boxes.remove(boxes.size()-1);

}

void buildBoxes() {
	boxes.add(new Box(50,  342, 150, (height / 19) * .75));
	boxes.add(new Box(50,  384, 150, (height / 19) * .75));
	boxes.add(new Box(50,  426, 150, (height / 19) * .75));
	boxes.add(new Box(50,  468, 150, (height / 19) * .75));
	boxes.add(new Box(50,  592, 150, (height / 19) * .75));
	boxes.add(new Box(50,  634, 150, (height / 19) * .75));
	boxes.add(new Box(50,  676, 150, (height / 19) * .75));
	boxes.add(new Box(50,  718, 150, (height / 19) * .75));
	boxes.add(new Box(300, 92,	150, (height / 19) * .75));
	boxes.add(new Box(300, 134, 150, (height / 19) * .75));
	boxes.add(new Box(300, 176, 150, (height / 19) * .75));
	boxes.add(new Box(300, 218, 150, (height / 19) * .75));
	boxes.add(new Box(300, 342, 150, (height / 19) * .75));
	boxes.add(new Box(300, 384, 150, (height / 19) * .75));
	boxes.add(new Box(300, 426, 150, (height / 19) * .75));
	boxes.add(new Box(300, 468, 150, (height / 19) * .75));
	boxes.add(new Box(300, 592, 150, (height / 19) * .75));
	boxes.add(new Box(300, 634, 150, (height / 19) * .75));
	boxes.add(new Box(300, 676, 150, (height / 19) * .75));
	boxes.add(new Box(300, 718, 150, (height / 19) * .75));
}