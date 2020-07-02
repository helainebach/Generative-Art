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

int    	stageW   	= 1080;
int    	stageH   	= 1080;
int 	scaleFactor = 2;
int  	clrBG    	= 0xff202020;
String 	pathDATA 	= "../../../data/";
boolean sclDown		= true;

public void settings(){
	if (sclDown){
		size(stageW/scaleFactor,stageH/scaleFactor); 
	}else{
		size(stageW,stageH);
	}
}

public void setup() {
	
	background(clrBG);	
}

public void draw() {
	if (sclDown){
		scale(.5f);
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
