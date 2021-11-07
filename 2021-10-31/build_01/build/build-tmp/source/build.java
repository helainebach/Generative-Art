import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

String pathDATA = "../../../0_data/";
PShape flower;
PShape one;
PShape two;
PShape three;
float off = 0;
float rate = PI/20;
int h;
int r;

public void setup() {
	
	// frameRate(2);
	shapeMode(CENTER);
	colorMode(HSB);
	flower = loadShape(pathDATA + "svg/flower.svg");
	one    = flower.getChild("one");
	two    = flower.getChild("two");
	three  = flower.getChild("three");
	one    .disableStyle();
	two    .disableStyle();
	three  .disableStyle();
	flower .disableStyle();
}
public void draw() {
	frameRate(30);
	float x = width / 2 + sin(off) * width / 2;
	float y = height / 2 + cos(off) * height / 2;
	h = (int)map(x, 0, width, 100, 200);
	r = (int)map(y, 0, width, 25, 100);
	background(0xff0A131F);
	checkerboard(3);
	fill(255);
	off += rate;
	if (frameCount % Math.ceil(TWO_PI / rate) == 0) {
		exit();
	}
	// saveFrame("../exports/frames/###.png");


}

public void flower(float x, float y, float s, int h) {
	int c1 = color(h + 50, 255, 100);
	int c2 = color(h, 150, 150);
	int c3 = color(h - 50, 100, 255);
	pushMatrix();
	translate(x, y);
	scale(s / flower.width);
	fill(c1);
	shape(three, 0, 0);
	fill(c2);
	shape(two, 0, 0);
	fill(c3);
	shape(one, 0, 0);
	noFill();
	stroke(0xff0A131F);
	shape(flower, 0, 0);
	popMatrix();
}

public void mousePressed() {
	// h = (int)random(100, 300);

}

public void checkerboard(int c) {
	int cell = width / c;
	for (int x = cell / 2; x < width; x = x + cell) {
		if (x / (cell) % 2 == 0) {
			for (int y = cell / 2; y < height; y = y + cell) {
				if (y / (cell) % 2 == 0) {
					flower(x, y, cell * .9f, h);

				} else {
					flower(x, y, cell * .6f, h + r);

				}
			}
		} else {
			for (int y = cell / 2; y < height; y = y + cell) {
				if (y / (cell) % 2 == 0) {
					flower(x, y, cell * .6f, h + r);

				} else {
					flower(x, y, cell * .9f, h);

				}
			}
		}
	}
}
  public void settings() { 	size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
