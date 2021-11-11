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

// This sketch is a reference to preview color palettes often used in my work.
// Run Sketch and click on a palette to return the palette for use in a sketch.
// Add new palettes to 2D array.

int[][] palette = {
	{0xffF60000,0xffFF8C00,0xffFFEE00,0xff4DE94C,0xff3783FF,0xff4815AA},
	{0xff63416A,0xffFBDD73,0xffB7CC55,0xff39A129,0xffBAAAEE,0xffC55F8F,0xffFB8588},
	{0xff3592A9,0xff49261F,0xffE8DEBF,0xff292D4E,0xff333D2A,0xff79805A,0xffA1B3C4,0xff0D0D0F},
	{0xffDF938D,0xffECF7F1,0xff004C66,0xffCC3141,0xff8E0001},
	{0xffA33920,0xff36354C,0xff657978,0xffC47660},
	{0xffCCB0F7,0xffA9ECFF,0xffF7A0B3},
	{0xff264653,0xff2a9d8f,0xffe9c46a,0xfff4a261,0xffe76f51},
	{0xffFC6919,0xff481D4A,0xff7E70C5,0xffEE3163,0xffF9D691},
	{0xff051531,0xffE8C954,0xff004956},
	{0xff040F15,0xff094B70,0xffC0AFBD,0xff422937,0xff014751},
	{0xff553470,0xffAB2658,0xffE8C954,0xff39736A,0xff170F27},
	{0xffF04F32,0xffF3C91C,0xff1060B0,0xffEFF0F5,0xff252020},
	{0xffE145E5,0xffFBDD73,0xff4F97F1,0xffB9CCE3},
	{0xff050A0E,0xff494643,0xff7E765B,0xff041E43,0xff001A1E},
	{0xff000f41,0xffffffff,0xffa500fa,0xfffba422,0xff61ff82,0xff55fff5,0xfffa7823}
};


int total = palette.length;
public void settings() {
	size(450, total * 50);
}
public void draw() {
	noStroke();
	background(0);
	for (int i = 0; i < palette.length; i++) {
		for (int j = 0; j < palette[i].length; j++) {
			fill  (palette[i][j]);
			float x = j * (width / palette[i].length);
			float y = i * height / total;
			float w = width / palette[i].length;
			float h = (height / total) - 10;
			rect (x, y, w, h);
		}
	}
}
public void mousePressed() {
	int y = (int)mouseY / (height / total);
	int l = palette[y].length;
	String 	[] colors = new String [l];
	print("color[] palette = {");
	for (int i = 0; i < l; i++) {
		colors[i] = hex(palette[y][i], 6);
		if (i < l - 1) {
			print("#" + colors[i] + ",");
		} else {
			print("#" + colors[i] + "};");
		}
	}
	println();
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
