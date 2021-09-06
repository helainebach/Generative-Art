color[] palette1  	= {#F4D8E8,#BA4950,#E5C6BD,#36332D,#00577B,#00A5B9,#606793,#AEC3DF};
color[] palette2 	= {#63416A,#FBDD73,#B7CC55,#39A129,#BAAAEE,#C55F8F,#FB8588};
color[] palette3 	= {#3592A9,#49261F,#E8DEBF,#292D4E,#333D2A,#79805A,#A1B3C4,#0D0D0F};
color[] palette4  	= {#DF938D,#ECF7F1,#004C66,#CC3141,#8E0001};
color[] palette5  	= {#A33920,#36354C,#657978,#C47660};
color[] palette6  	= {#CCB0F7,#A9ECFF,#F7A0B3};
color[] palette7  	= {#264653,#2a9d8f,#e9c46a,#f4a261,#e76f51};
color[] palette8  	= {#F60000,#FF8C00,#FFEE00,#4DE94C,#3783FF,#4815AA};
color[] palette9  	= {#192C37,#507282,#7E8959,#C9AC68,#5C4A56,#9F2214};
color[] palette10  	= {#FC6919,#481D4A,#7E70C5,#EE3163,#F9D691};



int total = 10;

void settings() {
	size(500,total*50);
}

void draw() {
	background(0);
	strip(palette1, 	0	*	height/total);
	strip(palette2, 	1	*	height/total);
	strip(palette3, 	2	*	height/total);
	strip(palette4, 	3	*	height/total);
	strip(palette5, 	4	*	height/total);
	strip(palette6, 	5	*	height/total);
	strip(palette7, 	6	*	height/total);
	strip(palette8, 	7	*	height/total);
	strip(palette9, 	8	*	height/total);
	strip(palette10, 	9	*	height/total);
	// strip(palette11, 10	*	height/total);
	// strip(palette12, 11	*	height/total);
	// strip(palette13, 12	*	height/total);
	// strip(palette14, 13	*	height/total);
	// strip(palette15, 14	*	height/total);
	// strip(palette16, 15	*	height/total);
	// strip(palette17, 16	*	height/total);

}

void strip(color[] palette, float y){
	for (float i = 0; i < palette.length; i++) {
		noStroke();
		fill(palette[(int)i]);
		rect(i*(width/palette.length),y+10,width/palette.length,(height)/total-10);
	}
}

void mousePressed() {
	float y = mouseY;
	println(1+(int)y/(height/total));
}
