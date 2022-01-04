/* autogenerated by Processing revision 1276 on 2022-01-03 */
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

String  pathDATA 	= "../../../0_data/";
int[] palette 	= {0xFF0160B6,0xFF03A08F,0xFFFFDD5E,0xFFFFA051,0xFFFF3C1B,255,255,255};
int  	bg 			= 0;
float 	off 		= 0.0f;
float 	rate 		= 0.005f;
Star [] stars = new Star[1500];
PFont   font;
 public void setup() {
	font = createFont(pathDATA + "fonts/ubuntu.ttf", 100);
	/* size commented out by preprocessor */;
	for (int i = 0; i < stars.length; i++) {
		stars[i] = new Star();
	}
}
 public void draw() {
	background(bg);
	translate(width / 2, height / 2);
	rotate(off);
	for (int i = 0; i < stars.length; i++) {
		stars[i].update();
		stars[i].show();
	}
	off+=rate;

	float vidLength = 15;
	float fps       = 30;
	saveFrame("../exports/frames/###.png"); if (frameCount == vidLength*fps) exit();
}
class Star {
	float x;
	float y;
	float z;
	float pz;
	float rate;
	int c;

	Star() {
		x    = random(width / 4, width) * random(-2, 2);
		y    = random(height / 4, height) * random(-2, 2);
		z    = random(width);
		rate = map(z, 0, width, 12, 4);
		pz   = z;
		c    = palette[(int)random(palette.length)];
	}
	 public void update() {
		z = z - rate;
		if (z < 1) {
			z  = random(width);
			x  = random(width / 4, width) * random(-2, 2);
			y  = random(height / 4, height) * random(-2, 2);
			pz = z;

		}
	}
	 public void show() {
		fill(c);
		noStroke();
		float sx = map(x / z, 0, 1, 0, width);
		float sy = map(y / z, 0, 1, 0, width);
		float r  = map(z, 0, width, 8, 0);
		circle(sx, sy, r);
		float px = map(x / pz, 0, 1, 0, width);
		float py = map(y / pz, 0, 1, 0, width);
		stroke(c, 50);
		strokeWeight(map(z, 0, width, 0, 4));
		line(px, py, sx, sy);
	}
}


  public void settings() { size(600, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
