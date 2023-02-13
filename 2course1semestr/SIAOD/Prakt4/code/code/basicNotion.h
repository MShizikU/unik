#ifndef  BASICNOTION_H

#define BASICNOTION_H

using namespace std;

#include <string>;

struct notion {
	string FIO;
	double GPA;
	bool excluded;

	notion(string FIO, double GPA, bool excluded) {
		this->FIO = FIO;
		this->GPA = GPA;
		this->excluded = excluded;
	}
};


#endif // ! BASICNOTION_H
