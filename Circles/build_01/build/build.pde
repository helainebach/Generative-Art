color[] palette = {#170F27,#553470,#AB2658,#E8C954,#39736A};
int 	i 		= 2;
float 	off 	= 0.0;
float 	rate 	= .01;
void setup() {
	size(600, 600);
	ellipseMode(CENTER);
	noFill();
	background(palette[0]);
}
void draw() {
	// frameRate(10);
	float n = noise(off);
	float d = map(n, 0, 1, 10, width);
	stroke(palette[i], 20);
	strokeWeight(5);
	translate(n*random(-50, 50), n*random(-50, 50));
	circle(width / 2, height / 2, d);
	off += rate;
}
import java.text.SimpleDateFormat;
import java.util.Date;
void mousePressed() {
	String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
	saveFrame("../exports/stills/" + fileName);
}
void mouseReleased() {
	background(palette[0]);
}
void keyPressed() {
	switch (key) {
	case 'p':
		i = constrain((int)(i + i) % palette.length, 1, palette.length);
		break;
	}
}