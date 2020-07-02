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



PImage    	myColor;
int    	  	stageW   		= 1080;
int    	  	stageH   		= 1080;
int 	  	scaleFactor 	= 2;
int  	  	clrBG 			= 0;
String 	  	pathDATA 		= "../../../0_data/";
boolean   	sclDown			= false;
int 	  	size 			= 180;
int 	  	count;
int[]   	pickedColors;
PShape[]  	shapes;
	
public void settings(){
	if (sclDown){
		size(stageW/scaleFactor,stageH/scaleFactor); 
	}else{
		size(stageW,stageH);
	}
}
public void setup() {
	myColor = loadImage(pathDATA + "gradientFull/rainbow_02.png");
	loadShapes();
	noLoop();
	shapeMode(CENTER);
}

public void draw() {
	
	frameRate(3);
	background(clrBG);	

	if (sclDown){
		scale(.5f);
	}
	for (int x = 0; x < 6; x++) {
		for (int y = 0; y < 6; y++) {
			stroke(myColor.get((x*size+size/2)/2,(y*size+size/2)/2));
			strokeWeight(2);
			fill(myColor.get((x*size+size/2)/2,(y*size+size/2)/2),(int)random(50,200));
			pushMatrix();
				translate(x*size+size/2,y*size+size/2);
				rotate((int)random(4)*HALF_PI);
			shape(shapes[(int)random(shapes.length-1)],0,0,size-20,size-20);
			popMatrix();
		}
	}
	paper(2,3,30); //noiseRes, speckSize, speckCount,
}

public void paper(int noiseRes, int speckSize, int speckCount) {
  noStroke();
  for (int i = 0; i<stageW-noiseRes/2; i+=noiseRes) {
    for (int j = 0; j<stageH-noiseRes/2; j+=noiseRes) {
      fill(random(170, 240), 25);
      rect(i, j, noiseRes, noiseRes);
    }
  }
  for (int i = 0; i<speckCount; i++) {
    fill(random(130, 215), random(20, 100));
    rect(random(0, stageW-speckSize/2), random(0, stageH-speckSize/2), random((int)speckSize/2, speckSize), random((int)speckSize/2, speckSize));
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

public void loadShapes(){
	count = 10;
	shapes = new PShape[count];
	for (int i = 0; i < count; i++) {
		shapes[i] = loadShape(pathDATA+"svg/17/"+i+".svg");
		shapes[i].disableStyle();
	}
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
