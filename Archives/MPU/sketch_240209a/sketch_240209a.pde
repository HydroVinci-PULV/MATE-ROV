import processing.serial.*;

  Serial myPort;        // The serial port
  int xPos = 1;         // horizontal position of the graph
  float inByte = 0;
  float[] dataPoints = new float[width]; // array to store previous data points



  void setup () {
    // set the window size:
    size(800, 300);

    // List all the available serial ports
    // if using Processing 2.1 or later, use Serial.printArray()
    println(Serial.list());

    // Open whatever port is the one you're using.
    myPort = new Serial(this, Serial.list()[2], 9600);

    // don't generate a serialEvent() unless you get a newline character:
    myPort.bufferUntil('\n');

    // set initial background:
    background(0);
  }
  
  
void draw() {
  // clear the previous line (optional for smoother animation)
  stroke(0);
  line(0, height/2, width, height/2);

  // draw the line with new incoming data
  stroke(127, 34, 255);
  // shift previous data points to the left
  for (int i = width - 1; i > 0; i--) {
    dataPoints[i] = dataPoints[i - 1];
  }
  // update the first data point with the new value
  dataPoints[0] = map(inByte, 0, 1023, 0, height);

  // draw the line connecting the data points
  for (int i = 1; i < width; i++) {
    line(i - 1, dataPoints[i - 1], i, dataPoints[i]);
  }

  // at the edge of the screen, reset data points and clear background
  if (xPos >= width) {
    xPos = 0;
    for (int i = 0; i < width; i++) {
      dataPoints[i] = 0;
    }
    background(0);
  } else {
    // increment the horizontal position:
    xPos++;
  }
}
  
  
  
  
  
/*
  void draw () {
    // draw the line:
    stroke(127, 34, 255);
    line(xPos, height, xPos, height - inByte);

    // at the edge of the screen, go back to the beginning:
    if (xPos >= width) {
      xPos = 0;
      background(0);
    } else {
      // increment the horizontal position:
      xPos++;
    }
  }
*/
  void serialEvent (Serial myPort) {
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');

    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // convert to an int and map to the screen height:
      inByte = float(inString);
      println(inByte);
      inByte = map(inByte, 0, 1023, 0, height);
    }
  }
