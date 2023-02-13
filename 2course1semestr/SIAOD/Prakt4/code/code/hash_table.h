#pragma once
#ifndef HASH_TABLE_H
#define HASH_TABLE_H

#include <iostream>
#include <fstream>
#include <list>
#include <vector>
#include "tree.h"
#include "node.h"
#include "basicNotion.h"

using namespace std;



class hash_table : public tree{

private:

	long long int current_size = 0;
	long long int real_size = 8;
	int number_of_line = 0;
	vector<list<Node>> table;


	long long int hash_func(long long int iKey) {
		return iKey % real_size;
	}

public:

	

	hash_table()
	{
		real_size = 8;

		table.resize(real_size);
	}



	virtual void addNode(long long int iKey, int iRowNumber)
	{
		long long int hash = this->hash_func(iKey);


		for (auto iter = table[hash].begin(); iter != table[hash].end(); iter++) {
			if (iter->iKey == iKey) {
				return;
			}
		}
		Node* tmp = new Node(iKey, iRowNumber);
		this->table[hash].push_front(*tmp);
		current_size++;

		if (float(current_size) / float(real_size) >= 0.75) resize();
	}

	virtual int findNode(long long int iKey)
	{
		int n = hash_func(iKey);
		for (auto i = table[n].begin(); i != table[n].end(); i++)
		{
			count++;
			if (i->iKey == iKey) return i->iRowNumber;
			
		}
		return -1;
	}


	virtual void deleteNode(long long int iKey)
	{
		int n = hash_func(iKey);

		for (auto i = table[n].begin(); i != table[n].end(); i++)
		{
			if (i->iKey == iKey)
			{
				table[n].erase(i);

				return;
			}
		}

	}

	virtual void print()
	{
		bool is_empty = true;

		for (int i = 0; i < real_size; i++)
		{
			if (table[i].empty()) continue;

			is_empty = false;

			for (auto iter = table[i].begin(); iter != table[i].end(); iter++)
			{
				Node tmp = *(iter);

				cout << tmp.iKey << " " << tmp.iRowNumber << " \n";
			}
		}

		if (is_empty)
			cout << "Table is empty\n";
	}

	void resize()
	{

		vector<list<Node>> tmp(table);
		real_size *= 2;
		table.clear();
		table.resize(real_size);
		for (int i = 0; i < this->real_size / 2; i++) {
			while (!tmp[i].empty()) {
				table[hash_func(tmp[i].front().iKey)].push_front(tmp[i].front());
				tmp[i].pop_front();
			}
		}
		tmp.clear();
	}


	void clear()
	{
		table.clear();
		real_size = 8;
		current_size = 0;
		table.resize(real_size);
	}

	bool isEmpty() {
		return !current_size;
	}

	int get_current_size() {
		return this->current_size;
	}

	


	~hash_table()
	{
		delete[] & table;
	}
};

#endif
