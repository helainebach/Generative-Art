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

int[] palette = {0xffF60000,0xffFF8C00,0xffFFEE00,0xff4DE94C,0xff3783FF,0xff4815AA};
int m, s;
public void setup() {
	
	strokeWeight(2);
	noFill();
	rectMode(CENTER);

}
public void draw() {
	frameRate(1);
	background(0);
	stroke(palette[0]);
	square(width / 2, height / 2, 520);
	translate((600 - 512) / 2 + 2, (600 - 512) / 2);
	strokeWeight(3);
	m = (int)random(9, 15);
	s = (int)random(2, 4);
	grid(m, s);
	saveFrame("../exports/stills/"+m+"-"+s+".png");
}
public void grid(int m, int s) {
	int count = 128;
	int cell = 4;
	int area = 16384;
	for (int n = 0; n < area; n++) {
		int x = (n % count);
		int y = (n / count);
		int num = ((128 + x + y) ^ (256 + x - y)) % m;
		if (num <= s) {
			if (num >= s / 2) {
				stroke(palette[n * 2 % palette.length]);

			} else {
				stroke(palette[4]);
			}
			point(x * cell, y * cell);
		}
	}
}
  public void settings() { 	size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
