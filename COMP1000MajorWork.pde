float[][] Pedestrians = new float[6][2]; //6 pedestrians, 2 variables, inner loop: x-pos, speed
float[] YPedestrian = new float[6]; //Store pedestrian y position
float[] YConcrete = new float[10]; //For wally's walk texture, [0] array will be unused
float[][] Essence = new float[3][2]; //Not gonna use coke no sugar, instead will use orbs of 'essence.' 3 essences on screen at anytime. Inner loops - x-pos, 
float[] YTree = new float[4];
boolean goingRight;
boolean goingLeft;
boolean Tree1;
boolean Tree2;
boolean Tree3;
int count;
int score;
int counter;

void setup(){
  size(400,600);
  background(255);
  boolean goingRight = false;
  boolean goingLeft = false;
  boolean Tree1 = false;
  boolean Tree2 = false;
  boolean Tree3 = false;
  count = 0;
  score = 0;
  counter = 0;
  
  for (int t = 0; t < 3; t++){
    YTree[t] = 0;
  }
  
  for (int pLoop = 0; pLoop < 6; pLoop++){ //Pedestrian loop
    Pedestrians[pLoop][0] = random(80, 320); // x-pos
    Pedestrians[pLoop][1] = random(0.5, 5); //speed
    
  }
  for (int i = 0; i < 6; i++){    //Array copy of pedestrian y positions
    YPedestrian[i] = Pedestrians[i][1];
  }
  
  for (int o = 0; o < 10; o++){  //Wally's walk path loop
    YConcrete[o] = height * o/10;
  }
  
  for (int e = 0; e < 3; e++){
    Essence[e][0] = random(80, 320);
    Essence[e][1] = random(0, 300);
  }
  
}

//Function to draw the pedestrians
void drawPedestrians(float x, float y){
  fill(255, 0, 0);
  stroke(0);
  circle(x, y, 12);
  circle(x, y + 20, 26);
}

void draw(){
  background(255);   //Background setting
  fill(52,140,49);
  noStroke();
  rect(0,0,width/5,height);
  rect(width * 4/5,0,width/5,height);
  fill(160, 160, 143);
  rect(width/5, 0, width *3/5, height);
  stroke(0); 
  line(width/5, 0, width/5, height);
  
  counter += 2;
  
  if (YTree[3] < 680){
    drawSimpleTree(40, YTree[3] - 40, 20);
    drawSimpleTree(360, YTree[3] - 40, 20);
    YTree[3] += 2;
  }
  
  if (counter == 240){
    Tree1 = true;
  }
  if (Tree1 == true){
    drawSimpleTree(40, YTree[0]- 40, 20);
    drawSimpleTree(360, YTree[0]- 40, 20);
    YTree[0] += 2;
    if (YTree[0] == 680){
      YTree[0] = 0;
      Tree1 = false;
    }
  }
    
    
  
  if (counter == 440){
    Tree2 = true;
  }
  if (Tree2 == true){
    drawSimpleTree(40, YTree[1]- 40, 20);
    drawSimpleTree(360, YTree[1]- 40, 20);
    YTree[1] += 2;
    if (YTree[1] == 680){
      YTree[1] = 0;
      Tree2 = false;
    }
  }
  
  if (counter == 640){
    Tree3 = true;
  }
  if (Tree3 == true){
    drawSimpleTree(40, YTree[2]- 40, 20);
    drawSimpleTree(360, YTree[2]- 40, 20);
    YTree[2] += 2;
    if (YTree[2] == 680){
      YTree[2] = 0;
      Tree3 = false;
    }
  }
  
  if (counter > 680){
    counter = 0;
  }
  
  for (int o2 = 1; o2 < 6; o2++){ //Wally's walk vertical line texture - unchanging
    line(width/5 + width * 3/5/5 *o2, 0, width/5 + width * 3/5/5 *o2, height);
  }
  
  for (int o1 = 0; o1 < 10; o1++){  //Wally's walk horizontal line texture - changing
    line(80, YConcrete[o1], 320, YConcrete[o1]);
    YConcrete[o1] += 2;
    if (YConcrete[o1] > 600){
      YConcrete[o1] = 0;
    }
  }
  
  
/*  Thought about implementing this but it's not needed in the assignment.  
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      setup(); 
    } 
  } */
  
  drawPlayer();
  
  for (int eLoop = 0; eLoop < 3; eLoop++){
    drawEssence(Essence[eLoop][0], Essence[eLoop][1]);
    Essence[eLoop][1] += 2;
    if (Essence[eLoop][1] > 600){
      Essence[eLoop][0] = random(80, 320);
      Essence[eLoop][1] = 0;
    }
    if (dist(x1Hat + PlayerX, 535, Essence[eLoop][0], Essence[eLoop][1]) < 15){ //Collision detection for player hat 
      score++;
      Essence[eLoop][0] = random(80, 320);
      Essence[eLoop][1] = 0;
    }
    else if (dist(xTorso + PlayerX, 565, Essence[eLoop][0], Essence[eLoop][1]) < 27){ //Collision detection for player torso
      score++;
      Essence[eLoop][0] = random(80, 320);
      Essence[eLoop][1] = 0;
    }
  }
  for (int i = 0; i < 6; i++){  //Loop for moving pedestrians across canvas and collision detection
    drawPedestrians(Pedestrians[i][0], YPedestrian[i]);
    YPedestrian[i] += Pedestrians[i][1];

    if (dist(x1Hat + PlayerX, 535, Pedestrians[i][0], YPedestrian[i] + 20) < 15){ //Collision detection for player hat 
      noLoop();
      Loss();
    }
    else if (dist(xTorso + PlayerX, 565, Pedestrians[i][0], YPedestrian[i] + 20) < 26){ //Collision detection for player torso
      noLoop();
      Loss();
    }
    }
  for (int i2 = 0; i2 < 6; i2++){   //Loop for resetting pedestrians once off canvas
    if (YPedestrian[i2] > 600){
      YPedestrian[i2] = 0;
      Pedestrians[i2][0] = random(80, 320); 
      Pedestrians[i2][1] = random(0.5, 5);
    }
  }
  
  
  fill(0, 0, 0);
  textAlign(BOTTOM, LEFT);
  textSize(32);
  text(score, 10, 580);
}  


//Function to draw player
float PlayerX = 0; // Basically controls all player shape coords
float x1Hat = 90;
float x2Hat = 80;
float x3Hat = 100;

float xHead = 90;
float xTorso = 90;

void drawPlayer(){
  fill(0, 255, 0);
  stroke(0);
  if (PlayerX < 0){
    PlayerX = 0;
  }
  else if (PlayerX > 220){
    PlayerX = 220;
  }
  else if (goingRight) {
    circle(xHead + PlayerX, 545, 12); 
    triangle(x1Hat + PlayerX,530, x2Hat + PlayerX,540, x3Hat + PlayerX,540);
    circle(xTorso + PlayerX, 565, 26);
  } 
  else if (goingLeft) {
    circle(xHead - PlayerX, 545, 12); 
    triangle(x1Hat  - PlayerX,530, x2Hat - PlayerX,540, x3Hat - PlayerX,540);
    circle(xTorso - PlayerX, 565, 26);
  } 
  else if (PlayerX < 0){
    PlayerX = 0;
  }
  else {
  circle(xHead, 545, 12); 
  triangle(x1Hat,530, x2Hat,540, x3Hat,540);
  circle(xTorso, 565, 26);
  }
}


//Function for drawing the trees - x, y for coordinates, scale is size of bulbs, bulbs are number of leaves bushes, radius is the width of branches.
//Couldn't figure it out

/*void drawTree(float x, float y, float scale, int bulbs, float radius){
  fill(150, 75, 0);
  noStroke();
  circle(x, y, 10); //Centre of tree
  
  if (bulbs == 1){
    fill(58, 95, 11);
    circle(x, y, scale);
  }
  if (bulbs == 2){
    fill(0, 0, 0);
    strokeWeight(radius);
    line(x, y, x - scale, y);
    line(x, y, x + scale, y);
    strokeWeight(1);
    fill(58, 95, 11);
    circle(x - scale - 5, y, scale);
    circle(x + scale + 5, y, scale);
  }
      
}
*/ 

//Key inputs for moving left and right
void keyPressed() {

  if (keyCode == 'D') {
    goingRight = true;
    PlayerX += 5;
  }
  if (keyCode == 'A') {
    goingLeft = true;
    PlayerX -= 5;
  }
}


void Loss(){
  fill(0, 0, 0);
  textAlign(CENTER);
  textSize(80);
  text("YOU LOSE!", width/2, height/2);
}

void drawEssence(float x, float y){
  fill(random(80, 255), random(80, 255), random(80, 255));
  stroke(random(80, 255), random(80, 255), random(80, 255));
  circle(x, y, 21);
}

void drawSimpleTree(float x, float y, float dia){
  fill(150, 75, 0);
  noStroke();
  circle(x, y, dia*.7);
  
  fill(0, 255/2, 0);
  circle(x, y - 30, dia);
  circle(x, y + 30, dia);
  circle(x + 17, y + 12, dia);
  circle(x + 17, y - 12, dia);
  circle(x - 17, y + 12, dia);
  circle(x - 17, y - 12, dia);
  
  fill(150, 75, 0);
  line(x, y, x, y - 30);
  line(x, y, x, y + 30);
  line(x, y, x + 17, y + 12);
  line(x, y, x + 17, y - 12);
  line(x, y, x - 17, y + 12);
  line(x, y, x - 17, y - 12);
  stroke(1);
  
}
