color[] palette 		= {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F};
// color[] palette 		= {#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001};
color   bg 				= palette[0];
ArrayList <Blob> blobs  = new ArrayList <Blob> ();
String pathDATA 		= "../../../0_data/";

void setup() {
	size(1080, 1080);
}

void draw() {
	frameRate(1000);
	background(bg);
	blobs.add(new Blob(6, random(width), random(height)));
	for (int i = 0; i < blobs.size() - 1; i++) {
		int j = blobs.size() - 1;
		if (blobs.get(j).collide(blobs.get(i))) {
			blobs.remove(j);
		}
	}
	for (Blob blob : blobs) {
		blob.display();
	}
}

import java.text.SimpleDateFormat;
import java.util.Date;
void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		exit();
		break;
	}
}