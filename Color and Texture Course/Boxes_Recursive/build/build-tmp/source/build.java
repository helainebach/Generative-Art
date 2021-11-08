import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

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

ArrayList <Poly> polys  = new ArrayList <Poly> ();
int margin  = 5;
int polyRes = 5;
int[] palette 		= {0xffECF7F1,0xff004C66,0xffDF938D,0xffCC3141,0xff8E0001};
int   bg 				= palette[0];

public void setup() {
	
	noFill();
	polys.add(new Poly(margin, margin, width - margin * 2, height - margin * 2, polyRes));
	generate(8);
}
public void draw() {
	noLoop();
	background(bg);
	for (Poly poly : polys) {
		poly.display();
	}
}
public void generate(int gen) {
	ArrayList temp = new ArrayList <Poly>();
	if (gen > 1) {
		for (Poly p : polys) {
			float r = random(1);
			if (r > .25f) {
				temp.add(new Poly(p.x,           p.y,           p.w / 2, p.h / 2, polyRes));
				temp.add(new Poly(p.x + p.w / 2, p.y,           p.w / 2, p.h / 2, polyRes));
				temp.add(new Poly(p.x + p.w / 2, p.y + p.h / 2, p.w / 2, p.h / 2, polyRes));
				temp.add(new Poly(p.x,           p.y + p.h / 2, p.w / 2, p.h / 2, polyRes));
			} else {
				temp.add(new Poly(p.x,           p.y,           p.w,     p.h,     polyRes));
			}
		}
		polys = temp;
		gen--;
		generate(gen);
	}
}



public void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		break;
	}
}
class Poly {
	int res;
	float x, y, w, h;
	int c;
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
		c   = palette[(int)random(1, palette.length)];
	}
	public void display() {
		noStroke();
		fill(c);
		rect(x, y, w, h);
		noFill();
		stroke(bg);
		strokeWeight(2);
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
