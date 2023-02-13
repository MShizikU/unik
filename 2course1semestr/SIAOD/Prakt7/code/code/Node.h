#ifndef NODE_H
#define NODE_H


#include <iostream>
#include <string> 

using namespace std;

struct Node {
	string str;
	double frequency;
	Node* left = nullptr, * right = nullptr;

	Node(pair<char, double> pair) {
		string str(1, pair.first); this->str = str;
		this->frequency = pair.second;
	}

	Node(string& str, double frequency) {
		this->str = str;
		this->frequency = frequency;
	}
};

#endif