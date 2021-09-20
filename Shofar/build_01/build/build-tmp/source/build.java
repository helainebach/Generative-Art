import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.text.SimpleDateFormat; 
import java.util.Date; 
import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

float u = 200;
float uL, uG;



boolean record = true;
public void setup() {
	
	background(255);
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	if (record) {beginRecord(PDF, "../exports/stills/" + fileName);}
}
public void draw() {
	stroke(0);
	strokeWeight(5);
	translate (u / 3, u / 3); 		tekiah();
	translate (0, u / 3); 			shevarim();
	translate (u * 1.25f, 0);		teruah();
	translate (-u * 1.25f, u / 3);	tekiah();
	translate (0, u / 2);			tekiah();
	translate (0, u / 3);			shevarim();
	translate (0, u / 3);			tekiah();
	translate (0, u / 2);			tekiah();
	translate (0, u / 3);			teruah();
	translate (0, u / 3);			tekiahGdola();
	endRecord();
}
public void tekiah() {
	line(0, 0, u, 0);
}
public void shevarim() {
	uL = u  / 4;
	uG = uL / 2;
	for (int i = 0; i < 3; i++) {
		line(i * uL + i * uG, 0, (i * uL + i * uG) + uL, 0);
	}
}
public void teruah() {
	uL = u / 17;
	uG = uL;
	for (int i = 0; i < 9; i++) {
		line(i * uL + i * uG, 0, (i * uL + i * uG) + uL, 0);
	}
}
public void tekiahGdola() {
	line(0, 0, u * 2.25f, 0);
}
  public void settings() { 	size(600, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
