int    	stageW   	= 1080;
int    	stageH   	= 1080;
int 	scaleFactor = 2;
color  	clrBG    	= #202020;
String 	pathDATA 	= "../../../data/";
boolean sclDown		= true;

void settings(){
	if (sclDown){
		size(stageW/scaleFactor,stageH/scaleFactor); 
	}else{
		size(stageW,stageH);
	}
}

void setup() {
	
	background(clrBG);	
}

void draw() {
	if (sclDown){
		scale(.5);
	}

}