import com.jogamp.opengl.GLProfile;
{
	GLProfile.initSingleton();
}
import processing.svg.*;
import java.text.SimpleDateFormat;
import java.util.Date;
boolean exportSVG = false;
String  fileName;
color[] palette = {#F3E3ED,#FEC513,#FE7434,#EFA9EC,#010300};
int closest;
PVector[] points = new PVector[20];
String pathDATA = "../../../0_data/";
void setup() {
	ellipseMode(CENTER);
	size(600, 600, P3D);
	noFill();
	pickPoints();
}
void draw() {
	background(255);
	if (exportSVG) {
		fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		beginRecord(SVG, "../exports/svgs/" + fileName + ".svg");
	}
	for (int y = 10; y < height - 10; y++) {
		for (int x = 10; x < width - 10; x++) {
			float[] distances = new float[points.length];
			float min_d = width;
			for (int i = 0; i < points.length; i++) {
				PVector v = points[i];
				float z = mouseX;
				// float d = dist(x, y, z, v.x, v.y, v.z);
				float d = dist(x, y, v.x, v.y);
				distances[i] = d;
				if (d < min_d) {
					min_d = d;
					closest = i;
				}
			}
			int n = 0;
			float[] sorted = sort(distances);
			int noise = (int)sorted[n];
			int pix;
			if (closest % 3 == 0) {
				pix = 10;
			} else {
				pix = 25;
			}
			if (x % pix == 0 && y % pix == 0) {
				noStroke();
				fill(palette[closest % palette.length]);
				float size = map(noise, 0, 160, pix * .9, 1);
				if (size > 3) circle(x, y, size);
			}
		}
	}
	if (exportSVG) {
		endRecord();
		exportSVG = false;
	}
}
void mousePressed() {
	exportSVG = true;
	pickPoints();
}
void pickPoints() {
	for (int i = 0; i < points.length; i++) {
		points[i] = new PVector(random(width), random(height), random(width / 2));
	}
}