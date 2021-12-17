color[] palette = {#000F41,#A500FA,#55FFF5,#FA7823};
int t, w;
void setup() {
	size(600, 600, P2D);
	noStroke();
}
void draw() {
	// scale(2);
	// translate(width / 2.5, height / 2);
	// rotate(PI / 4);
	drawing();
}
void column(int n) {
	for (int i = 0; i < n; i++) {
		fill(palette[(n + i) % palette.length]);
		rect(0, i * (height / n), w, height / n);
	}
}
void drawing() {
	// translate(-width / 2, -height / 2);
	while (t < width) {
		w = (int)(random(5, 12)) * 6;
		column((int)random(1, 4) * 4);
		translate(w, 0);
		t = t + w;
	}
}

import java.text.SimpleDateFormat;
import java.util.Date;
void keyPressed() {
		switch (key) {
		case 'p':
		String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.png'").format(new Date());
		saveFrame("../exports/stills/"+fileName);
		break;
	}
}