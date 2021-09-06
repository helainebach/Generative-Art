/* autogenerated by Processing revision 1276 on 2021-09-06 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

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

//Inspired by: Bertram Binning Merging Sides 1967/8
 public void setup() {
	/* size commented out by preprocessor */;
	noStroke();
}
 public void draw() {
	background(255);
	fill(255, 0, 0);
	rect(0, 0, width / 4, height);
	for (int i = 0; i < 9; i++) {
		ellipseMode(CENTER);
		circle(width / 4 + 40, i * height / 8, 60);
	}
	for (float i = .5f; i < 8; i++) {
		ellipseMode(CENTER);
		circle(width / 4 + 110, i * height / 8, 60);
	}
	for (int i = 0; i < 9; i++) {
		if (i % 2 == 0) {fill(255, 0, 0);} else {fill(0xFF0D7E24);};
		ellipseMode(CENTER);
		circle(width / 2, i * height / 8, 60);
	}
	for (float i = .5f; i < 8; i++) {
		fill(0xFF0D7E24);
		ellipseMode(CENTER);
		circle(width / 2 + 70, i * height / 8, 60);
	}
	for (int i = 0; i < 9; i++) {
		fill(0xFF0D7E24);
		ellipseMode(CENTER);
		circle(width - width / 4 - 40, i * height / 8, 60);
	}
	fill(0xFF0D7E24);
	translate(width - width / 4, 0);
	rect(0, 0, width / 4, height);
}


 public void keyPressed() {
	switch (key) {
	case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/" + fileName);
		break;
	}
}


  public void settings() { size(730, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
