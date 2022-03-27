class Board{
  Tile[] tiles;
  int Xpos = 1;
  int Ypos = 1;
  int counter = 0;
  int check;
  int xp;
  int yp;
  int around;
  boolean dead = false;
  boolean win = false;
  int ucnm; //unchanged non mine
  
  int tilenum = 400; //number of ties total
  int tileacross = 20; //number of tiles across
  int nummines = 40; //number of mines
  
  void starting() {
    tiles = new Tile[tilenum];
    for (int i = 0; i < tiles.length; i++) {
      tiles[i] = new Tile();
    }
    int Xpos = 1;
    int Ypos = 1;
    for (int i = 0; i < tiles.length; i++){
      tiles[i].moving(Xpos, Ypos);
      Xpos = Xpos + 1;
      if (Xpos == (tileacross + 1)) {
        Ypos = Ypos + 1;
        Xpos = 1;
      }
    }
    
    while(counter < nummines){
      check = int(random(tilenum));
      if (tiles[check].checkmine() == false) {
        tiles[check].setmine();
        counter++;
      }
    }
  }
  
  void check() {
    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].check() == true) {
        if (tiles[i].checkmine() == true) {
          for (int j = 0; j < tiles.length; j++) {
            if (tiles[j].checkmine() == true) {
              tiles[j].changeimg(9);
            }
          }
          dead = true;
        }
        else {
          xp = tiles[i].xret();
          yp = tiles[i].yret();
          around = 0;
          if ((xp - 1) > 0 && (yp - 1) > 0) {
            if (tiles[(i-(tileacross + 1))].checkmine() == true){
              around++;
            }
          }
          if ((yp-1) > 0) {
            if (tiles[(i-tileacross)].checkmine() == true){
              around++;
            }
          }
          if ((xp + 1) < (tileacross+1) && (yp-1) > 0) {
            if (tiles[(i-(tileacross-1))].checkmine() == true){
              around++;
            }
          }
          if ((xp - 1) > 0) {
            if (tiles[(i-1)].checkmine() == true){
              around++;
            }
          }
          if ((xp + 1) < (tileacross+1)) {
            if (tiles[(i+1)].checkmine() == true){
              around++;
            }
          }
          if ((xp - 1) > 0 && (yp+1) < (tileacross+1)) {
            if (tiles[(i+(tileacross-1))].checkmine() == true){
              around++;
            }
          }
          if ((yp+1) < (tileacross+1)) {
            if (tiles[(i+tileacross)].checkmine() == true){
              around++;
            }
          }
          if ((xp + 1) < (tileacross+1) && (yp+1) < (tileacross+1)) {
            if (tiles[(i+(tileacross+1))].checkmine() == true){
              around++;
            }
          }
          tiles[i].changeimg(around);
        }
        ucnm = 0;
        for (int l = 0; l < tiles.length; l++) {
          if (tiles[l].checkmine() == false && tiles[l].checkchange() == false) {
            ucnm++;
          }
        }
        if (ucnm == 0) {
          win = true;
        }
      }
    }
  }
  
  boolean checkdead() {
    return dead;
  }
  boolean checkwin() {
    return win;
  }
  
  void notdead(){
    dead = false;
  }
  
  void flag(){
    for (int i = 0; i < tiles.length; i++) {
      tiles[i].flag();
    }
  }
  
  void show() {
    for (int i = 0; i < tiles.length; i++) {
      tiles[i].show();
    }
  }
}
