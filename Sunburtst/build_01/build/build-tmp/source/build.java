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

int[] palette = {0xffCEBA9E,0xffA57B52,0xff996C54,0xff706560};
float   r;
float   x, y;

public void setup() {
	
	noStroke();
}

public void draw() {
	background(0xff2E2D36);
	int count = 9;
	int area = count * count;
	int cell = width / count;
	for (int n = 0; n < area; n++) {
		int x = (n % count) * cell + cell / 2;
		int y = (n / count) * cell + cell / 2;
		int c = palette[((n / count) * (n % count)) % palette.length];
		fill(c);
		star(6, cell / 2.5f, 1.75f, x, y);
	}
}

public void star(int n, float s, float d, float pX, float pY) {
	pushMatrix();
	translate(pX, pY);
	rotate(-PI / 2);
	beginShape();
	for (float a = 0; a < TWO_PI; a += TWO_PI / n) {
		r = s;
		polar(a);
		vertex(x, y);
		r = r / d;
		polar(a + TWO_PI / (n * 2));
		vertex(x, y);
	}
	endShape(CLOSE);
	popMatrix();
}

public void polar(float a) {
	x = r * cos(a);
	y = r * sin(a);
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
