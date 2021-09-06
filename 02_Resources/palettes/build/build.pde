// This sketch is a reference to preview color palettes often used in my work.
// Run Sketch and click on a palette to return the number of the palette, 
// so it can be copied into another sketch.
// Add new palettes to 2D array.

color[][] palette = {
	/* 1  */ {#F60000,#FF8C00,#FFEE00,#4DE94C,#3783FF,#4815AA},
	/* 2  */ {#F4D8E8,#BA4950,#E5C6BD,#36332D,#00577B,#00A5B9,#606793,#AEC3DF},
	/* 3  */ {#63416A,#FBDD73,#B7CC55,#39A129,#BAAAEE,#C55F8F,#FB8588},
	/* 4  */ {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F},
	/* 5  */ {#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001},
	/* 6  */ {#A33920,#36354C,#657978,#C47660},
	/* 7  */ {#CCB0F7,#A9ECFF,#F7A0B3},
	/* 8  */ {#264653,#2a9d8f,#e9c46a,#f4a261,#e76f51},
	/* 9  */ {#192C37,#507282,#7E8959,#C9AC68,#5C4A56,#9F2214},
	/* 10 */ {#FC6919,#481D4A,#7E70C5,#EE3163,#F9D691}
};
int total = palette.length;

void settings() {
	size(450, total * 50);
}

void draw() {
	noStroke();
	background(0);
	for (int i = 0; i < palette.length; i++) {
		for (int j = 0; j < palette[i].length; j++) {
			fill  (palette[i][j]);
			float x = j * (width / palette[i].length);
			float y = i * height / total;
			float w = width / palette[i].length;
			float h = (height / total) - 10;
			rect (x, y, w, h);
		}
	}
}

void mousePressed() {
	int y = (int)mouseY / (height / total);
	println(y + 1);
}