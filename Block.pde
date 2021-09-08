class Block {
  int x;
  int y;
  int xSize;
  int ySize;
  
  Block(int x, int y, int xSize, int ySize) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  void render() {
    stroke(0);
    fill(200, 0, 200);
    rect(x, y, xSize, ySize);
  }
}
