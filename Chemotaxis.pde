Missile[] andy;
UFO raymond;

void setup() {     
  size(750, 750);
  andy = new Missile[10];

  for (int i = 0; i < andy.length; i++) {
    int red = (int)(Math.random() * 256);
    int green = (int)(Math.random() * 256);
    int blue = (int)(Math.random() * 256);
    
    andy[i] = new Missile();
    andy[i].red = red;
    andy[i].green = green;
    andy[i].blue = blue;
    
    raymond = new UFO();
  }
}   
void draw() {    
  background(0);
  
  for (int i = 0; i < andy.length; i++) {
    andy[i].blowUp();
    andy[i].show();
    andy[i].walk();
    
  }
  
  raymond.UFOShow();
}

class UFO {
  UFO(){
  }
  
  void UFOShow() {
    fill(170, 170, 170);
    ellipse(mouseX, mouseY, 50, 25);
    
    fill(#33B5DB);
    ellipse(mouseX, mouseY - 10, 25, 15);
  }
}

class Missile {     
  int myX, myY, red, green, blue;
  float myDirection;
  Missile() {
    myX = 375;
    myY = 750;
    myDirection = (float)(Math.random() * 6.28);
  }

  void walk() {

    if (mouseX > myX) {
      myX = myX + (int)(Math.random() * 5) -1; // [-1,3]
    } else {
      myX = myX + (int)(Math.random() * 5) - 3; // [-3,1]
    }

    if (mouseY > myY) {
      myY = myY + (int)(Math.random() * 5) - 1;
    } else {
      myY = myY + (int)(Math.random() * 5) - 3;
    }
    
    if(mouseX > myX && mouseY > myY){
      myDirection = (float)(2 * Math.PI / 3);
    } else if (mouseX > myX && mouseY < myY){
      myDirection = (float)(Math.PI / 3);
    } else if (mouseX < myX && mouseY > myY){
      myDirection = (float)(4 * Math.PI / 3);
    } else if (mouseX < myX && mouseY < myY){
      myDirection = (float)(5 * Math.PI / 3);
    } 
  }

  void show() {
    
    fill(red, green, blue);
    
    translate(myX, myY);
    rotate(myDirection);
    ellipse(0, 0, 10, 50);
    triangle(0, 40, -15, 50, 15, 50);
    rect(-5, 0, 10, 50);   
    rotate(-myDirection);
    translate(-myX, -myY);
  }
  
  void blowUp() {
    
    if(get(mouseX, mouseY) == color(0)){
      fill(0, 197, 255);
      text("WARNING: Ship locked. Evasive Maneuvers Reccommended.", 10, 20);
    }
    
    if(myX == mouseX && myY == mouseY){
      fill(0, 197, 255);
      ellipse(mouseX, mouseY, 55, 55);
      
      stroke(255);
      text("Warning: Low Shield Energy", 10, 40);
      text("Diverting Power From HUD to Shields", 10, 60);
      stroke(0);
    }
  }
}    
