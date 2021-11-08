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

int[] palette 		= {0xff3592A9,0xff49261F,0xffE8DEBF,0xff292D4E,0xff333D2A,0xff79805A,0xffA1B3C4,0xff0D0D0F};
// color[] palette 		= {#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001};
int   bg 				= palette[0];
ArrayList <Blob> blobs  = new ArrayList <Blob> ();
String pathDATA 		= "../../../0_data/";

public void setup() {
	
}

public void draw() {
	frameRate(1000);
	background(bg);
	blobs.add(new Blob(6, random(width), random(height)));
	for (int i = 0; i < blobs.size() - 1; i++) {
		int j = blobs.size() - 1;
		if (blobs.get(j).collide(blobs.get(i))) {
			blobs.remove(j);
		}
	}
	for (Blob blob : blobs) {
		blob.display();
	}
}



public void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		exit();
		break;
	}
}
class Blob {

	int   c;
	int     res;
	float   [] x, y;
	float   r, slice, off, cx, cy;
	boolean wonky = true;

	Blob (int _res, float _cx, float _cy ) {
		r     = random(20, 80);
		res   = _res;
		x     = new float[res];
		y     = new float[res];
		cx    = _cx;
		cy    = _cy;
		slice = radians(360 / res);
		off   = r * .2f;
		c     = palette[(int)random(1, palette.length)];
		init();
		noStroke();
	}

	public void init() {
		for (int i = 0; i < res; i++) {
			float angle = i * slice;
			if (wonky == true) {
				x[i] = cx + cos(angle) * r + random(-off, off);
				y[i] = cy + sin(angle) * r + random(-off, off);
			} else {
				x[i] = cx + cos(angle) * r;
				y[i] = cy + sin(angle) * r;
			}
		}
	}

	public void display() {
		fill(c);
		beginShape();
		curveVertex(x[res - 1], y[res - 1]);
		for (int i = 0; i < res; i++) {
			strokeWeight(1);
			curveVertex(x[i], y[i]);
		}
		curveVertex(x[0], y[0]);
		curveVertex(x[1], y[1]);
		endShape();
	}

	public boolean collide(Blob other) {
		float d = dist(cx, cy, other.cx, other.cy);
		if (d < r + other.r * 1.5f) {
			return true;
		} else {
			return false;
		}
	}
}
  public void settings() { 	size(1080, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
