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

String pathDATA = "../../../0_data/";
PImage img;
int w = 20;
int o = 25;
public void setup() {
	
	img = loadImage(pathDATA + "photo/fish.png");
	img.resize(width, height);
}
public void draw() {
	frameRate(3);
	image(img,0,0);
	for (int i = 0; i < width; i += width / w) {
		copy(img, i, 0, width / w, height, i, (int)random(-o, o), width / w, height);
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
