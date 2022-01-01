/* autogenerated by Processing revision 1276 on 2021-12-18 */
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
	{0xFF0160B6,0xFF03A08F,0xFFFFDD5E,0xFFFFA051,0xFFFF3C1B},
	{0xFF5A3174,0xFFBEA7F2,0xFFD55691,0xFFFFDC5E,0xFFB1CD3C,0xFF00A500},
	{0xFF000F41,0xFF55FFF5,0xFF1ECD1E,0xFFA500FA,0xFFFA7823,0xFFFFFA37,0xFFDE1C1C},
	{0xFF4D241D,0xFFEADEBB,0xFF37344F,0xFF607A78,0xFF9B0000,0xFFEA8F8A}
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

// {#FFDD5E,#00efa8,#0a39ea,#ff80b5,#FF3C1B},
// {#F60000,#FF8C00,#FFEE00,#4DE94C,#3783FF,#4815AA},
// {#F04F32,#F3C91C,#1060B0,#EFF0F5,#252020},
// {#63416A,#FBDD73,#B7CC55,#39A129,#BAAAEE,#C55F8F,#FB8588},
// {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F},
// {#A33920,#36354C,#657978,#C47660},
// {#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001},
// {#CCB0F7,#A9ECFF,#F7A0B3},
// {#264653,#2a9d8f,#e9c46a,#f4a261,#e76f51},
// {#FC6919,#481D4A,#7E70C5,#EE3163,#F9D691},
// {#051531,#E8C954,#004956},
// {#040F15,#094B70,#C0AFBD,#422937,#014751},
// {#553470,#AB2658,#E8C954,#39736A,#170F27},
// {#E145E5,#FBDD73,#4F97F1},
// {#050A0E,#494643,#7E765B,#041E43,#001A1E},
// {#ffd03f,#00efa8,#0a39ea,#ff80b5,#ff0030},
// {#000f41,#ffffff,#a500fa,#fba422,#61ff82,#55fff5,#fa7823}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
