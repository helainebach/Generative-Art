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

int [] rand = new int[4];
float off = 0.0f;
public void setup() {
	
	rands();
	// noFill();
	background(255);
	strokeWeight(3);
}
public void draw() {
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
	off += .03f;
}
public void quad() {
	rect(width / rand[0] + sin(off) * width / rand[1], height / rand[2] + cos(off) * height / rand[3], 100*rand[2], 100*rand[1], 10);
	// rose(width / 2 + rand[0], height / 2 + rand[1], rand[2], rand[3], width / 2 * rand[4]);
}
public void rands() {
	// rand[0] = (int) random(-width / 3, width / 3);
	// rand[1] = (int) random(-width / 3, width / 3);
	// rand[2] = (int) random(1, 7);
	// rand[3] = (int) random(1, 9);
	// rand[4] = (int) random(1, 5);
	for (int i = 0; i < 4; i++) {
		rand[i] = (int) random(1, 4);
	}
}


public void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/squares/" + fileName);
		rands();
		background(255);
		break;
	case 'o':
		rands();
		background(255);
		break;
	}
}
public void rose(float px, float py, float n, float d, float rad) {
	pushMatrix();
	translate(px, py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI * d; a += .01f) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x, y);
	}
	endShape(OPEN);
	popMatrix();
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
