void setup()
{
    size(1280, 720);
    //fullScreen();
    //surface.setResizable(true);
    background(128, 192, 255);
}

poker game = new poker();

void draw()
{
  game.runGame();
}
