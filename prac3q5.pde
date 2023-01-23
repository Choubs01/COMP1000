
void setup(){
  size(500,300);
  background(0);
  frameRate(32);
}



void draw(){
  //background(0);
  float x = random(width);
  float y1 = random(height);
  float y2 = random(height);
  stroke(255,0,0);
  strokeWeight(3);
  line(x,y1, x,y2);
}
