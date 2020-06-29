import java.text.SimpleDateFormat;
import java.util.Date;
PImage    	myColor;
int    	  	stageW   		= 1080;
int    	  	stageH   		= 1080;
int 	  	scaleFactor 	= 2;
color  	  	clrBG 			= 0;
String 	  	pathDATA 		= "../../../0_data/";
boolean   	sclDown			= true;
int 	  	size 			= 180;
int 	  	count;
color[]   	pickedColors;
PShape[]  	shapes;
	
void settings(){
	if (sclDown){
		size(stageW/scaleFactor,stageH/scaleFactor); 
	}else{
		size(stageW,stageH);
	}
}
void setup() {
	myColor = loadImage(pathDATA + "gradientFull/rainbow_02.png");
	loadShapes();
	noLoop();
	shapeMode(CENTER);
}

void draw() {
	
	frameRate(3);
	background(clrBG);	

	if (sclDown){
		scale(.5);
	}
	for (int x = 0; x < 6; x++) {
		for (int y = 0; y < 6; y++) {
			stroke(myColor.get((x*size+size/2)/2,(y*size+size/2)/2));
			strokeWeight(2);
			fill(myColor.get((x*size+size/2)/2,(y*size+size/2)/2),(int)random(50,200));
			pushMatrix();
				translate(x*size+size/2,y*size+size/2);
				rotate((int)random(4)*HALF_PI);
			shape(shapes[(int)random(shapes.length-1)],0,0,size-20,size-20);
			popMatrix();
		}
	}
	paper(2,3,30); //noiseRes, speckSize, speckCount,
}

void paper(int noiseRes, int speckSize, int speckCount) {
  noStroke();
  for (int i = 0; i<stageW-noiseRes/2; i+=noiseRes) {
    for (int j = 0; j<stageH-noiseRes/2; j+=noiseRes) {
      fill(random(170, 240), 25);
      rect(i, j, noiseRes, noiseRes);
    }
  }
  for (int i = 0; i<speckCount; i++) {
    fill(random(130, 215), random(20, 100));
    rect(random(0, stageW-speckSize/2), random(0, stageH-speckSize/2), random((int)speckSize/2, speckSize), random((int)speckSize/2, speckSize));
  }
}
void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		break;
	}
}

void loadShapes(){
	count = 10;
	shapes = new PShape[count];
	for (int i = 0; i < count; i++) {
		shapes[i] = loadShape(pathDATA+"svg/17/"+i+".svg");
		shapes[i].disableStyle();
	}
}

