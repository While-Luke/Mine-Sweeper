class Tile{
  PVector pos = new PVector(0,0);
  int x;
  int y;
  int col = 50;
  boolean mine = false;
  PImage img = loadImage("untouched.png");
  boolean changed = false;
  boolean flag = false;
  
  void moving(int moveX, int moveY){
    PVector move = new PVector(moveX, moveY);
    pos.add(move);
    x = int(pos.x) * 20;
    y = int(pos.y) * 20;
  }
  
  boolean checkmine(){
    return mine;
  }
  
  void setmine() {
    mine = true;
  }
  
  boolean check() {
    if (mouseX > x && mouseY > y && mouseX < x + 20 && mouseY < y + 20){
       return true;
    }
    else {
      return false; 
    }
  }
  
  int xret() {
    return int(pos.x);
  }
  int yret() {
    return int(pos.y);
  }
  
  void changeimg(int chg) {
    if (chg == 0){
      img = loadImage("empty.png");
    }
    if (chg == 1){
      img = loadImage("1.png");
    }
    if (chg == 2){
      img = loadImage("2.png");
    }
    if (chg == 3){
      img = loadImage("3.png");
    }
    if (chg == 4){
      img = loadImage("4.png");
    }
    if (chg == 5){
      img = loadImage("5.png");
    }
    if (chg == 6){
      img = loadImage("6.png");
    }
    if (chg == 7){
      img = loadImage("7.png");
    }
    if (chg == 8){
      img = loadImage("8.png");
    }
    if (chg == 9){
      img = loadImage("mine.png");
    }
    changed = true;
    flag = false;
  }
  
  boolean checkchange() {
   return changed; 
  }
  
  void flag() {
    if (mouseX > x && mouseY > y && mouseX < x + 20 && mouseY < y + 20){
      if (flag == false){
        img = loadImage("flag.png");
        flag = true;
      }
      else {
        img = loadImage("untouched.png");
        flag = false;
      }
    }
  }
  
  void show(){
    fill(col); 
    image(img, x, y);
  }
}
