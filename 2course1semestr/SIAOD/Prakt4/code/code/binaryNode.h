#pragma once

#ifndef BINARYNODE_H
#define BINARYNODE_H

#include "node.h"

class BinaryNode : public Node {
public:
	BinaryNode* left;
	BinaryNode* right;

	BinaryNode(long long int iKey, int iRowNumber) : Node(iKey, iRowNumber) {
		left = nullptr;
		right = nullptr;
	}

	void oneWaySwap(BinaryNode* second) {

		this->iKey = second->iKey;
		this->iRowNumber = second->iRowNumber;
		this->left = second->left;
		this->right = second->right;
	}

	void ValueSwap(BinaryNode* second){
		this->iKey = second->iKey;
		this->iRowNumber = second->iRowNumber;
	}

	void swap(BinaryNode* second) {
		long long int iKeySecond = second->iKey;
		int iRowNumber = second->iRowNumber;
		BinaryNode* leftSecond = second->left;
		BinaryNode* rightSecond = second->right;

		second->iKey = this->iKey;
		second->iRowNumber = this->iRowNumber;
		second->left = this->left;
		second->right = this->right;

		this->iKey = iKeySecond;
		this->iRowNumber = iKeySecond;
		this->left = leftSecond;
		this->right = rightSecond;
	}

	~BinaryNode() {
		delete left;
		left = nullptr;
		delete right;
		right = nullptr;
	}
};


#endif // !NODE_H

