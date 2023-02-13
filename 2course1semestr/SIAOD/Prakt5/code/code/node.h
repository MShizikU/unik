#ifndef NODE_H
#define NODE_H

using namespace std;
#include <iostream>
#include <vector>
#include "edge.h"

class Node{
private:
	int iKey;
	vector<Node*>* vectAdjacentNodes;
	vector<Edge*>* vectAdjacentEdges;
public:
	Node(int iKey) {
		this->iKey = iKey;
		vectAdjacentEdges = new vector<Edge*>();
		vectAdjacentNodes = new vector<Node*>();
	}

	int getKey() {
		return iKey;
	}

	void addEdge(Node* tmp, int iWeight) {
		vectAdjacentNodes->push_back(tmp);
		vectAdjacentEdges->push_back(new Edge(iKey, tmp->getKey(), iWeight));
	}

	vector<Edge*>* getEdges() {
		return vectAdjacentEdges;
	}
};


#endif 