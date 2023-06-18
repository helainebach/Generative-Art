// Write a program that prints the numbers from 1 to 100
// But for multiples of three print “Fizz” instead of the number
// for the multiples of five print “Buzz”
// For numbers which are multiples of both three and five print “FizzBuzz”
color[] palette = {#FFFFFF,#BFBFBF,#808080,#404040,#000000};
//
PFont 	myFont;
String 	s;
color 	bg = palette[0];
color 	c;
IntList squares;
//
boolean text = false;
int 	total = 900;
int 	t = 100;
int 	sq = 1;
//
void setup() {
	size(1000, 1000);
	noStroke();
	rectMode(CENTER);
	squares = new IntList();
	sqrtList();
}
void draw() {
	background(bg);
	if (sq == squares.size()) {
		sq = 1;
	}
	if (sq <= 0) {
		sq = squares.size()-1;
	}
	t = squares.get(sq);
	int count  = (int)Math.sqrt(t);
	int cell   = width / count;
	for (int n = 0; n <= t; n++) {
		int x = (n % count) * cell + cell / 2;
		int y = (n / count) * cell + cell / 2;
		fill(0);
		int i = n + 1;
		if (i % 3 == 0 && i % 5 == 0) {
			s = "FIZZ\nBUZZ";
			c = palette[1];
		} else if (i % 3 == 0) {
			s = "FIZZ";
			c = palette[2];
		} else if (i % 5 == 0) {
			s = "BUZZ";
			c = palette[3];
		} else {
			s = str(i);
			c = palette[4];
		}
		fill(c);
		square(x, y, cell);
		if (text) {
			int f = (int)cell / 3;
			if (f < 10) {
				myFont = createFont("Gotham", cell / 3);
			} else {
				myFont = createFont("Gotham-Bold", cell / 3);
			}
			textFont(myFont);
			textAlign(CENTER, CENTER);
			fill(bg);
			text(s, x, y);
		}
	}
}
void sqrtList() {
	for (int n = 0; n <= total; n++) {
		int square = (int)Math.sqrt(n);
		if (square * square == n) {
			squares.append(n);
		}
	}
}

void keyPressed() {
	if (key == CODED) {
		if (keyCode == UP) {
			sq++;
		} else if (keyCode == DOWN) {
			sq--;
		} else if (keyCode == LEFT) {
			text = true;
		} else if (keyCode == RIGHT) {
			text = false;
		}
	}
}
