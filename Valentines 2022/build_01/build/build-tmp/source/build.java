/* autogenerated by Processing revision 1278 on 2022-02-14 */
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




String  folderName;
boolean exportSVG = false;
String  fileName;
int rand = 1;
 public void setup() {
	/* size commented out by preprocessor */;
	background(255);
	folderName  = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}
 public void draw() {
	noFill();
	stroke(0);
	//--------------------------------------------
	translate(width / 2, height / 3);
	for (int i = -6; i < 6; ++i) {
		randomSeed(1000 * i * rand);
		int r = (int)random(-3, 3);
		float x = i * 40;
		float y = r * 50;
		rose(x, y, 3, 4, random(30, 80));
		line(x, y, 0, height / 3);
	}
	//--------------------------------------------
}
 public void mouseReleased() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
	beginRecord(PDF, "../exports/pdf/" + folderName + "/" + fileName);
	background(255);
}
 public void mousePressed() {
	endRecord();
}
 public void keyPressed() {
	switch (key) {
	case 'x': endRecord(); exit();
		break;

	case 'r': rand++; background(255);
		break;
	}
}
 public void rose(float px, float py, float n, float d, float rad) {
	pushMatrix();
	translate(px, py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI * d; a += .01f) {
		float r = rad * cos(k * a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x, y);
	}
	endShape(OPEN);
	popMatrix();
}


  public void settings() { size(850, 1100); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
