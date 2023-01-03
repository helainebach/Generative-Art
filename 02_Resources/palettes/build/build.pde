// This sketch is a reference to preview color palettes often used in my work.
// Run Sketch and click on a palette to return the palette for use in a sketch.
// Add new palettes to 2D array.

color[][] palette = {
	{#0160B6,#03A08F,#FFDD5E,#FFA051,#FF3C1B},
	{#5A3174,#BEA7F2,#D55691,#FFDC5E,#B1CD3C,#00A500},
	{#4D241D,#EADEBB,#37344F,#607A78,#9B0000,#EA8F8A},
	{#1A535C,#4ECDC4,#F7FFF7,#FF6B6B,#FFE66D},
	{#FF810A,#540D6E,#FFEA00,#EE4266},
	{#000F41,#55FFF5,#1ECD1E,#A500FA,#FA7823,#FFFA37,#DE1C1C},
	{#F3E3ED,#FEC513,#FE7434,#EFA9EC,#010300}
};


int total = palette.length;
void settings() {
	size(450, total * 50,P2D);
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

// {#FFDD5E,#00efa8,#0a39ea,#ff80b5,#FF3C1B},
// {#F60000,#FF8C00,#FFEE00,#4DE94C,#3783FF,#4815AA},
// {#F04F32,#F3C91C,#1060B0,#EFF0F5,#252020},
// {#63416A,#FBDD73,#B7CC55,#39A129,#BAAAEE,#C55F8F,#FB8588},
// {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F},
// {#A33920,#36354C,#657978,#C47660},
// {#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001},
// {#CCB0F7,#A9ECFF,#F7A0B3},
// {#264653,#2a9d8f,#e9c46a,#f4a261,#e76f51},
// {#FC6919,#481D4A,#7E70C5,#EE3163,#F9D691},
// {#051531,#E8C954,#004956},
// {#040F15,#094B70,#C0AFBD,#422937,#014751},
// {#553470,#AB2658,#E8C954,#39736A,#170F27},
// {#E145E5,#FBDD73,#4F97F1},
// {#050A0E,#494643,#7E765B,#041E43,#001A1E},
// {#ffd03f,#00efa8,#0a39ea,#ff80b5,#ff0030},
// {#000f41,#ffffff,#a500fa,#fba422,#61ff82,#55fff5,#fa7823}


