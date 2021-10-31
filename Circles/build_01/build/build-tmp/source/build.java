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

int[] palette = {0xff170F27,0xff553470,0xffAB2658,0xffE8C954,0xff39736A};
int 	i 		= 2;
float 	off 	= 0.0f;
float 	rate 	= .01f;
public void setup() {
	
	ellipseMode(CENTER);
	noFill();
	background(palette[0]);
}
public void draw() {
	// frameRate(10);
	float n = noise(off);
	float d = map(n, 0, 1, 10, width);
	stroke(palette[i], 20);
	strokeWeight(5);
	translate(n*random(-50, 50), n*random(-50, 50));
	circle(width / 2, height / 2, d);
	off += rate;
}


public void mousePressed() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
	saveFrame("../exports/stills/" + fileName);
}
public void mouseReleased() {
	background(palette[0]);
}
public void keyPressed() {
	switch (key) {
	case 'p':
		i = constrain((int)(i + i) % palette.length, 1, palette.length);
		break;
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
