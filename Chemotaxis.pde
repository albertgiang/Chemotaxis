Missile[] andy;   
 
void setup(){     
  size(500, 500);
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
    myX = myX + (int)(Math.random() * 3) - 1;
    myY = myY + (int)(Math.random() * 3) - 1;
  }
  
  void show(){
    ellipse(myX, myY, 10, 50);
    //triangle(myX, myY,);
    rect(myX - 5, myY, 10, 50);
  }
}    
