/* autogenerated by Processing revision 1278 on 2023-06-18 */
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

int[] palette = {0xFF1A93A0,0xFFFAF6EB,0xFFADD8F3,0xFFF3E0A8,0xFFF99263};
String pathDATA = "../../../0_data/";
 public void setup() {
	/* size commented out by preprocessor */;
}
 public void draw() {
	background(palette[0]);
	noFill();
	stroke(palette[1]);
	strokeWeight(.5f);
	grid(12);
	strokeWeight(10);
	stroke(palette[3]);
	fill(palette[4]);
	curveTightness(-1);
	float openness = map(mouseX, 0, width, height / 2, height);
	strokeJoin(ROUND);
	beginShape();
	curveVertex (0, 				openness);
	curveVertex (width / 6, 		height / 2);
	curveVertex (width - width / 6, height / 2);
	curveVertex (width - width / 6, openness);
	vertex 		(width - width / 6, height / 2);
	curveVertex (width - width / 6, height - openness);
	curveVertex (width - width / 6, height / 2);
	curveVertex (width / 6, 		height / 2);
	curveVertex (0, height - openness);
	endShape(CLOSE);
}
 public void grid(int count) {
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		square(x, y, cell);
	}
}


  public void settings() { size(1080, 1080); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
