#include "myLib.h"

// Prototypes
void initialize();
void update();
void draw();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Variables
unsigned short bgColor;

// Green Rectangle Variables
int gRow;
int gCol;
int gOldRow;
int gOldCol;
int gRDel;
int gCDel;
int gHeight;
int gWidth;

// Blue Rectangle Variables
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

		// TODO #3.6: Update the button variables each frame
		oldButtons = buttons;
		buttons = BUTTONS;


		update();
		waitForVBlank();
		draw();
	}
}

// Sets up the display and the game objects
void initialize() {

	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// TODO #3.3: Intialize your button variables

	oldButtons = 0;
	//or would it be oldButtons = 0; here??
	buttons = BUTTONS;



	// Initialize background
	// UNCOMMENT #2
	 bgColor = CYAN;
	 fillScreen(bgColor);

	// Initialize green rectangle
	gRow = 20;
	gCol = 20;
	gOldRow = gRow;
	gOldCol = gCol;
	gRDel = 1;
	gCDel = 1;
	gHeight = 19;
	gWidth = 15;

	// Initialize blue rectangle
	bRow = 120;
	bCol = 120;
	bOldRow = bRow;
	bOldCol = bCol;
	bRDel = 1;
	bCDel = 1;
	bHeight = 17;
	bWidth = 10;
}

// Performs all of the game's calculations
void update() {

	// Change the background color if Start is pressed
	// UNCOMMENT #3
	if (BUTTON_PRESSED(BUTTON_START)) {
		if (bgColor == CYAN)
			bgColor = YELLOW;
		else
			bgColor = CYAN;
		fillScreen(bgColor);
	}

	// Move the blue rectangle with the buttons
	// TODO #4: Make the blue rectangle move with the arrow keys

//update
	bOldCol = bCol;
	bOldRow = bRow;
//increases column
	if(BUTTON_HELD(BUTTON_RIGHT)) {
		//check to make sure it doesn't go off screen
		if ((bCol + bWidth) > SCREENWIDTH) {
			//nothing?

		} else {
			bCol++;
		}
	}
	//decrease column
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if (bCol == 0) {
			//nothing
		} else {
			bCol--;
		}
	}
	if(BUTTON_HELD(BUTTON_UP)) {
		if (bRow == 0) {
			//nothing
		} else {
			bRow--;
		}
	}
	if(BUTTON_HELD(BUTTON_DOWN)) {
		if ((bRow + bHeight) == SCREENHEIGHT) {
			//nothing
		} else {
			bRow++;
		}
	}


	// Bounce green rectangle off the walls
	if (gRow <= 0 || gRow + gHeight - 1 >= SCREENHEIGHT - 1)
		gRDel *= -1;
	if (gCol <= 0 || gCol + gWidth - 1 >= SCREENWIDTH - 1)
		gCDel *= -1;

	// Bounce green rectangle off the blue rectangle
	// TODO #5.5: Make the green rectangle reverse direction when it hits the blue one

	if (collision(bRow, bCol, bHeight, bWidth, gRow, gCol, gHeight, gWidth) == 1) {

			gRDel *= -1;
			gCDel *= -1;

	}

	// Update green rectangle's position
	gRow += gRDel;
	gCol += gCDel;
}

// Performs all of the writing to the screen
void draw() {

	// UNCOMMENT #1
	// // Erase the previous locations
	drawRect(gOldRow, gOldCol, gHeight, gWidth, bgColor);
	drawRect(bOldRow, bOldCol, bHeight, bWidth, bgColor);

	// // Draw the new locations
	drawRect(gRow, gCol, gHeight, gWidth, GREEN);
	drawRect(bRow, bCol, bHeight, bWidth, BLUE);

	// Update old variables
	gOldRow = gRow;
	gOldCol = gCol;
	bOldRow = bRow;
	bOldCol = bCol;
}