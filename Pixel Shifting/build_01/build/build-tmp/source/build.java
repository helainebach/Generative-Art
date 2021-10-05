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
float  off = 0;
public void setup() {
	
	img = loadImage(pathDATA + "photo/fish.png");
	img.resize(width, height);
}
public void draw() {
	float x = sin(off)*width-200;
	image(img, 0, 0);
	copy(img, (int)x, 0, 1, height, (int)x, 0, 200, height);
	off = off + .01f;
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
