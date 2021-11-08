ArrayList <Poly> polys  = new ArrayList <Poly> ();
int margin  = 5;
int polyRes = 5;
color[] palette 		= {#ECF7F1,#004C66,#DF938D,#CC3141,#8E0001};
color   bg 				= palette[0];

void setup() {
	size(600, 600);
	noFill();
	polys.add(new Poly(margin, margin, width - margin * 2, height - margin * 2, polyRes));
	generate(8);
}
void draw() {
	noLoop();
	background(bg);
	for (Poly poly : polys) {
		poly.display();
	}
}
void generate(int gen) {
	ArrayList temp = new ArrayList <Poly>();
	if (gen > 1) {
		for (Poly p : polys) {
			float r = random(1);
			if (r > .25) {
				temp.add(new Poly(p.x,           p.y,           p.w / 2, p.h / 2, polyRes));
				temp.add(new Poly(p.x + p.w / 2, p.y,           p.w / 2, p.h / 2, polyRes));
				temp.add(new Poly(p.x + p.w / 2, p.y + p.h / 2, p.w / 2, p.h / 2, polyRes));
				temp.add(new Poly(p.x,           p.y + p.h / 2, p.w / 2, p.h / 2, polyRes));
			} else {
				temp.add(new Poly(p.x,           p.y,           p.w,     p.h,     polyRes));
			}
		}
		polys = temp;
		gen--;
		generate(gen);
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