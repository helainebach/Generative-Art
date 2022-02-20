/* autogenerated by Processing revision 1278 on 2022-02-19 */
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
float d, seg, b, e, n;
int rand = 1;
int lev = 10;
int density = 10;
int l = lev * density;
int s = 45;
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
	strokeCap(SQUARE);
//--------------------------------------------
	translate(width / 2, width / 2);
	for (int j = l / 3; j < l; ++j) {
		for (int i = 0; i < s; ++i) {
			d = j * (width / l);
			d = d - (width / l / 2);
			seg = TWO_PI / s;
			b = i * seg;
			e = b + seg;
			n = noise(j / density, i, rand) * 2;
			stroke((int)(Math.floor(n)) * 255);
			arc(0, 0, d, d, b, e);
		}
	}
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
	if (key == 'r') {
		rand++;
	}
}


  public void settings() { size(800, 800); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
