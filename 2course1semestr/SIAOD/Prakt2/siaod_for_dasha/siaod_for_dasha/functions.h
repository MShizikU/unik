#ifndef FUNCTIONS_H
#define FUNCTIONS_H
#include <iostream>
#include <fstream>
#include <vector>
#include "note.h"

using namespace std;

bool transportFromTextToBinary(string stInputPath, string stOutputPath) {
	ifstream input(stInputPath, ios::in );

	if (input.is_open() && input.good()) {
		ofstream output(stOutputPath, ios::binary | ios::out );
		if (output.is_open() && output.good()) {
			while (!input.eof()) {

				string stGroupNumber = "";
				string stDisciplineName = "";
				string stLessonType = "";
				string stCabinetNumber = "";
				int iLessonNumber = 0;
				int iWeekNumber = 0;
				int iDayNumber = -1;

				input >> stGroupNumber >> stDisciplineName >> iLessonNumber  >> iWeekNumber >> iDayNumber >> stLessonType >> stCabinetNumber;
				structGroupNotion tmp = { stGroupNumber, stDisciplineName, stLessonType, stCabinetNumber, iLessonNumber, iWeekNumber, iDayNumber };
				output.write((char*)&tmp, sizeof(structGroupNotion));
			}
			output.close();
			input.close();
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
}

bool transportFromBinaryToText(string stInputPath, string stOutputPath) {
	ifstream input(stInputPath, ios::in);

	if (input.is_open() && input.good()) {
		ofstream output(stOutputPath, ios::out );
		if (output.is_open() && output.good()) {
			while (!input.eof()) {
				structGroupNotion* tmp = new structGroupNotion();
				input.read((char*)&(*tmp), sizeof(structGroupNotion));
				if(tmp->iDayNumber != -1) output << tmp->to_String();
				if (!input.eof() && tmp->iDayNumber != -1) output << endl;
			}
			output.close();
			input.close();
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
}

bool printAllLinesFromBinary(string stInputPath) {
	ifstream input(stInputPath, ios::in | ios::binary);
	if (input.is_open() && input.good()) {
		while (!input.eof()) {
			structGroupNotion* tmp = new structGroupNotion();
			input.read((char*)&(*tmp), sizeof(structGroupNotion));
			if(tmp->iDayNumber != -1) tmp->print();
		}
	}
	else {
		return false;
	}
	input.close();
}

void getNotionFromPosition(int iPosition, string stFilePath) {
	ifstream input(stFilePath, ios::in | ios::binary);
	input.seekg(iPosition * sizeof(structGroupNotion), ios::beg);
	structGroupNotion* tmp = new structGroupNotion();
	input.read((char*)&(*tmp), sizeof(structGroupNotion));
	tmp->print();
	input.close();
}



bool getCalendarDay(string stGroupNumberUser, string stInputPath, string stOutputPath) {
	vector<structGroupNotion>* calendar = new vector<structGroupNotion>();
	ifstream input(stInputPath, ios::in);


	if (input.is_open() && input.good()) {
		ofstream output(stOutputPath, ios::out | ios::binary);
		if (output.is_open() && output.good()) {
			while (!input.eof()) {

				string stGroupNumber = "";
				string stDisciplineName = "";
				string stLessonType = "";
				string stCabinetNumber = "";
				int iLessonNumber = 0;
				int iWeekNumber = 0;
				int iDayNumber = 0;
				input >> stGroupNumber >> stDisciplineName >> iLessonNumber >> iWeekNumber >> iDayNumber >> stLessonType >> stCabinetNumber;
				structGroupNotion tmp = { stGroupNumber, stDisciplineName, stLessonType, stCabinetNumber, iLessonNumber, iWeekNumber, iDayNumber };
				if (tmp.iDayNumber != -1 && tmp.stGroupNumber == stGroupNumberUser) calendar->push_back(tmp);

			}
			input.close();
			int max = 0;
			for (int i = 0; i < calendar->size(); i++) {
				if (calendar->at(i).iLessonNumber > max) max = calendar->at(i).iLessonNumber;
			}
			for (int i = 1; i <= max; i++) {
				for (int j = 0; j < calendar->size(); j++) {
					if (calendar->at(j).iLessonNumber == i) {
						output.write((char*)&calendar->at(j), sizeof(structGroupNotion));
						calendar->at(j).print();
					}
				}
			}
			output.close();
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
}

bool deleteCalendarNotion(int iPosition, string stFilePath) { //Функция которая удаляет посредством перезаписи, но при этом оставляет последнюю строку (?)
	ifstream input(stFilePath, ios::in | ios::binary);
	if (!input.is_open() && !input.good()) return false;
	input.seekg((-1) * sizeof(structGroupNotion), ios::end);
	structGroupNotion* lastNotion = new structGroupNotion();
	input.read((char*)&(*lastNotion), sizeof(structGroupNotion));
	input.close();
	ofstream output(stFilePath, ios::out | ios::binary | ios::in);
	if (!output.is_open() && !output.good()) return false;
	output.seekp(iPosition * sizeof(structGroupNotion), ios::beg);
	output.write((char*)&(*lastNotion), sizeof(structGroupNotion));
	output.close();
	return true;
}


bool deleteCalendarNotionRewriting(int iPosition, string stFilePath) { //Функция которая удаляет посредством полной перезаписи всего файла (?)
	vector<structGroupNotion*>* calendar = new vector<structGroupNotion*>();
	ifstream input(stFilePath, ios::in | ios::binary);
	structGroupNotion* lastNotion = new structGroupNotion();
	if (!input.is_open() && !input.good()) return false;
	while (!input.eof()) {
		structGroupNotion* tmp = new structGroupNotion();
		input.read((char*)&(*tmp), sizeof(structGroupNotion));
		if (tmp->iDayNumber != -1) calendar->push_back(tmp);
	}
	lastNotion = calendar->back();
	input.close();
	ofstream output(stFilePath, ios::out | ios::binary);
	if (!output.is_open() && !output.good()) return false;
	for (int i = 0; i < calendar->size(); i++) {
		if(i!= iPosition and i != calendar->size()-1) output.write((char*)&(*calendar->at(i)), sizeof(structGroupNotion));
		else if(i == iPosition) {
			output.write((char*)&(*lastNotion), sizeof(structGroupNotion));
		}
	}
	output.close();
	return true;
}

void reWrite(vector<structGroupNotion>& calendar) {
	bool checker = false;
	for (int i = 0; i < calendar.size(); i++) {
		for (int j = 0; j < calendar.size(); j++) {
			if (j == i) continue;
			if (calendar.at(i).iLessonNumber == calendar.at(j).iLessonNumber && calendar.at(i).stCabinetNumber == calendar.at(j).stCabinetNumber) {
				cout << "Enter new cabinet number for: ";
				calendar.at(i).print();
				cin >> calendar.at(i).stCabinetNumber;
				checker = true;
			}
		}
	}
	if (checker) reWrite(calendar);
}

bool changeCalendar(string stInputPath, string stOutputPath) {
	vector<structGroupNotion>* calendar = new vector<structGroupNotion>();
	ifstream input(stInputPath, ios::in);

	

	if (input.is_open() && input.good()) {

		while (!input.eof()) {
			string stGroupNumber = "";
			string stDisciplineName = "";
			string stLessonType = "";
			string stCabinetNumber = "";
			int iLessonNumber = 0;
			int iWeekNumber = 0;
			int iDayNumber = -1;
			input >> stGroupNumber >> stDisciplineName >> iLessonNumber >> iWeekNumber >> iDayNumber >> stLessonType >> stCabinetNumber;
			structGroupNotion tmp = { stGroupNumber, stDisciplineName, stLessonType, stCabinetNumber, iLessonNumber, iWeekNumber, iDayNumber };
			if (tmp.iDayNumber != -1) calendar->push_back(tmp);
		}
		input.close();
		reWrite(*calendar);
		ofstream output(stOutputPath, ios::out | ios::binary);
		if (output.is_open() && output.good()) {
			for (int i = 0; i < calendar->size(); i++) {
				
				output << calendar->at(i).to_String();
				if (i != calendar->size() - 1) output << endl;
				calendar->at(i).print();
			}
			output.close();
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
}





#endif
