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

ArrayList <Poly> polys  = new ArrayList <Poly> ();
public void setup() {
	
	noFill();
	for (int i = 0; i < 10; i++) {
		polys.add(new Poly(+i * width / 10, random(100,height-100), (width / 10) * .75f, (width / 10) * .75f, 3));
	}
}
public void draw() {
	frameRate(10);
	background(255);
	for (Poly poly : polys) {
		pushMatrix();
			translate(5,0);
			poly.display();
		popMatrix();
	}
}
class Poly {
	int res;
	float x, y, w, h;
	Poly (int _res) {
		res = _res;
		w = random(20, 100);
		h = w;
		x = random(width);
		y = random(height);
	}
	Poly (float _x, float _y, float _w, float _h, int _res) {
		res = _res;
		w   = _w;
		h   = _h;
		x   = _x;
		y   = _y;
	}
	public void display() {
		noFill();
		stroke(0);
		wave(x,      y,      x + w,  y,      res);
		wave(x + w,  y,      x + w,  y + h,  res);
		wave(x + w,  y + h,  x,      y + h,  res);
		wave(x,      y + h,  x,      y,      res);
	}
	public void wave(float x1, float y1, float x2, float y2, int res) {
		float w = x2 - x1;
		float h = y2 - y1;
		float xoff = abs(h) / res / 15;
		float yoff = abs(w) / res / 15;
		beginShape();
		curveVertex(x1, y1);
		for (int i = 0; i <= res; i++) {
			curveVertex(x1 + i * w / res + random(-xoff, xoff), y1 + i * h / res + random(-yoff, yoff));
		}
		curveVertex(x2, y2);
		endShape(OPEN);
	}
}
  public void settings() { 	size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
