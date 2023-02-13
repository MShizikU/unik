#include "binary_search_tree.h"
#include "red_black_tree.h"
#include "hash_table.h"
#include "tree.h"
#include "fileController.h"
#include <iostream>
#include <ctime>

using namespace std;

int main() {

	tree* tre = new RedBlackTree();
	
	fileController* control = new fileController(tre);

	control->execute();
	
}


