#ifndef TREE_H
#define TREE_H

#include "Node.h"
#include "Frequencies.h"
#include <iostream>
#include <string> 
#include <vector>
#include <algorithm>
#include <map>
#include <Windows.h>

class EncodingTree {
private:
	string original;
	Node* root = nullptr;
	FrequencyTable frequencies; 
	map<char, string> encodingTable; 


	void buildTreeHuffman() {
		vector<Node*> nodes;
		int length = frequencies.getUniqueCharsString().length(); for (int i = 0; i < length; i++) {
			nodes.push_back(new Node(frequencies.getFreqByIndex(i))); 
		}


		while (nodes.size() > 1) {
			Node* left, * right;
			int index = getMinNodeIndex(nodes); 
			left = nodes.at(index); nodes.erase(nodes.begin() + index); index = getMinNodeIndex(nodes); right = nodes.at(index); nodes.erase(nodes.begin() + index);
			string concat = left->str + right->str;
			Node* parent = new Node(concat, left->frequency + right->frequency);
			
			parent->left = left; 
			parent->right = right;
			nodes.push_back(parent);

		}
		root = nodes.at(0);
	}

	int getMinNodeIndex(vector<Node*> v) {
		double minimum = DBL_MAX;
		int index = 0;
		for (int i = 0; i < v.size(); i++) {
			if (v.at(i)->frequency < minimum) {
				minimum = v.at(i)->frequency; index = i;
			}
		}
		return index;
	}
	

	double sumFrequencies(string& str) {
		double result = 0;
		for (int i = 0; i < str.length(); i++) {
			result += frequencies.getFrequency(str.at(i));
		}
		return result;
	}


	void printBranch(Node* node, int tabOffset) {
		if (!node) return;
		for (int i = 0; i < tabOffset; i++) {
			cout << '\t';
		}
		cout << node->str << '(' << node->frequency << ')'; if (node->str.length() == 1) {
			cout << " Simbol code: " << encodingTable[node->str.at(0)];
		}
		cout << endl;
		printBranch(node->left, tabOffset + 1); printBranch(node->right, tabOffset + 1);
	}

	
	void calculateFrequencies() {
		for (int i = 0; i < original.length(); i++) {
			if (frequencies.getFrequencyIndex(original.at(i)) == -1) { 
				frequencies.push(make_pair(original.at(i), 0));
			}
			frequencies.incrementRepeat(original.at(i)); 
		}
		frequencies.convertRepeatsToFrequency(original.length()); 
		frequencies.sortFrequencies(); 
	}

	void buildEncodingTable(Node* node, string code) {
		if (!node) return;
		if (node->str.length() == 1) {
			encodingTable.insert(make_pair(node->str.at(0), code));
			return;
		}
		buildEncodingTable(node->left, code + "0"); 
		buildEncodingTable(node->right, code + "1");
	}
	
	string encode() {
		string result = "";
		for (int i = 0; i < original.length(); i++) {
			result += encodingTable[original.at(i)];
		}
		return result;
	}

public:
	EncodingTree(string& original) {
		this->original = original; calculateFrequencies();
	}

	void printTree() {
		if (!root) return; printBranch(root, 0);
	}

	string encodeHuffman() {
		buildTreeHuffman(); buildEncodingTable(root, ""); return encode();
	}

	
	string decode(string encoded) {
		string decoded = "", currentPattern = ""; for (int i = 0; i < encoded.length(); i++) {
			currentPattern += encoded.at(i); 


				char decodedChar = decodeChar(currentPattern);

			if (decodedChar != '\0') {
					decoded += decodedChar; currentPattern = "";
			}
		}
		return decoded;
	}

	
	char decodeChar(string& encoded) {
		for (auto pair : encodingTable) {
			if (pair.second == encoded) {
				return pair.first;
			}
		}
		return '\0';
	}
};

#endif