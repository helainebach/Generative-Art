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

// This sketch is a reference to select colors from a photo. 
// Click number keys 1 through 5 to assign swatches, 
// "c" to clear selections and "p" to print them to a palette.

String  file = "fish.png";


PFont 	ubuntu;
PImage 	img;
String 	pathDATA = "../../../0_data/photo/";
String 	[] colors = new String [5];
int 	[] palette = {0, 0, 0, 0, 0};
boolean guides = true;

public void setup() {
	
	img = loadImage(pathDATA + file);
	img.resize((height * img.width) / img.height, height);
	ubuntu = createFont("../../../0_data/fonts/ubuntu.ttf", 32);
}
public void draw() {
	background(0);
	image(img, 0, 0);
	if (guides) {
		pushMatrix();
		translate((height * img.width) / img.height + 20, 125);
		palette();
		popMatrix();
	}
	ellipseMode(CENTER);
	fill(img.get(mouseX, mouseY));
	circle(mouseX, mouseY, 50);
}
public void palette() {
	float u = 80;
	for (int i = 0; i < palette.length; i++) {
		stroke(255);
		strokeWeight(2);
		fill(palette[i]);
		square(0, u * i, u * .75f);
		textAlign(LEFT);
		textFont(ubuntu);
		fill(255);
		text("#" + hex(palette[i], 6), u, u * i + u / 2);
	}
}
public void keyPressed() {
	switch (key) {
	case '1':
		palette[0] = img.get(mouseX, mouseY);
		break;
	case '2':
		palette[1] = img.get(mouseX, mouseY);
		break;
	case '3':
		palette[2] = img.get(mouseX, mouseY);
		break;
	case '4':
		palette[3] = img.get(mouseX, mouseY);
		break;
	case '5':
		palette[4] = img.get(mouseX, mouseY);
		break;
	case 'c':
		for (int i = 0; i < palette.length; i++) {
			palette[i] = 0;
		}
		break;
	case 'p':
		for (int i = 0; i < palette.length; i++) {
			colors[i] = hex(palette[i], 6);
		}
		println("{#" + colors[0] + ",#" + colors[1] + ",#" + colors[2] + ",#" + colors[3] + ",#" + colors[4] + "}");
	}
}
  public void settings() { 	size(1200, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
