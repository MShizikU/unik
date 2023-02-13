#include "functions.h"
#include "note.h"
#include <iostream>

using namespace std;

void main() {
	transportFromTextToBinary("input.txt", "output.dat");
	transportFromBinaryToText("output.dat", "input.txt");
	printAllLinesFromBinary("output.dat");
	cout << endl;
	getNotionFromPosition(3, "output.dat");
	cout << endl;
	//getCalendarDay("INBO-04-22", "input.txt", "output.dat");
	cout << endl;
	//changeCalendar("input.txt", "input.txt");
	deleteCalendarNotion(3, "output.dat");
	transportFromBinaryToText("output.dat", "input.txt");
}