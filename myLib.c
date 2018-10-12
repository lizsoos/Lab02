#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {

    // TODO #1: Implement this function
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(row + i, col + j, color);
        }
    }
}

void fillScreen(unsigned short color) {

    // TODO #2: Implement this function
    // Note: You may only use a single loop
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    // TODO #5.0: Implement this function


    //bottom of rect = row + height - 1

    //top of rect = 0th row

    //leftside of rectangle = 0th column

    //rightside = column + width-1


    if (((widthA + colA - 1) >= colB)
        && (colA <= (colB + widthB - 1))
        && (rowA <= (rowB + heightB - 1))
        && ((rowA + heightA - 1) >= rowB)) {
        return 1;
    }

}