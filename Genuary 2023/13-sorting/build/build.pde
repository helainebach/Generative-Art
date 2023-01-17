import java.text.SimpleDateFormat;
import java.util.Date;
// 		  			0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] 	palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 		pathDATA = "../../../0_data/";
Table 		prompts;
String  	folderName;
PFont 		font;
float 		off 	 = 0;
float   	rate 	 = PI / 150;
int 		day 	 = 13;
PImage  	img;
int     	count = 8;
int 		i = 0;
int 		j = 0;
PVector[] 	l = new PVector[(int)count*count];
IntList 	order;
//
void setup() {
	size(1080, 1080);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	img 		= loadImage(pathDATA+"/photo/coral.png"); img.resize(width,height);
	order 		= new IntList();

	for (int n 	= 0; n < count*count; n++) {
		l[n] = new PVector(n%count* width/count, n/count*height/count);
		order.append(n);
	}
	order.shuffle();
}
void swap(IntList arr, int j, int a, int b){
	int temp = a;
	arr.set(j,b);
	arr.set(j+1,temp);
}
void draw() {
	if(i<order.size()){
		for (int j = 0; j < order.size()-i-1; j++) {
			int a = order.get(j);
			int b = order.get(j+1);
			if (a>b) {
				swap(order,j,a,b);
			}
			
		}
		// record();
	}else{
		noLoop();
		exit();
	}
	i++;
	background(palette[1]);
	for (int i = 0; i < count*count; i++) {
		int sourceP = order.get(i);
		piece(sourceP,i);	

	}
	for (int i = 0; i < count*count; i++) {
		int sourceP = order.get(i);
		blendMode(LIGHTEST);
		noStroke();
		fill(palette[2+(sourceP%(palette.length-2))]);
		rect((int)l[i].x, (int)l[i].y, width/count, height/count);
	}
	blendMode(REPLACE);
	grid(count);
	sig(day, prompts.getString(day - 1, 0), true, 0, 2);
	off += rate;
	record();
}
void piece(int sourceP, int destP){
	copy(img, (int)l[sourceP].x, (int)l[sourceP].y, width/count, height/count, (int)l[destP].x, (int)l[destP].y, width/count, height/count);
	filter(GRAY);


}
void grid(int count){
	int area = count*count;
	int cell = width/count;
	for (int n = 0; n < area; n++) {
		int x = (n%count)*cell;
		int y = (n/count)*cell;
		noFill();
		strokeWeight(5);
		stroke(palette[4]);
		square(x,y,cell);
	}
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
}
void keyPressed() {
	switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/" + folderName+"/"+fileName);
		break;
	}
}
void sig(int d, String prompt, boolean bg, int textCol, int bgCol) {
	String txt = "#genuary" + d + " // " + prompt + " // @helainebach";
	int n = txt.length();
	if (bg) {
		fill(palette[bgCol]);
		stroke(palette[bgCol]);
		strokeWeight(10);
		rect((width - 20) - n * 10, 20, n * 10, 20);
	}
	textFont(font);
	textAlign(RIGHT, TOP);
	fill(palette[textCol]);
	text(txt, width - 20, 20);
}