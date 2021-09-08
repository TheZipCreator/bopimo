class Player {
  PVector pos;
  PVector vel;
  PVector size;
  PImage image;
  boolean collideY;
  
  Player(float x, float y, String img) {
    this.image = loadImage(img);
    pos = new PVector(x, y);
    size = new PVector(image.width, image.height);
    vel = new PVector(0, 0);
    collideY = false;
  }
  void render() {
    image(image, pos.x, pos.y);
    vel.y += gravity;
    PVector newPos = new PVector(pos.x+vel.x, pos.y+vel.y);
    boolean moveX = true;
    boolean moveY = true;
    for(int i = 0; i < blocks.size(); i++) {
      Block block = blocks.get(i);
      if(newPos.x < block.x+block.xSize && newPos.x > block.x && pos.y > block.y && pos.y < block.y+block.ySize) moveX = false;
      if(newPos.y < block.y+block.ySize && newPos.y > block.y && pos.x > block.x && pos.x < block.x+block.xSize) moveY = false;
      if(newPos.x+size.x < block.x+block.xSize && newPos.x+size.x > block.x && pos.y+size.y > block.y && pos.y+size.y < block.y+block.ySize) moveX = false;
      if(newPos.y+size.y < block.y+block.ySize && newPos.y+size.y > block.y && pos.x+size.x > block.x && pos.x+size.x < block.x+block.xSize) moveY = false;
    }
    if(moveX) {
      pos.x = newPos.x;
    } else {
      vel.x = 0;
      playSound(0);
    }
    if(moveY) {
      pos.y = newPos.y;
      collideY = false;
    } else {
      vel.y = 0;
      if(!collideY) {
        playSound(0);
        collideY = true;
      }
    }
  }
}
