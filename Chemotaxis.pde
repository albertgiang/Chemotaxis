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
  double myDirection;
  Missile() {
    myX = 375;
    myY = 750;
    myDirection = Math.random() * 6.28;
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
      myDirection = 2 * Math.PI / 3;
    } else if (mouseX > myX && mouseY < myY){
      myDirection = Math.PI / 3;
    } else if (mouseX < myX && mouseY > myY){
      myDirection = 4 * Math.PI / 3;
    } else if (mouseX < myX && mouseY < myY){
      myDirection = 5 * Math.PI / 3;
    } 
  }

  void show() {
    
    fill(red, green, blue);
    
    translate(myX, myY);
    rotate((float)myDirection);
    ellipse(0, 0, 10, 50);
    triangle(0, 40, -15, 50, 15, 50);
    rect(-5, 0, 10, 50);   
    rotate((float)-myDirection);
    translate(-myX, -myY);
  }
  
  void blowUp() {
    if(myX == mouseX && myY == mouseY){
      fill(#00C5FF);
      ellipse(mouseX, mouseY, 55, 55);
      
      stroke(255);
      text("Warning: Shields Damaged", 100, 100);
      stroke(0);
    }
  }
}    
