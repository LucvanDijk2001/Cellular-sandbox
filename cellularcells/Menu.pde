class Menu
{
  int w = width-height - 5;
  int h = height - 5;
  int x = height;
  int y = 0;

  int hue = 0;

  boolean keyDown = false;

  Button[] buttons = new Button[General.ElementCount];
  int buttonWidth = 105;
  int buttonHeight = 40;
  int buttonRowCount = 3;
  int buttonPanning = 20;
  
  int buttonMenuPanning = 20;
  
  int sliderPanning = 20;
  int sliderHeightOffset = 50;
  Slider brushSlider = new Slider(x + sliderPanning,y+h/2,1,20,200,0);
  Slider speedSlider = new Slider(x + sliderPanning,y+h/2 + sliderHeightOffset,0,5,200,0.2);

  Menu()
  {
    for (int i = 0; i < General.ElementCount; i++)
    {
      int tracker = i;
      int yp = 0;
      while(tracker > buttonRowCount-1)
      {
         tracker -= buttonRowCount; 
         yp++;
      }
      int bx = (x+buttonMenuPanning) + i*buttonWidth + i*buttonPanning - yp*buttonWidth*buttonRowCount;
      if(yp > 0){bx -= buttonRowCount*buttonPanning*yp;}
      int by = (y+buttonMenuPanning) + yp * buttonHeight + yp*buttonPanning;
      
      buttons[i] = new Button(bx,by,buttonWidth,buttonHeight,i);
    }
  }

  void Update()
  {
    hue++;
    if (hue >= 255)
    {
      hue -= 255;
    }
  }

  void show()
  {
    colorMode(HSB);
    fill(50);
    strokeWeight(5);
    stroke(hue, 255, 255);

    rect(x+2, y+2, w, h);
    
    for(int i = 0; i < buttons.length; i++)
    {
     buttons[i].CheckPressed();
     buttons[i].show();
    }
    
    brushSlider.Update();
    speedSlider.Update();
    brushSlider.show();
    speedSlider.show();
    grid.brushSize = brushSlider.getVal();
    grid.iterationSpeed = speedSlider.getVal();
    
    textAlign(LEFT,CENTER);
    text("Brush size: " + grid.brushSize,brushSlider.x,brushSlider.y-15);
    text("Game speed: " + grid.iterationSpeed,speedSlider.x,speedSlider.y-15);
  }
}
