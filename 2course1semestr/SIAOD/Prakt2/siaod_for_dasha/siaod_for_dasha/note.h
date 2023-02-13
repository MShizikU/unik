#pragma once
#ifndef NOTE_H
#define NOTE_H

#include <iostream>
#include <string>

using namespace std;


struct structGroupNotion{

	string stGroupNumber = "";
	string stDisciplineName = "";
	string stLessonType = "";
	string stCabinetNumber = "";
	int iLessonNumber = 0;
	int iWeekNumber = 0;
	int iDayNumber = -1;

	void print() {
		cout << stGroupNumber << " " << stDisciplineName << " " << iLessonNumber << " " << iWeekNumber << " " << iDayNumber << " " << stLessonType << " " << stCabinetNumber << endl;
	}

	string to_String() {
		string tmp = "";
		tmp += stGroupNumber;
		tmp += " ";
		tmp += stDisciplineName;
		tmp += " ";
		tmp += to_string(iLessonNumber);
		tmp += " ";
		tmp += to_string(iWeekNumber);
		tmp += " ";
		tmp += to_string(iDayNumber);
		tmp += " ";
		tmp += stLessonType;
		tmp += " ";
		tmp += stCabinetNumber;
		return tmp;

	}
	
};


#endif