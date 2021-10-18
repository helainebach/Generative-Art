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

PFont font;
String pathDATA = "../../../0_data/";
public void setup() {
	
	font = createFont(pathDATA + "fonts/Gotham-Bold 2.otf", 32);
	noStroke();
	noLoop();
}
public void draw() {
	background(50);
	textAlign(CENTER, CENTER);
	for (int i = 1; i < 10; i++) {
		int f = 8 * i;
		textFont(font, f);
		fill(255, f * 2.5f);
		text("hello world", width / 2, height / 3 + f);
		if (i == 9) {
			textFont(font, f);
			fill(255);
			text("hello world", width / 2, height / 3 + f);
		}
	}
	fill((int)random(100, 255), (int)random(100, 255), (int)random(100, 255));
	blendMode(MULTIPLY);
	rect(0, 0, width, height);
	blendMode(ADD);
	// fill(255);
	// text("hello world", width / 2, 200 + 90);
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
