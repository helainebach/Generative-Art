import java.text.SimpleDateFormat;
import java.util.Date;
import ddf.minim.*;
import ddf.minim.ugens.*;
// 		  					0 black // 1 white // 2 yellow // 3 orange // 4 purple
color[] 		palette  = {#010300,#F3E3ED,#FEC513,#FE7434,#EFA9EC};
String 			pathDATA = "../../../0_data/";
Table 			prompts;
String  		folderName;
PFont 			font;
int 			day 	 = 10;
Minim 			minim;
AudioOutput   	out;
AudioRecorder 	recorder;
Sampler     	kick;
Sampler     	snare;
Sampler     	hihat;
color 			bg = palette[1];
//
void setup() {
	size(1080, 1080);
	folderName 	= new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	font 		= createFont(pathDATA + "fonts/ubuntu.ttf", 20);
	prompts 	= loadTable("../../prompts.csv", "header");
	//
	minim 		= new Minim(this);
	out 		= minim.getLineOut();
	recorder 	= minim.createRecorder(out, "../exports/" + folderName + ".wav");
	kick  		= new Sampler( "BD.mp3", 4, minim );
	snare 		= new Sampler( "SD.wav", 4, minim );
	hihat 		= new Sampler( "HH.wav", 4, minim );
	snare.patch(out);
	kick.patch(out);
	hihat.patch(out);
	background(bg);
}
void draw() {
	recorder.beginRecord();
	
	if (frameCount % 30 == 0) bd();
	if (frameCount % 20 == 0 || frameCount % 55 == 0) sd();
	if (frameCount % 100 == 0) hh();
	
	if (recorder.isRecording()) record();
	sig(day, prompts.getString(day - 1, 0), true, 1, 0);
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
}
void bd() {
	kick.trigger();
	bg = palette[3];
	fill(palette[1]);
	noStroke();
	for (int i = 0; i < (int)random(10, 50); i++) {
		circle(random(width), random(height), random(10, 200));
	}
}
void sd() {
	snare.trigger();
	bg = palette[1];
	noStroke();
	fill(palette[4]);

	for (int i = 0; i < (int)random(10, 50); i++) {
		circle(random(width), random(height), random(10, 200));
	}
}
void hh() {
	hihat.trigger();
	bg = palette[4];
	noStroke();
	fill(palette[3]);
	for (int i = 0; i < (int)random(10, 50); i++) {
		circle(random(width), random(height), random(10, 200));
	}
}
void keyPressed() {
	if (key == 'k') bd();
	if (key == 's') sd();
	if (key == 'h') hh();
}
void keyReleased() {
	if ( key == 'r' ) {
		if (recorder.isRecording()) {
			recorder.endRecord();
		} else {
			recorder.beginRecord();
		}
	}
	if ( key == 'w' ) {
		recorder.endRecord();
		recorder.save();
		exit();
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