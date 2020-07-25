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

int count = 20;
int x,y,w,h,c,n;
float dy;
int stripWidth;
//colors
int [] palette = {0xff2E222C,0xff945961,0xffE99D95,0xffF3D3A2,0xff159A79,0xff0A2C3A,0xff245261,0xff5B93A3,0xffC3FBC9,0xffBFBCD3};
int [] divisions = new int[count];
float theta = 0;

public void setup() {
	//comp size
	
}

public void draw(){
	//draws strips
	for (int i = 0; i < count; i++) {
		strip(i*(width/count),0,width/count,height,i,i);
	}
	//draws border on edges
	noFill();
	strokeWeight(6);
	rect(0, 0, width, height);
}

public void strip(int x, int y, int w, int h, int c, int n){
	strokeWeight(3);
	randomSelect();
	stripWidth = width/count;
	stroke(0xffFDEDC7);
	fill(color(palette[c%palette.length]));
	rect(x,y,w,h);

	for (int i = 0; i < divisions[n]; i++) {
		dy = i*(height/divisions[n])+theta%(height/divisions[n]);
		theta += c/15%10;
		line(x,dy,x+stripWidth,dy);
	}	
}
//picks random numbers
public void randomSelect(){
		randomSeed(0);
	for (int i = 0; i < divisions.length; i++) {
		divisions [i] = (int) random(5,25);
	}
}


	

  public void settings() { 	size(800,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
