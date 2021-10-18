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

int[] palette = {0xffF04F32,0xffF3C91C,0xff1060B0,0xffEFF0F5,0xff252020};
int 	fg 		= palette[4];
int 	bg 		= palette[3];
int 	rand 	= (int)random(1000);
float 	xoff, yoff;
public void setup() {
	
	rectMode(CENTER);
	strokeWeight(2);
	stroke(fg);
}
public void draw() {
	background(bg);
	for (int i = 0; i < 15; i++) {
		randomSeed(i * rand);
		float w = random(100, 200);
		float h = random(20, 200);
		box(random(width), random(height), sin(i + xoff) * w , cos(i + yoff) * h , palette[(int)random(3)]);
	}
	xoff += .01f * random(1, 3);
	yoff += .01f * random(1, 3);
}
public void box(float x, float y, float w, float h, int c) {
	pushMatrix();
	translate(x, y);
	fill(bg);
	rect(0, 0, w, h);
	fill(c);
	int s = 10;
	square(-w / 2, -h / 2, s);
	square( w / 2, -h / 2, s);
	square( w / 2,  h / 2, s);
	square(-w / 2,  h / 2, s);
	popMatrix();
}
public void mousePressed() {
	rand++;
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
