#ifndef TREE_H
#define TREE_H

#include "node.h"
#include <string>

using namespace std;


class tree {
public:
	int count = 0;
	virtual void addNode(long long int iKey, int iRowValue) = 0;
	virtual void deleteNode(long long int iKey) = 0;
	virtual int findNode(long long int iKey) = 0;
	virtual void print() = 0;
};

#endif