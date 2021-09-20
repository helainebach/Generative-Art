import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.svg.*; 
import java.text.SimpleDateFormat; 
import java.util.Date; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {




float   r;
float   x, y;
boolean exportSVG = false;
String  fileName;
public void setup() {
	
}
public void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
	noFill();
	stroke(0);
//--------------------------------------------
	int count = 10;
	int cell = width / count;
	int area = count * (height / cell);
	translate(cell / 2, cell / 2);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		for (int i = 5; i > 1; i--) {
			star(6, ((cell / 2) / 6) * i, 1.75f, x, y);
			rectMode(CENTER);
		}
		if (x < cell || y < cell) {
			stroke(200, 0, 0);
			rect(x, y, cell, cell);
			stroke(0);
		}
	}
//--------------------------------------------
	if (exportSVG) {
		endRecord();
		exportSVG = false;
	}
}
public void keyPressed() {
	if (key == 'e') {
		exportSVG = true;
	}
}
public void star(int n, float s, float d, float pX, float pY) {
	pushMatrix();
	translate(pX, pY);
	rotate(-PI / 2);
	beginShape();
	for (float a = 0; a < TWO_PI * .99f; a += TWO_PI / n) {
		r = s;
		polar(a);
		vertex(x, y);
		r = r / d;
		polar(a + TWO_PI / (n * 2));
		vertex(x, y);
	}
	endShape(CLOSE);
	popMatrix();
}
public void polar(float a) {
	x = r * cos(a);
	y = r * sin(a);
}
  public void settings() { 	size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
