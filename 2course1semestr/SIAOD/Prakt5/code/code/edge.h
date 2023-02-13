#ifndef EDGE_H
#define EDGE_H

using namespace std;
#include <iostream>


class Edge{
private:
	int  iKeyFrom;
	int iKeyTo;
	int iWeight;
public:
	Edge(int nodeFrom, int nodeTo, int iWeight) {
		this->iKeyFrom = nodeFrom;
		this->iKeyTo = nodeTo;
		this->iWeight = iWeight;
	}

	int getWeight() {
		return iWeight;
	}

	int getNodeTo() {
		return iKeyTo;
	}

	int getNodeFrom() {
		return iKeyFrom;
	}
};


#endif