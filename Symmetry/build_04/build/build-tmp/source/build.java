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

int [] 	rand 		 = new int[6];
PImage  myColor;
String 	pathDATA 	 = "../../../0_data/";
float   r;
float   x, y;

float off = 0.0f;
public void setup() {
	myColor = loadImage(pathDATA + "gradientStrip/rainbow_01.png");
	
	rands();
	background(0);
	// noStroke();
	strokeWeight(3);
}
public void draw() {
	// star(10,20,2,mouseX,mouseY);
	pushMatrix();
	scale(.5f);
	quad();
	popMatrix();
	pushMatrix();
	scale(.5f);
	translate(width * 2, 0);
	rotate(PI / 2);
	quad();
	popMatrix();
	pushMatrix();
	scale(.5f);
	translate(width * 2, height * 2);
	rotate(PI);
	quad();
	popMatrix();
	pushMatrix();
	scale(.5f);
	translate(0, height * 2);
	rotate(-PI / 2);
	quad();
	popMatrix();
	off += .05f;
}
public void quad() {
	fill(myColor.get(frameCount * 10 % myColor.width, 1 ));
	// rect(width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3], 100 * rand[2], 100 * rand[1], 30);
	star(rand[4], (width / 5) * rand[0], .5f + (1 / rand[5]), width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3]);
}
public void rands() {
	for (int i = 0; i < 4; i++) {
		rand[i] = (int) random(1, 4);
	}
	rand[4] = (int) random(4, 10);
	rand[5] = (int) random(1, 3);
}


public void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stars/" + fileName);
		rands();
		background(0);
		break;
	case 'o':
		rands();
		background(0);
		break;
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
