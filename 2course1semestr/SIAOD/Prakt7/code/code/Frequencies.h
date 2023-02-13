#ifndef FREQUENCIES_H
#define FREQUENCIES_H

#include "Node.h"
#include <iostream>
#include <string> 
#include <vector>
#include <algorithm>
#include <map>
#include <Windows.h>

struct FrequencyTable {
	vector<pair<char, double>> frequencies;


	double getFrequency(char c) {
		int index = getFrequencyIndex(c);
		return (index == -1) ? NULL : frequencies.at(index).second;
	}

	int getFrequencyIndex(char c) {
		for (int i = 0; i < frequencies.size(); i++) {
			if (frequencies.at(i).first == c) {
				return i;
			}
		}
		return -1;
	}

	void push(pair<char, double> pair) {
		frequencies.push_back(pair);
	}

	void incrementRepeat(char c) {
		int index = getFrequencyIndex(c); frequencies.at(index).second++;
	}

	void convertRepeatsToFrequency(int length) {
		for (int i = 0; i < frequencies.size(); i++) {
			frequencies.at(i).second /= length;
		}
	}

	void sortFrequencies() {
		sort(frequencies.begin(), frequencies.end(), [=](std::pair<char, double>& a, std::pair<char, double>& b)
			{
				return a.second > b.second;
			}
		);
	}

	string getUniqueCharsString() {
		string result = "";
		for (auto const& pair : frequencies) {
			result += pair.first;
		}
		return result;
	}

	int length() {
		return frequencies.size();
	}

	pair<char, double> getFreqByIndex(int index) {
		return frequencies.at(index);
	}
};

#endif 

