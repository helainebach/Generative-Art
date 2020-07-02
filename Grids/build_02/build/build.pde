import java.text.SimpleDateFormat;
import java.util.Date;
PImage    	myColor;
int    	  	stageW   		= 1920;
int    	  	stageH   		= 1080;
int 	  	scaleFactor 	= 2;
color  	  	clrBG 			= 0;
String 	  	pathDATA 		= "../../../0_data/";
boolean   	sclDown			= false;
boolean   	record			= false;
int 	  	size 			= 120;
int 	  	count;
color[]   	pickedColors;
PShape[]  	shapes;
float theta;
	
void settings(){
	if (sclDown){
		size(stageW/scaleFactor,stageH/scaleFactor); 
	}else{
		size(stageW,stageH);
	}
}
void setup() {
	myColor = loadImage(pathDATA + "gradientFull/pink_yellow_02.png");
	loadShapes();
	noLoop();
	shapeMode(CENTER);
}

void draw() {
	background(clrBG);	

	if (sclDown){
		scale(.5);
	}
	theta+=.02;
	for (int x = 0; x < 16; x++) {
		for (int y = 0; y < 9; y++) {
			strokeWeight(2);
			stroke(myColor.get((x*size+size/2)/4,(y*size+size/2)/2));
			fill(myColor.get((x*size+size/2)/4,(y*size+size/2)/2),100);
			pushMatrix();
				translate(x*size+size/2,y*size+size/2);
				// rotate(theta);
				rotate(HALF_PI/3);
			shape(shapes[(int)random(shapes.length)],0,0,size+size/6,size+size/6);
			popMatrix();
		}
	}
	paper(2,3,30); //noiseRes, speckSize, speckCount,
	if (record){
		int vidLength = 5;
		int fps       = 30;
		saveFrame("../exports/frames2/###.png"); if (frameCount == vidLength*fps) exit();
		println(frameCount+" of "+(int)vidLength*fps);	
	}

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

