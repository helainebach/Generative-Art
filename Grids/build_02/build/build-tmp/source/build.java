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
int    	  	stageW   		= 1920;
int    	  	stageH   		= 1080;
int 	  	scaleFactor 	= 2;
int  	  	clrBG 			= 0;
String 	  	pathDATA 		= "../../../0_data/";
boolean   	sclDown			= false;
boolean   	record			= false;
int 	  	size 			= 120;
int 	  	count;
int[]   	pickedColors;
PShape[]  	shapes;
float theta;
	
public void settings(){
	if (sclDown){
		size(stageW/scaleFactor,stageH/scaleFactor); 
	}else{
		size(stageW,stageH);
	}
}
public void setup() {
	myColor = loadImage(pathDATA + "gradientFull/pink_yellow_02.png");
	loadShapes();
	noLoop();
	shapeMode(CENTER);
}

public void draw() {
	background(clrBG);	

	if (sclDown){
		scale(.5f);
	}
	theta+=.02f;
	for (int x = 0; x < 16; x++) {
		for (int y = 0; y < 9; y++) {
			strokeWeight(2);
			stroke(myColor.get((x*size+size/2)/4,(y*size+size/2)/2));
			fill(myColor.get((x*size+size/2)/4,(y*size+size/2)/2),100);
			pushMatrix();
				translate(x*size+size/2,y*size+size/2);
				// rotate(theta);
				rotate(HALF_PI/3);
			shape(shapes[(int)random(shapes.length)],0,0,size+size/6,size+size/6);
			popMatrix();
		}
	}
	paper(2,3,30); //noiseRes, speckSize, speckCount,
	if (record){
		int vidLength = 5;
		int fps       = 30;
		saveFrame("../exports/frames2/###.png"); if (frameCount == vidLength*fps) exit();
		println(frameCount+" of "+(int)vidLength*fps);	
	}

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
