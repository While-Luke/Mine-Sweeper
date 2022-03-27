Board board;
boolean dead = false;
boolean win = false;

void setup(){
  board = new Board();
  frameRate(60);
  fullScreen();
  board.starting();
}

void draw(){
  background(100);
  board.show();
  if (win == false) {
    win = board.checkwin();
  }
  else {
    textSize(50);
    fill(0, 255, 0);
    text("You Win!", 800, height/2);
    text("Press R to restart", 800, height/2 + 100);
  }
  if (dead == false) {
    dead = board.checkdead();
  }
  else {
    textSize(50);
    fill(255, 0, 0);
    text("You Died!", 800, height/2);
    text("Press R to restart", 800, height/2 + 100);
  }
}

void mousePressed() {
  if (dead == false && win == false){
    if (mouseButton == LEFT){
      board.check();
    }
    if (mouseButton == RIGHT){
      board.flag();
    }
  }
}

void mouseDragged(){
  if (dead == false && win == false){
    if (mouseButton == LEFT){
      board.check();
    }
    if (mouseButton == RIGHT){
      board.flag();
    }
  }
}

void keyPressed() {
  if (key == 'r'){
    board = new Board();
    board.starting();
    dead = false;
    win = false;
    board.notdead();
  }
}
