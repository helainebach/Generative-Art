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

String  txt 		 = "Hello World!";
float 	rate 	 = .005f;
float 	n 		 = TWO_PI / rate;
float   off;
int 	c;
int[] palette  = {0xffE145E5,0xffFBDD73,0xff4F97F1,0xffB9CCE3};
String  pathDATA = "../../../0_data/";
PFont  	font;
public void setup() {
	
	frameRate(30);
	font = createFont(pathDATA + "fonts/Gotham-Bold.otf", 50);
	textFont (font);
	textAlign(CENTER, CENTER);
	// noLoop();
	colorMode(HSB);
}
public void draw() {
	frameRate(3);
	background(0);
	char c = (char) PApplet.parseInt(random(33, 127));
	// text(c, width / 2, width / 2);
	grid(10);
	// off += rate;
}

public void grid(int count) {
	int cell = width / count;
	int area = count * (height / cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		char c = (char) PApplet.parseInt(random(33, 127));
		fill(n * 2 % 255, 255, 255);
		text(c, x + cell / 2, y + cell / 2);
	}
}

public void mousePressed() {
	redraw();
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
