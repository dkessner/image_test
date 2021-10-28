

PImage shark;


void setup() 
{
  size(400, 400);
  shark = loadImage("shark.png");
  shark.resize(width, height);
}


void draw() 
{
    image(shark, 0, 0);
}


void keyPressed()
{
    changeImage();
}


void changeImage()
{   
    int[][] pixelArray = getPixelArray(shark);

    int[][] newArray = filterRed(pixelArray);
    //int[][] newArray = filterGreen(pixelArray);

    setPixelArray(shark, newArray);
}


int[][] filterRed(int[][] pixelArray)
{
    int[][] newArray = new int[pixelArray[0].length][pixelArray.length];

    for (int i=0; i<pixelArray.length; i++)
    for (int j=0; j<pixelArray[i].length; j++)
    {
        newArray[i][j] = pixelArray[i][j] & 0xffff0000; // aarrggbb
    }

    return newArray;
}


int[][] filterGreen(int[][] pixelArray)
{
    int[][] newArray = new int[pixelArray[0].length][pixelArray.length];

    for (int i=0; i<pixelArray.length; i++)
    for (int j=0; j<pixelArray[i].length; j++)
    {
        newArray[i][j] = pixelArray[i][j] & 0xff00ff00; // aarrggbb
    }

    return newArray;
}


int[][] getPixelArray(PImage img)
{
    img.loadPixels();
    int[][] newArray = new int[img.width][img.height];
    
    if (img.width * img.height != img.pixels.length)
        println("[getPixelArray] Something's wrong!");

    for (int i=0; i<img.width; i++)
    for (int j=0; j<img.height; j++)
    {
        newArray[i][j] = img.pixels[i*img.width + j];
    }
    
    return newArray;
}


void setPixelArray(PImage img, int[][] newArray)
{
    img.loadPixels();

    if (newArray.length* newArray[0].length != img.pixels.length)
        println("[setPixelArray] Something's wrong!");

    for (int i=0; i<img.width; i++)
    for (int j=0; j<img.height; j++)
    {
        img.pixels[i*img.width + j] = newArray[i][j];
    }
         
    img.updatePixels();
}

