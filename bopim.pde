import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Player player;
ArrayList<Block> blocks;
float gravity = 0.5;
AudioPlayer[] sounds;
Minim minim;
int lastSound = 0;
int bx = -1;
int by = -1;

void settings() {
  size(1000, 800);
}
void setup() {
  player = new Player(width/2, height/2, "data/image/bopi.png");
  blocks = new ArrayList<Block>();
  blocks.add(new Block(300, 700, 500, 50));
  blocks.add(new Block(300, 300, 100, 300));
  minim = new Minim(this);
  sounds = new AudioPlayer[5];
  sounds[0] = minim.loadFile("sound/bup.mp3");
  sounds[1] = minim.loadFile("sound/scream1.mp3");
  sounds[2] = minim.loadFile("sound/scream2.mp3");
  sounds[3] = minim.loadFile("sound/scream3.mp3");
  sounds[4] = minim.loadFile("sound/scream4.mp3");
}
void draw() {
  background(0, 255, 255);
  player.render();
  for(int i = 0; i < blocks.size(); i++) {
    blocks.get(i).render();
  }
  if(bx != -1) {
    fill(0, 0, 0, 0);
    stroke(255, 0, 0);
    rect(bx, by, mouseX-bx, mouseY-by);
  }
}
void keyPressed() {
  if(key == ' ') {
    player.vel.y = -10;
    int test = floor(random(1,5));
    while(test == lastSound) test = floor(random(1,5));
    playSound(test);
    lastSound = test;
  }
  if(key == 'a') {
    player.vel.x = -5;
  }
  if(key == 'd') {
    player.vel.x = 5;
  }
}
void keyReleased() {
  if(key == 'a' || key == 'd') {
    player.vel.x = 0;
  }
}
void mousePressed() {
  if(bx == -1) {
    bx = mouseX;
    by = mouseY;
  } else {
    blocks.add(new Block(bx, by, mouseX-bx, mouseY-by));
    bx = -1;
    by = -1;
  }
}
void playSound(int index) {
  sounds[index].cue(0);
  sounds[index].play();
}
