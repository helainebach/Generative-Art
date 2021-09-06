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

int[] palette1  	= {0xffF4D8E8,0xffBA4950,0xffE5C6BD,0xff36332D,0xff00577B,0xff00A5B9,0xff606793,0xffAEC3DF};
int[] palette2 	= {0xff63416A,0xffFBDD73,0xffB7CC55,0xff39A129,0xffBAAAEE,0xffC55F8F,0xffFB8588};
int[] palette3 	= {0xff3592A9,0xff49261F,0xffE8DEBF,0xff292D4E,0xff333D2A,0xff79805A,0xffA1B3C4,0xff0D0D0F};
int[] palette4  	= {0xffDF938D,0xffECF7F1,0xff004C66,0xffCC3141,0xff8E0001};
int[] palette5  	= {0xffA33920,0xff36354C,0xff657978,0xffC47660};
int[] palette6  	= {0xffCCB0F7,0xffA9ECFF,0xffF7A0B3};
int[] palette7  	= {0xff264653,0xff2a9d8f,0xffe9c46a,0xfff4a261,0xffe76f51};
int[] palette8  	= {0xffF60000,0xffFF8C00,0xffFFEE00,0xff4DE94C,0xff3783FF,0xff4815AA};
int[] palette9  	= {0xff192C37,0xff507282,0xff7E8959,0xffC9AC68,0xff5C4A56,0xff9F2214};
int[] palette10  	= {0xffFC6919,0xff481D4A,0xff7E70C5,0xffEE3163,0xffF9D691};



int total = 10;

public void settings() {
	size(500,total*50);
}

public void draw() {
	background(0);
	strip(palette1, 	0	*	height/total);
	strip(palette2, 	1	*	height/total);
	strip(palette3, 	2	*	height/total);
	strip(palette4, 	3	*	height/total);
	strip(palette5, 	4	*	height/total);
	strip(palette6, 	5	*	height/total);
	strip(palette7, 	6	*	height/total);
	strip(palette8, 	7	*	height/total);
	strip(palette9, 	8	*	height/total);
	strip(palette10, 	9	*	height/total);
	// strip(palette11, 10	*	height/total);
	// strip(palette12, 11	*	height/total);
	// strip(palette13, 12	*	height/total);
	// strip(palette14, 13	*	height/total);
	// strip(palette15, 14	*	height/total);
	// strip(palette16, 15	*	height/total);
	// strip(palette17, 16	*	height/total);

}

public void strip(int[] palette, float y){
	for (float i = 0; i < palette.length; i++) {
		noStroke();
		fill(palette[(int)i]);
		rect(i*(width/palette.length),y+10,width/palette.length,(height)/total-10);
	}
}

public void mousePressed() {
	float y = mouseY;
	println(1+(int)y/(height/total));
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
