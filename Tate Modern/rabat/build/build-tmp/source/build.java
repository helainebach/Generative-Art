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

String pathDATA = "../../../0_data/";
int blue = 0xff0043A0;
int yellow = 0xffE7B800;
PImage    rabat;
public void setup() {
	rabat = loadImage(pathDATA + "photo/tate/rabat.jpg");
	
	stroke(0xffE0DCD6);
	strokeWeight(6);
	noLoop();
}
public void draw() {
	int cell = 25;
	float u = width / cell+1;
	background(0xffE0DCD6);
	// tint(255, 50);
	// image(rabat, 0, 0, width, height);
	for (int i = 1; i < cell; i++) {
		if (i % 2 == 0) {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u, (i + 1) * u, cell * u, i * u, cell * u, yellow);
		} else {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u, (i + 1) * u, cell * u, i * u, cell * u, blue);
		}
	}
	for (int i = 1; i < cell; i++) {
		if (i % 2 == 0) {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u,  cell * u, (i + 1) * u,  cell * u, i * u, blue);
		} else {
			shape(i * u, i * u, (i + 1) * u, (i + 1) * u,  cell * u, (i + 1) * u,  cell * u, i * u, yellow);
		}
	}
	paper(2,3,100); //noiseRes, speckSize, speckCount,
}
public void shape(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int col) {
	fill(col);
	beginShape();
	vertex(x1, y1);
	vertex(x2, y2);
	vertex(x3, y3);
	vertex(x4, y4);
	endShape(CLOSE);
}


public void paper(int noiseRes, int speckSize, int speckCount) {
  noStroke();
  for (int i = 0; i<width-noiseRes/2; i+=noiseRes) {
    for (int j = 0; j<height-noiseRes/2; j+=noiseRes) {
      fill(random(170, 240), 25);
      rect(i, j, noiseRes, noiseRes);
    }
  }
  for (int i = 0; i<speckCount; i++) {
  	blendMode(SCREEN);
    fill(random(130, 215), random(100, 170));
    rect(random(0, width-speckSize/2), random(0, height-speckSize/2), random((int)speckSize/2, speckSize), random((int)speckSize/2, speckSize));
  }
}



public void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		break;
	}
}
  public void settings() { 	size(1080, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
