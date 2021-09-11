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
// Run Sketch and click on a palette to return the number of the palette, 
// so it can be copied into another sketch.
// Add new palettes to 2D array.

int[][] palette = {
	/* 1  */ {0xffF60000,0xffFF8C00,0xffFFEE00,0xff4DE94C,0xff3783FF,0xff4815AA},
	/* 2  */ {0xffF4D8E8,0xffBA4950,0xffE5C6BD,0xff36332D,0xff00577B,0xff00A5B9,0xff606793,0xffAEC3DF},
	/* 3  */ {0xff63416A,0xffFBDD73,0xffB7CC55,0xff39A129,0xffBAAAEE,0xffC55F8F,0xffFB8588},
	/* 4  */ {0xff3592A9,0xff49261F,0xffE8DEBF,0xff292D4E,0xff333D2A,0xff79805A,0xffA1B3C4,0xff0D0D0F},
	/* 5  */ {0xffDF938D,0xffECF7F1,0xff004C66,0xffCC3141,0xff8E0001},
	/* 6  */ {0xffA33920,0xff36354C,0xff657978,0xffC47660},
	/* 7  */ {0xffCCB0F7,0xffA9ECFF,0xffF7A0B3},
	/* 8  */ {0xff264653,0xff2a9d8f,0xffe9c46a,0xfff4a261,0xffe76f51},
	/* 9  */ {0xff192C37,0xff507282,0xff7E8959,0xffC9AC68,0xff5C4A56,0xff9F2214},
	/* 10 */ {0xffFC6919,0xff481D4A,0xff7E70C5,0xffEE3163,0xffF9D691},
	/* 11 */ {0xff2E2D36,0xff706560,0xffA57B52,0xffCEBA9E,0xff996C54}
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
	println(y + 1);
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
