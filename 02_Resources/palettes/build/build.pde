// This sketch is a reference to preview color palettes often used in my work.
// Run Sketch and click on a palette to return the palette for use in a sketch.
// Add new palettes to 2D array.

color[][] palette = {
	{#F60000,#FF8C00,#FFEE00,#4DE94C,#3783FF,#4815AA},
	{#63416A,#FBDD73,#B7CC55,#39A129,#BAAAEE,#C55F8F,#FB8588},
	{#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F},
	{#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001},
	{#A33920,#36354C,#657978,#C47660},
	{#CCB0F7,#A9ECFF,#F7A0B3},
	{#264653,#2a9d8f,#e9c46a,#f4a261,#e76f51},
	{#FC6919,#481D4A,#7E70C5,#EE3163,#F9D691},
	{#051531,#E8C954,#004956},
	{#040F15,#094B70,#C0AFBD,#422937,#014751},
	{#553470,#AB2658,#E8C954,#39736A,#170F27},
	{#F04F32,#F3C91C,#1060B0,#EFF0F5,#252020},
	{#E145E5,#FBDD73,#4F97F1,#B9CCE3},
	{#050A0E,#494643,#7E765B,#041E43,#001A1E},
	{#000f41,#ffffff,#a500fa,#fba422,#61ff82,#55fff5,#fa7823}
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
	int l = palette[y].length;
	String 	[] colors = new String [l];
	print("color[] palette = {");
	for (int i = 0; i < l; i++) {
		colors[i] = hex(palette[y][i], 6);
		if (i < l - 1) {
			print("#" + colors[i] + ",");
		} else {
			print("#" + colors[i] + "};");
		}
	}
	println();
}