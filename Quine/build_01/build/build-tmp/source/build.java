import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.svg.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {


String[] 	code;
String 		path;
PFont 		ubuntu;
public void setup() {
	
	ubuntu = createFont("../../../0_data/fonts/ubuntu.ttf", 10);
	path   = "shofar";
	code   = loadStrings(path + ".txt");
}
public void draw() {
	beginRecord (SVG, "../output/" + path + ".svg");
	background  (255);
	textAlign   (LEFT, TOP);
	textFont    (ubuntu);
	fill(0);
	int y = 0;
	for (String line : code) {
		text(line, 10, 10 + y);
		y += textAscent() + textDescent() + 2;
	}
	endRecord();
}
  public void settings() { 	size(400, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
