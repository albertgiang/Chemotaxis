Missile[] andy;   
 
void setup(){     
  size(750, 750);
  andy = new Missile[3];
  
  for(int i = 0; i < andy.length; i++){
    andy[i] = new Missile();
  }
}   
void draw(){    
 	background(0);
 
  for(int i = 0; i < andy.length; i++){
    andy[i].show();
    andy[i].walk();
  }
}  
 
class Missile{     
 	int myX, myY;
 
  Missile(){
    myX = 250;
    myY = 250;
  }
  
  void walk(){
    float a = atan2(mouseY, mouseX);
    
    if(mouseX > myX){
      myX = myX + (int)(Math.random() * 4) + 1; // [1,4]
      rotate(a / 32);
    } else {
      myX = myX + (int)(Math.random() * 4) - 4; // [-4,-1]
      rotate(-a / 32);
    }
    
    if(mouseY > myY){
      myY = myY + (int)(Math.random() * 4) + 1;
    } else {
      myY = myY + (int)(Math.random() * 4) - 4;
    }
    
  }
  
  void show(){
    
    ellipse(myX, myY, 10, 50);
    triangle(myX, myY + 40, myX - 15, myY + 50, myX + 15, myY + 50);
    rect(myX - 5, myY, 10, 50);
  }
}    
