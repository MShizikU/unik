#pragma once
#ifndef NODE_H
#define NODE_h


class Node {
	public:
		long long int iKey;
		int iRowNumber;
		Node(long long int iKey, int iRowNumber) {
			this->iKey = iKey;
			this->iRowNumber = iRowNumber;
		}
};



#endif
