/* autogenerated by Processing revision 1278 on 2023-02-12 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import processing.svg.*;
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




boolean exportSVG = false;
String  fileName;
 public void setup() {
	/* size commented out by preprocessor */;
}
 public void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
	noFill();
	stroke(0);
//--------------------------------------------
	pushMatrix();
	translate(width / 2, height / 2);
	rectMode(CENTER);
	float r = atan(2);
	float s = width/3*2;
	circle(0,0,hypo(s));
	while (s > 30) {
		square(0, 0, s);
		rotate(r);
		s = s * sqrt(5) / 3;
	}
	popMatrix();
//--------------------------------------------
	if (exportSVG) {
		endRecord();
		exportSVG = false;
	}
}
 public void keyPressed() {
	if (key == 'e') {
		exportSVG = true;
	}
}
 public float hypo(float a) {
	double c = Math.sqrt((a * a) + (a * a));
	return (float)c;
}


  public void settings() { size(900, 900); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
