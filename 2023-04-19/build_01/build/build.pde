import java.text.SimpleDateFormat;
import java.util.Date;
String 	pathDATA = "../../../0_data/";
String  folderName;
float   rate = PI / 400;
color  	bg   = #F3E3ED;
color  	fg   = #010300;
float 	c, u, n, t;
//
void setup() {
	folderName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	size(600, 600);
	noFill();
	rectMode(CENTER);
	u = 8;
	u = width / u;
}
void draw() {
	background(bg);
	for (float y = u / 2; y < height; y += u) {
		for (float x = u / 2; x < width; x += u) {
			c = u;
			while (c > 0) {
				n = noise(c, x + map(mouseX, 0, width, 0, 1), y + map(mouseY, 0, height, 0, 1));
				// n = noise(c, x + abs(sin(t)), y + abs(cos(t)));
				if (n > .5) {
					stroke(fg);
				} else {
					noStroke();
				}
				square(x, y, c);
				c--;
			}
			c = u;
		}
	}
	t += rate;
	// record();
}
void record() {
	saveFrame("../exports/" + folderName + "/###.png");
	if (frameCount > TWO_PI / rate) exit();
}
void mousePressed() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
	saveFrame("../exports/" + folderName + "/" + fileName);
}