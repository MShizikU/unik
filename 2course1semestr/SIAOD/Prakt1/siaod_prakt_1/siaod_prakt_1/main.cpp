
#include<iostream>
using namespace std;

string decToBin(int num)
{
	if (num == 0) return "000000000000";
	
	string bin = "";
	char tmp;
	while (num > 0) {
		if ((num & 1) == 0) {
			tmp = '0';
		}
		else {
			tmp = '1';
		}
		bin = tmp + bin;
		num = num >> 1;
	}
	return bin;

}

int create_mask_ex1(int length) {
	int result = 0b1;
	for (int i = 0; i < length/2; i++) {
		result = result << 2;
		result |= (1 << 0);
		result &= ~(1 << 1);
		result |= (1 << 0);
	}
	return result;
}

int create_mask_ex2(int length) {
	int result = 0b1;
	for (int i = 0; i < length; i++) {
		result = result << 1;
		result |= (1 << 0);
	}
	result &= ~(1 << 7);
	result &= ~(1 << 9);
	result &= ~(1 << 11);
	return result;
}


void exercise_1(int base_number) {

	int mask = create_mask_ex1(decToBin(base_number).length());
	cout << "Exercise 1" << endl;
	cout << "Number: " << base_number << " ; " << decToBin(base_number) << endl;
	cout << "Mask: " << mask << " ; " << decToBin(mask) << endl;
	cout << "Output: " << (base_number | mask) << " ; " << decToBin(base_number | mask) << endl;
}

void exercise_2(int base_number) {
	int mask = create_mask_ex2(decToBin(base_number).length());

	cout << "Exercise 2" << endl;
	cout << "Number: " << base_number << " ; " << decToBin(base_number) << endl;
	cout << "Mask: " << mask << " ; " << decToBin(mask) << endl;
	cout << "Output: " << (base_number & mask) << " ; " << decToBin(base_number & mask) << endl;
}

void exercise_3(int base_number) {
	cout << "Exercise 3" << endl;
	cout << "Number: " << base_number << " ; " << decToBin(base_number) << endl;
	cout << "Output: " << (base_number << 4) << " ; " << decToBin(base_number <<4) << endl;
}

void exercise_4(int base_number) {
	cout << "Exercise 4" << endl;
	cout << "Number: " << base_number << " ; " << decToBin(base_number) << endl;
	cout << "Output: " << (base_number >> 4) << " ; " << decToBin(base_number >> 4) << endl;
}

void exercise_5(int base_number, int n) {
	int mask = 0b1;
	mask = 1 << n;
	cout << "Exercise 5" << endl;
	cout << "Number: " << base_number << " ; " << decToBin(base_number) << endl;
	cout << "Mask: " << (mask) << " ; " << decToBin((mask)) << endl;
	cout << "Output: " << (base_number^(mask)) << " ; " << decToBin(base_number^(mask)) << endl;
}

void main() {
	exercise_1(0xFF0);

	int base_number_ex_2 = 0;
	cout << "Enter number for ex2: ";
	cin >> base_number_ex_2;
	exercise_2(base_number_ex_2);

	int base_number_ex_3;
	cout << "Enter number for ex3: ";
	cin >> base_number_ex_3;
	exercise_3(base_number_ex_3);

	int base_number_ex_4;
	cout << "Enter number for ex4: ";
	cin >> base_number_ex_4;
	exercise_4(base_number_ex_4);


	int base_number_ex_5, count_bits;
	cout << "Enter number for ex5: ";
	cin >> base_number_ex_5;
	cout << "Enter n for ex5: ";
	cin >> count_bits;
	exercise_5(base_number_ex_5, count_bits);
}


