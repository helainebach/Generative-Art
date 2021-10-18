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



String  t 		 = "⣿";
PVector a 		 = new PVector(-10, -5);
float 	rate 	 = .01f;
float 	n 		 = TWO_PI / rate;
float   off;
int 	c;
int[] palette  = {0xffE145E5,0xffFBDD73,0xff4F97F1,0xffB9CCE3};
String  pathDATA = "../../../0_data/";
PFont  	font;
boolean guide = false;
public void setup() {
	frameRate(1000);
	// font = createFont(pathDATA + "fonts/SourceCodePro-Black.otf", 70);
	// font = createFont(pathDATA + "fonts/Arial Unicode.ttf", 100);
	font = createFont(pathDATA + "fonts/UBraille.ttf", 100);
	
	background(palette[3]);
	textFont (font);
	textAlign(CENTER, CENTER);
	fill(0xff94B8E3);
	if (guide) {
		text(t, width / 2, height / 2);
	}
}
public void draw() {
	translate(a.x, a.y);
	translate(width / 2 + (sin(off) * width / 3), height / 2 + (cos(off) * height / 3), cos(off * 8) * 100);
	if (frameCount <= n / 4 || frameCount >= n * .75f) {
		c = lerpColor(palette[0], palette[1], abs(sin(off)));
	} else if (frameCount >= n / 4 && frameCount <= n * .75f) {
		c = lerpColor(palette[2], palette[1], abs(sin(off)));
	}
	fill(c, 50);
	if (frameCount <= Math.ceil(n)) {
		text(t, 0, 0, 0);
	}
	off += rate;
}
public void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		saveFrame("../exports/2/" + fileName + "-" + t + ".png");
		break;
	}
}
  public void settings() { 	size(600, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
