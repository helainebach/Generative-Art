
import java.text.SimpleDateFormat;
import java.util.Date;
import processing.pdf.*;
int rand = 1;
String  folderName;
boolean exportSVG = false;
String  fileName;

void setup() {
  size(800, 800);
  background(255);
  folderName  = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
}

void draw() {
  noFill();
  stroke(0);
  //--------------------------------------------
  blend(40, 6, 0, 0, width, height, 2, rand);
  //--------------------------------------------
}

void mouseReleased() {
  String fileName = new SimpleDateFormat("yyyyMMddHHmmss'.pdf'").format(new Date());
  beginRecord(PDF, "../exports/pdf/" + folderName + "/" + fileName);
  background(255);
  rand++;
}

void mousePressed() {
  endRecord();
}

void keyPressed() {
  switch (key) {
  case 'x': endRecord(); exit();
    break;

  case 'r': rand++; background(255);
    break;
  }
}

void blend(int lineNumber, int points, int xl, int yl, int w, int h, int randA, int rand) {
  translate(xl, yl);
  PVector[] a = new PVector[points];
  PVector[] b = new PVector[points];
  for (int i = 1; i < points; i++) {
    randomSeed(1000 * i * rand);
    a[i] = new PVector();
    b[i] = new PVector();
    a[i].x = (int)random(0, w / points * 2);
    b[i].x = ((w / points) * points) - (int)random(0, w / points * 2);
    a[i].y = i * (h / points) + random(-h / points / randA, h / points / randA);
    b[i].y = i * (h / points) + random(-h / points / randA, h / points / randA);
  }
  for (int j = 0; j <= lineNumber; j++) {
    beginShape();


    curveVertex((w / lineNumber) * j - 1, 0);
    curveVertex((w / lineNumber) * j, 0);
    for (int i = 1; i < points; i++) {
      float l = map(j, 0, lineNumber, 0, 1);
      float x = lerp(a[i].x, b[i].x, l);
      float y = lerp(a[i].y, b[i].y, l);
      curveVertex(x, y);
    }
    curveVertex((w / lineNumber) * j, h);
    curveVertex((w / lineNumber) * j + 1, h);
    endShape(OPEN);
  }
}
