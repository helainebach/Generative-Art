int count = 20;
int x,y,w,h,c,n;
float dy;
int stripWidth;
//colors
color [] palette = {#2E222C,#945961,#E99D95,#F3D3A2,#159A79,#0A2C3A,#245261,#5B93A3,#C3FBC9,#BFBCD3};
int [] divisions = new int[count];
float theta = 0;

void setup() {
	//comp size
	size(800,800);
}

void draw(){
	//draws strips
	for (int i = 0; i < count; i++) {
		strip(i*(width/count),0,width/count,height,i,i);
	}
	//draws border on edges
	noFill();
	strokeWeight(6);
	rect(0, 0, width, height);
}

void strip(int x, int y, int w, int h, int c, int n){
	strokeWeight(3);
	randomSelect();
	stripWidth = width/count;
	stroke(#FDEDC7);
	fill(color(palette[c%palette.length]));
	rect(x,y,w,h);

	for (int i = 0; i < divisions[n]; i++) {
		//dy and theta drive the movement
		dy = i*(height/divisions[n])+theta%(height/divisions[n]);
		theta += c/15%10;
		line(x,dy,x+stripWidth,dy);
	}	
}
//picks random numbers
void randomSelect(){
		randomSeed(0);
	for (int i = 0; i < divisions.length; i++) {
		divisions [i] = (int) random(5,25);
	}
}


	

