Brick[] bricks = new Brick[400];
Board[] boards = new Board[6];
int score = 0;
int boardScore = 0;

public void setup() {
  size(600,600);
  
  for (int i = 0; i < 400; i++) {
    bricks[i] = new Brick(600,600);
  }
  for (int i = 0; i < 6; i++) {
        boards[i] = new Board (600,600);
  }
}
public void draw() {
  background(220);


  for (Brick Brick : bricks) {
    if (!Brick.alive()) continue;

    Brick.BrickVsMouse();
    Brick.move();
    Brick.draw();
  }

  for (Board board : boards) {
    for (Brick b : bricks) {
      if (b.alive)
        board.attack(b);
    }

    board.collideWorldBounds(600,600);
    board.move();
    board.draw();
  }

  fill(0);
  text(score,10,10);
  text(boardScore,width/2,10);
}
