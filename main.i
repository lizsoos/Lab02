# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 65 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 79 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2


void initialize();
void update();
void draw();


unsigned short buttons;
unsigned short oldButtons;


unsigned short bgColor;


int gRow;
int gCol;
int gOldRow;
int gOldCol;
int gRDel;
int gCDel;
int gHeight;
int gWidth;


int bRow;
int bCol;
int bOldRow;
int bOldCol;
int bRDel;
int bCDel;
int bHeight;
int bWidth;

int main() {

 initialize();

 while(1) {


  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);


  update();
  waitForVBlank();
  draw();
 }
}


void initialize() {

 (*(unsigned short *)0x4000000) = 3 | (1<<10);



 oldButtons = 0;

 buttons = (*(volatile unsigned short *)0x04000130);





  bgColor = ((0) | (31)<<5 | (31)<<10);
  fillScreen(bgColor);


 gRow = 20;
 gCol = 20;
 gOldRow = gRow;
 gOldCol = gCol;
 gRDel = 1;
 gCDel = 1;
 gHeight = 19;
 gWidth = 15;


 bRow = 120;
 bCol = 120;
 bOldRow = bRow;
 bOldCol = bCol;
 bRDel = 1;
 bCDel = 1;
 bHeight = 17;
 bWidth = 10;
}


void update() {



 if ((!(~(oldButtons)&((1<<3))) && (~(buttons) & ((1<<3))))) {
  if (bgColor == ((0) | (31)<<5 | (31)<<10))
   bgColor = ((31) | (31)<<5 | (0)<<10);
  else
   bgColor = ((0) | (31)<<5 | (31)<<10);
  fillScreen(bgColor);
 }





 bOldCol = bCol;
 bOldRow = bRow;

 if((~((*(volatile unsigned short *)0x04000130)) & (1<<4))) {

  if ((bCol + bWidth) > 240) {


  } else {
   bCol++;
  }
 }

 if((~((*(volatile unsigned short *)0x04000130)) & (1<<5))) {
  if (bCol == 0) {

  } else {
   bCol--;
  }
 }
 if((~((*(volatile unsigned short *)0x04000130)) & (1<<6))) {
  if (bRow == 0) {

  } else {
   bRow--;
  }
 }
 if((~((*(volatile unsigned short *)0x04000130)) & (1<<7))) {
  if ((bRow + bHeight) == 160) {

  } else {
   bRow++;
  }
 }



 if (gRow <= 0 || gRow + gHeight - 1 >= 160 - 1)
  gRDel *= -1;
 if (gCol <= 0 || gCol + gWidth - 1 >= 240 - 1)
  gCDel *= -1;




 if (collision(bRow, bCol, bHeight, bWidth, gRow, gCol, gHeight, gWidth) == 1) {

   gRDel *= -1;
   gCDel *= -1;

 }


 gRow += gRDel;
 gCol += gCDel;
}


void draw() {



 drawRect(gOldRow, gOldCol, gHeight, gWidth, bgColor);
 drawRect(bOldRow, bOldCol, bHeight, bWidth, bgColor);


 drawRect(gRow, gCol, gHeight, gWidth, ((0) | (31)<<5 | (0)<<10));
 drawRect(bRow, bCol, bHeight, bWidth, ((0) | (0)<<5 | (31)<<10));


 gOldRow = gRow;
 gOldCol = gCol;
 bOldRow = bRow;
 bOldCol = bCol;
}
