Missile[] andy;   

void setup() {     
  size(750, 750);
  andy = new Missile[10];

  for (int i = 0; i < andy.length; i++) {
    andy[i] = new Missile();
  }
}   
void draw() {    
  background(0);

  //translate(mouseX / 2, mouseY / 2);

  for (int i = 0; i < andy.length; i++) {
    andy[i].show();
    andy[i].walk();
  }
}  

class Missile {     
  int myX, myY;
  double myDirection;
  Missile() {
    myX = 250;
    myY = 250;
    myDirection = Math.random() * 6.28;
  }

  void walk() {
    //float a = atan2(mouseY, mouseX);

    if (mouseX > myX) {
      myX = myX + (int)(Math.random() * 5) -1; // [1,4]
      //rotate(a / 500);
    } else {
      myX = myX + (int)(Math.random() * 5) - 3; // [-4,-1]
      //rotate(-a / 500);
    }

    if (mouseY > myY) {
      myY = myY + (int)(Math.random() * 5) - 1;
      //rotate(a / 500);
    } else {
      myY = myY + (int)(Math.random() * 5) - 3;
      //rotate(-a / 500);
    }
    
    if(mouseX > myX && mouseY > myY){
      myDirection = Math.PI / -3;
    } else if (mouseX > myX && mouseY < myY){
      myDirection = Math.PI / 3;
    } else if (mouseX < myX && mouseY > myY){
      myDirection = -2 * Math.PI / 3;
    } else if (mouseX < myX && mouseY < myY){
      myDirection = 2 * Math.PI / 3;
    }
  }

  void show() {
    translate(myX, myY);
    rotate((float)myDirection);
    ellipse(0, 0, 10, 50);
    triangle(0, 40, -15, 50, 15, 50);
    rect(-5, 0, 10, 50);
    rotate((float)-myDirection);
    translate(-myX, -myY);
  }
}    
