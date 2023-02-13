#ifndef COLOREDNODE_H
#define COLOREDNODE_H

using namespace std;
#include "node.h"

class ColoredNode : public Node {
public:
	int iColor;
	ColoredNode* parent;
	ColoredNode* left;
	ColoredNode* right;

	ColoredNode(long long int iKey, int iRowNumber, int iColor, ColoredNode* parent) : Node(iKey, iRowNumber) {
		this->iColor = iColor;
		this->parent = parent;
		if (iRowNumber != -1) {
			left = new ColoredNode(0, -1, 0, this);
			right = new ColoredNode(0, -1, 0, this);
		}
		else {
			left = nullptr;
			right = nullptr;
		}
	}

	void ValueSwap(ColoredNode* second) {
		this->iKey = second->iKey;
		this->iRowNumber = second->iRowNumber;
	}

	void deleteNode() {
		this->iRowNumber = -1;
		this->left = nullptr;
		this->right = nullptr;
		this->iColor = 0;
	}

	~ColoredNode() {
		delete left;
		left = nullptr;
		delete right;
		right = nullptr;
	}
};


#endif // !COLOREDNODE_H
