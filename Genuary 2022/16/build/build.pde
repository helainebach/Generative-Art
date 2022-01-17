color[] palette  = {#0160B6,#FFDD5E,#03A08F,#FF3C1B,#FFA051};

void setup() {
	int n = palette.length;
	size(1080, 1080);
	noFill();
	for (int a = 0; a < n; a++) {
		for (int b = 0; b < n; b++) {
			for (int i = 0; i < width; i++) {
				color c = lerpColor(palette[a], palette[b], map(i, 0, width, 0, 1));
				stroke(c);
				strokeWeight(1);
				float y = a * height / n + b * height / (n * n);
				line(i, y, i, y + height / (n * n));
			}
		}
	}
}
