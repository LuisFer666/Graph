public class Grafica{
  private float x;
  private float y;
  private float widthField;
  private float heightField;
  // Colors
  private color bgColor;
  private color[] barsColors;
  private color barColor;
  private color barColorMouseOver;
  // Texts
  private color barsValueTooltipTextColor;
  private float barsValueTooltipTextSize;
  private float leftLabelsTextSize;
  // Labels
  private float leftLabelsWidth;
  private float bottomLabelsHeight;
  // Values
  private float[] values;
  private float maxValue;
  // Position Gaps
  private PVector leftLabelsStart;
  private PVector leftLabelsEnd;
  private PVector bottomLabelsStart;
  private float bottomLabelsWidth;
  private float graphFieldWidth;
  private float graphFieldHeight;
  private float barsWidth;
  private PVector[] barStartPositions;
  private float[] barHeights;
  private float topOffset;

  public Grafica(float x, float y, float widthField, float heightField){
    this.x = x;
    this.y = y;
    this.widthField = widthField;
    this.heightField = heightField;

    this.bgColor = color(200, 200, 200);
    this.barsValueTooltipTextColor = color(0);
    this.leftLabelsWidth = 50;
    this.bottomLabelsHeight = 50;
    this.values = new float[0];
    this.maxValue = 0;
    this.barStartPositions = new PVector[0];
    this.barHeights = new float[0];
    this.barsColors = new color[0];
    this.barColor = color(255,0,0);
    this.barColorMouseOver = color(255,100,100);
    this.barsValueTooltipTextSize = 12;
    this.leftLabelsTextSize = 12;
    this.topOffset = this.leftLabelsTextSize;

    setConstants();
  }

  private void setConstants()
  {
    this.leftLabelsStart = new PVector(this.x, this.y+this.topOffset);
    this.leftLabelsEnd = new PVector(this.x+this.leftLabelsWidth, this.y+this.heightField);
    this.bottomLabelsStart = new PVector(leftLabelsEnd.x, leftLabelsEnd.y-this.bottomLabelsHeight);
    this.bottomLabelsWidth = this.widthField-this.leftLabelsWidth;
    this.graphFieldWidth = this.bottomLabelsWidth;
    this.graphFieldHeight = this.heightField-this.topOffset-this.bottomLabelsHeight;
    this.barsWidth = this.graphFieldWidth/values.length;

    this.barStartPositions = new PVector[this.values.length];
    this.barHeights = new float[this.values.length];
    this.barsColors = new color[this.values.length];
    for(int i=0; i<this.values.length; i++)
    {
      this.barsColors[i] = this.barColor;
      this.barHeights[i] = this.values[i]*this.graphFieldHeight/this.maxValue;
      this.barStartPositions[i] = new PVector(this.leftLabelsEnd.x + (this.barsWidth*i), this.leftLabelsStart.y + this.graphFieldHeight - this.barHeights[i]);
    }
  }

  public void setValues(float[] values)
  {
    this.values = values;
    for(float a: values)
    {
      this.maxValue = (a > this.maxValue)? a: this.maxValue;
    }
    setConstants();
  }
  
  public void draw(){
    // Left labels
    fill(125,125,125);
    rect(this.leftLabelsStart.x, this.leftLabelsStart.y-this.topOffset, this.leftLabelsWidth, this.heightField+this.topOffset);
    fill(this.barsValueTooltipTextColor);
    textSize(this.leftLabelsTextSize);
    textAlign(RIGHT, CENTER);
    // Bottom labels
    fill(150,150,150);
    rect(this.bottomLabelsStart.x, this.bottomLabelsStart.y, this.bottomLabelsWidth, this.bottomLabelsHeight+topOffset);
    //Graph Field
    fill(bgColor);
    rect(this.leftLabelsEnd.x, this.y, this.graphFieldWidth, graphFieldHeight);
    // Background lines
    for(int i=0; i<11; i++)
    {
      float segmento = i*this.graphFieldHeight/10;
      String texto = String.format("%.2f", segmento*this.maxValue/this.graphFieldHeight);
      float altura = this.bottomLabelsStart.y - i*(this.graphFieldHeight/10);
      text(texto,this.leftLabelsEnd.x, altura);
      stroke(0);
      line(this.leftLabelsEnd.x, altura, this.leftLabelsEnd.x + this.graphFieldWidth, altura);
    }
    // Bars
    for(int i=0; i<this.values.length; i++)
    {
      fill(this.barsColors[i]);
      rect(this.barStartPositions[i].x, this.barStartPositions[i].y, this.barsWidth, this.barHeights[i]);
    }

    for(int i=0; i<this.values.length; i++)
    {
      this.barsColors[i] = this.barColor;
      if(mouseX >= this.barStartPositions[i].x && mouseX <= this.barStartPositions[i].x+this.barsWidth)
      {
        if(mouseY >= this.barStartPositions[i].y && mouseY <= this.bottomLabelsStart.y)
        {
          this.barsColors[i] = this.barColorMouseOver;
          fill(this.barsValueTooltipTextColor);
          textSize(this.barsValueTooltipTextSize);
          textAlign(LEFT);
          text("Value: "+this.values[i], mouseX, mouseY);
        }
      }
    }
  }

}
