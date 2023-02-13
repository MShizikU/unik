#include <iostream>
#include <string> 
#include <vector>
#include <algorithm>
#include <map>
#include <Windows.h>
#include <fstream>

#include "Tree.h"

using namespace std;






int main() {
	
	ifstream file("some.txt");
	string input = "";
	getline(file, input);
	EncodingTree tree(input);

	string encoded = tree.encodeHuffman();

	file.close();

	ofstream file2("some.txt");
	file2 << encoded;

	file2.close();

	cout << "Encoded string : " << encoded << endl;
}