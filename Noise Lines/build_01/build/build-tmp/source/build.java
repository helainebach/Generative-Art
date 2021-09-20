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

float off;



String  folderName;
public void setup() {
	
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	background(255);
}

public void draw() {
	noiseSeed(1);
	float nX = noise(off);
	noiseSeed(30);
	float nY = noise(off);
	float x = nX * width;
	float y = nY * height;
	seg(x, y, (nY * 300), nX * 2 * TWO_PI);
	off += .009f;
}

public void seg(float x, float y, float l, float r) {
	float adj = l * cos(r);
	float opp = l * sin(r);
	float x1 = x;
	float y1 = y;
	float x2 = x + adj;
	float y2 = y + opp;;
	line(x1, y1, x2, y2);
}

public void mouseReleased() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	beginRecord(PDF, "../exports/" + folderName + "/" + fileName);
	background(255);
}

public void mousePressed() {
	endRecord();
}

public void keyPressed() {
switch (key) {case 'x': endRecord(); exit(); break;}
switch (key) {case 'c': background(255); break;}
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
