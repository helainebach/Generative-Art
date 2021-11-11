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

int[] palette = {0xff000F41,0xffFFFFFF,0xffA500FA,0xffFBA422,0xff61FF82,0xff55FFF5,0xffFA7823};

ArrayList<Sq> squares = new ArrayList<Sq>();
int m = 20;
public void setup() {
	
	noLoop();
	noStroke();
	squares.add(new Sq(m, m, width - m));
}
public void draw() {
	background(palette[0]);
	drawSquare(5);
	for (Sq sq : squares) {
		sq.display();
	}
}
public void drawSquare(int l) {
	ArrayList<Sq> temp = new ArrayList<Sq>();
	if (l > 1) {
		for (Sq sq : squares) {
			float r = random(1);
			if (r < .75f) {
				temp.add(new Sq(sq.x,            sq.y,            sq.s / 2));
				temp.add(new Sq(sq.x + sq.s / 2, sq.y,            sq.s / 2));
				temp.add(new Sq(sq.x + sq.s / 2, sq.y + sq.s / 2, sq.s / 2));
				temp.add(new Sq(sq.x,            sq.y + sq.s / 2, sq.s / 2));
			} else {
				temp.add(new Sq(sq.x, sq.y, sq.s));
			}
		}
		squares = temp;
		l--;
		drawSquare(l);
	}
}

class Sq {
	float x, y, s;
	Sq (float _x, float _y, float _s) {
		x = _x;
		y = _y;
		s = _s;
	}
	public void display() {
		fill(palette[(int)random(1, palette.length)]);
		square(x, y, s - m);
	}
}

public void mousePressed() {
	redraw();
}



public void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		exit();
		break;
	}
}
  public void settings() { 	size(1920, 1920); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
