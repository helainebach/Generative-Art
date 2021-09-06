import java.text.SimpleDateFormat;
import java.util.Date;

int 	count = 20;
int 	x,y,w,h,c,n;
float 	dy;
int 	stripWidth;
//colors
color 	[] palette = {#2E222C,#945961,#E99D95,#F3D3A2,#159A79,#0A2C3A,#245261,#5B93A3,#C3FBC9,#BFBCD3};
int 	[] divisions = new int[count];

void setup() {
	//comp size
	size(800,800);
}

void draw(){
	//controls speed of animation
	frameRate(5);
	//draws strips
	for (int i = 0; i < count; i++) {
		strip(i*(width/count),0,width/count,height,i,i);
	}
	//draws border
	noFill();
	strokeWeight(6);
	rect(0, 0, width, height);
	//draws circles
	for (int i = 0; i < 100; i++) {
		strokeWeight(3);
		fill(color(palette[(int)random(palette.length)]));
		circle(random(0,width),random(0,height),random(5,20));
	}
	exportVideo();	
}

void strip(int x, int y, int w, int h, int c, int n){
	strokeWeight(3);
	randomSelect();
	stripWidth = width/count;
	stroke(0);
	fill(color(palette[c%palette.length]));
	rect(x,y,w,h);
	for (int i = 0; i < divisions[n]; i++) {
		dy = i*(height/divisions[n]);
		line(x,dy,x+stripWidth,dy);
	}
}

void randomSelect(){
	for (int i = 0; i < divisions.length; i++) {
		divisions [i] = (int) random(5,25);
	}
}

void exportVideo(){
	float vidLength = 15;
	float fps       = 6;
	saveFrame("../exports/frames2/###.png"); if (frameCount == vidLength*fps) exit();
}


	

