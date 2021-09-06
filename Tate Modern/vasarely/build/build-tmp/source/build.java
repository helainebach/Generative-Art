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

int paper = 0xFFE6E7D9;
int ink   = 0xFF3A3A38;

 public void setup() {
	/* size commented out by preprocessor */;
	noStroke();
	noLoop();
	rectMode(CENTER);
}
 public void draw() {
	float u = (float)width / 29;
	background(paper);
	noStroke();
	fill(ink);
	inner();
	outer();
	for (int j = 1; j < 4; j++) {
		for (int i = 1; i < 28; i++) {
			square(u / 2 + i * (u), (j * u + u / 2), u -5);
		}
	}
	
	for (int k = 4; k < 13; k++) {
		for (int i = 1; i < 28; i++) {
			if (i < 4) {square(u / 2 + i * (u), (k * u + u / 2), u -5);}
			if (i > 24) {square(u / 2 + i * (u), (k * u + u / 2), u -5);}
			if (i > 12 && i < 16) {square(u / 2 + i * (u), (k * u + u / 2), u -5);}
		}
	}
	for (int i = 15; i < 28; i++) {
		pushMatrix();
		translate(i * u + u / 2, 16 * u + u / 2);
		scale(.8f);
		shape(-u / 2 + (28 - i) / 3, -u / 2 + (28 - i) / 3, u / 2, -u / 2, u / 2 - (28 - i) / 3, u / 2 - (28 - i) / 3, -u / 2, u / 2);
		popMatrix();

	}
	for (int i = 1; i < 15; i++) {
		pushMatrix();
		translate(i * u + u / 2, 16 * u + u / 2);
		scale(.8f);
		shape(-u / 2 + i / 3, -u / 2 + i / 3, u / 2, -u / 2, u / 2 - i / 3, u / 2 - i / 3, -u / 2, u / 2);
		popMatrix();

	}
	for (int k = 0; k < 8; k++) {
		for (int j = 13 + (k * 4); j < 16 + (k * 4); j++) {
			for (int i = 1; i < 28; i++) {
				square(u / 2 + i * (u), (j * u + u / 2), u -5);
			}
		}
	}
	for (int k = 0; k < 6; k++) {
		for (int j = 20 + (k * 4); j < 21 + (k * 4); j++) {
			for (int i = 1; i < 28; i++) {
				if (i % 4 != 0) {
					square(u / 2 + i * (u), (j * u + u / 2), u -5);
				} else {
					circle(u / 2 + i * (u), (j * u + u / 2), 5 + (i*.75f));
				}
			}
		}
	}
	paper(2, 3, 100); //noiseRes, speckSize, speckCount,
}

 public void paper(int noiseRes, int speckSize, int speckCount) {
	noStroke();
	for (int i = 0; i < width - noiseRes / 2; i += noiseRes) {
		for (int j = 0; j < height - noiseRes / 2; j += noiseRes) {
			fill(random(170, 240), 25);
			rect(i, j, noiseRes, noiseRes);
		}
	}
	for (int i = 0; i < speckCount; i++) {
		blendMode(SCREEN);
		fill(random(130, 215), random(100, 170));
		rect(random(0, width - speckSize / 2), random(0, height - speckSize / 2), random((int)speckSize / 2, speckSize), random((int)speckSize / 2, speckSize));
	}
}

 public void shape(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
	beginShape();
	vertex(x1, y1);
	vertex(x2, y2);
	vertex(x3, y3);
	vertex(x4, y4);
	endShape(CLOSE);
}

 public void inner(){
	float u = (float)width / 29;
	pushMatrix();
	translate(u * 16, u * 4);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u - 6 - (i * j) / 2);
		}
	}
	popMatrix();
	pushMatrix();
	translate(u * 25, u * 4);
	rotate(PI/2);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u - 6 - (i * j) / 2);
		}
	}
	popMatrix();
	pushMatrix();
	translate(u * 16, u * 14);
	rotate(PI/-2);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u - 6 - (i * j) / 2);
		}
	}
	popMatrix();
	pushMatrix();
	translate(u * 25, u * 14);
	rotate(PI);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u - 6 - (i * j) / 2);
		}
	}
	popMatrix();
}

 public void outer(){
	float u = (float)width / 29;
	pushMatrix();
	translate(u * 4, u * 4);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u -5 + i * .55f + j * .55f );
		}
	}
	popMatrix();
	pushMatrix();
	translate(u * 14, u * 4);
	rotate(PI/2);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u -5 + i * .55f + j * .55f );
		}
	}
	popMatrix();
	pushMatrix();
	translate(u * 4, u * 14);
	rotate(PI/-2);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u -5 + i * .55f + j * .55f );
		}
	}
	popMatrix();
	pushMatrix();
	translate(u * 14, u * 14);
	rotate(PI);
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) {
			square(u / 2 + i * (u), (j * u + u / 2), u -5 + i * .55f + j * .55f );
		}
	}
	popMatrix();
}



 public void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/"+fileName);
		break;
	}
}


  public void settings() { size(540, 840); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
