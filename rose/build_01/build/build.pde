import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
String  fileName;
void setup(){
	size(800, 800);
}
void draw() {
	background(255);
  	if (exportSVG){
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());	
  	 	beginRecord(SVG, "../exports/svgs/"+fileName+".svg");
  	}
	noFill();
  	stroke(0);
//--------------------------------------------	
	rose(width/2,height/2,7,2,width/2);
//--------------------------------------------	
  	if (exportSVG){
  	  	endRecord();
  	  	exportSVG = false;
 	}
}
void keyPressed(){
	if (key == 'e'){
  		exportSVG = true;
  	}
}
void rose(float px, float py, float n, float d, float rad){
	pushMatrix();
		translate(px,py);
	float k = n / d;
	beginShape();
	for (float a = 0; a < TWO_PI*d; a+=.01) {
		float r = rad*cos(k*a);
		float x = r * cos(a);
		float y = r * sin(a);
		vertex(x,y);
	}
	endShape(OPEN);
	popMatrix();
}
