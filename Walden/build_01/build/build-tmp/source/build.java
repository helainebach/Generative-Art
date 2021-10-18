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

String pathDATA = "../../../0_data/";
PImage waldenImage;
String [] waldenText;
String words;
PFont font;
int count = 200;
int t 	  = 200;
public void setup() {
	
	waldenImage = loadImage(pathDATA   + "photo/walden.jpg");
	waldenText  = loadStrings(pathDATA + "text/walden.txt");
	waldenImage.resize(width, height);
	words = join(waldenText, " ");
	font = createFont(pathDATA+"fonts/Rubik-Medium.ttf", 100);
	noStroke();
}
public void draw() {
	background(0);
	grid(count);
	// saveFrame("../exports/frames2/###.png");
}
public void grid(int count) {
	int cell = width / count;
	int area = count * (height / cell);
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell;
		int y = (n / count) * cell;
		int c = waldenImage.get(x, y);
		float b = Math.round(brightness(c) / t) * t;
		textFont(font);
		textSize(cell);
		textAlign(LEFT, TOP);
		// fill(b);
		fill(c,100);
		rect(x,y,cell,cell);
		fill(c);
		text(words.charAt((((int)frameCount*area)+n)%words.length()), x, y);
	}
	if(frameCount*area>words.length()){exit();}


}
  public void settings() { 	size(1600, 	1200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
