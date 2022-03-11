/*
1
9
25
49
81
121
169
225
289
361
441
529
625
*/

boolean guide 		= false;
int 	total 		= 348;
//
int 	state 		= 0;
int 	step 		= 1;
int 	numSteps 	= 1;
int 	turnCounter = 1;
float 	x, y, stepSize, u;
String 	path = "../data/photos/";
PImage[]images = new PImage[total + 1];
//
void setup() {
	size(1080, 1080);
	noLoop();
	noStroke();
	rectMode(CENTER);
	u = sqrt(nextOddSquare(total));
	stepSize = width / u;
	loadImages();
	imageMode(CENTER);
}
//
void draw() {
	spiral();
	saveFrame("../exports/scale build/" + nextOddSquare(total) + ".png");
	exit();
}
//
void loadImages() {
	for (int i = 1; i <= total; i++) {
		if (i < 10) {
			images[i] = loadImage(path + "00" + i + ".jpg");
		} else if (i < 100 && i >= 10) {
			images[i] = loadImage(path + "0" + i + ".jpg");
		} else {
			images[i] = loadImage(path + i + ".jpg");
		}
	}
}
//
void spiral() {
	x = width / 2;
	y = height / 2;
	while (step <= nextOddSquare(total)) {
		unit(x, y, stepSize, step);
		switch (state) {
		case 0:
			x += stepSize;
			break;
		case 1:
			y -= stepSize;
			break;
		case 2:
			x -= stepSize;
			break;
		case 3:
			y += stepSize;
			break;
		}
		if (step % numSteps == 0) {
			state = (state + 1) % 4;
			turnCounter++;
			if (turnCounter % 2 == 0) {
				numSteps++;
			}
		}
		step++;
	}
}
void unit(float x, float y, float s, int step) {
	if (step > total) {
		step = (step % total);
	} else {
		step = step;
	}
	if (images[step] != null) {
		images[step].resize((int)s + 1, (int)s + 1);
		image(images[step], x, y);
	} else {
		println("fail");
	}
	// fill(color(random(255), random(255), random(255)));
	// rect(x, y, s, s);
	// textAlign(CENTER, CENTER);
	// textSize(s / 2);
	// fill(255);
	// text(step, x, y);
}
int nextOddSquare(int n) {
	while (n % 2 == 0 || sqrt(n) != Math.floor(sqrt(n))) {
		n++;
	}
	return n;
}
