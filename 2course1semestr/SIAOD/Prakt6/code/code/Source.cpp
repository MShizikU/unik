

#include <iostream>

using namespace std;

int slowVariant(int* numbers, int size);
int fastVariant(int* numbers, int size);
int insertCeil(int subsequence[], int startLeft, int startRight, int key);
void print(int* array, int size);


int main() {
    int size = 0;
    cout << "Enter size: ";
    cin >> size;
	int* array = new int[size];

    cout << "Enter elements: ";

    for (int i = 0; i < size; i++)
    {
        cin >> array[i];
    }
    
	cout << "First alg. : " << slowVariant(array, size) << endl;



   
    cout << "Second alg. : " << fastVariant(array, size);
}

int slowVariant(int* numbers, int size) {
    int counter = 0;
    if (size <= 1) {
        return 1;
    }

	int* counts = new int[size];

    for (int i = 0; i < size; i++) {
        counts[i] = 1;
        counter++;
    }
	for (int i = 0; i < size - 1; i++) {
		for (int j = i + 1; j < size; j++) {
            counter++;
			if (numbers[j] > numbers[i] and counts[j] <= counts[i]) {
                counts[j] = counts[i] + 1;
			}
		}
	}

	int result = 0;

    for (int i = 0; i < size; i++)
    {
        counter++;
        if (counts[i] > result)
            result = counts[i];
    }

    cout << "Slow: " << counter << endl;
	return result;
}

int fastVariant(int* numbers, int size) {
    if (size <= 1) {
        return 1;
    }
    int counter = 0;
    int iMaxLength = -1;

    int* subsequence = new int[size];
    int* indexes = new int[size];

    for (int i = 0; i < size; ++i) {
        counter++;
        subsequence[i] = INT_MAX;
        indexes[i] = INT_MAX;
    }

    subsequence[0] = numbers[0];
    indexes[0] = 0;

    for (int i = 1; i < size; ++i) {
        counter++;
        indexes[i] = insertCeil(subsequence, 0, i, numbers[i]);

        if (iMaxLength < indexes[i]) {
            iMaxLength = indexes[i];
        }
    }

    cout << "Fast: " << counter << endl;

    return iMaxLength + 1;
}

int insertCeil(int subsequence[],int startLeft,int startRight, int key) {
    int counter = 0;

    int mid = 0;
    int left = startLeft;
    int right = startRight;
    int ceilIndex = 0;
    bool ceilIndexFound = false;

    for (mid = (left + right) / 2; left <= right && !ceilIndexFound; mid = (left + right) / 2) {
        counter++;
        if (subsequence[mid] > key) {
            right = mid - 1;
        }
        else if (subsequence[mid] == key) {
            ceilIndex = mid;
            ceilIndexFound = true;
        }
        else if (mid + 1 <= right && subsequence[mid + 1] >= key) {
            subsequence[mid + 1] = key;
            ceilIndex = mid + 1;
            ceilIndexFound = true;
        }
        else {
            left = mid + 1;
        }
    }

    if (!ceilIndexFound) {
        if (mid == left) {
            subsequence[mid] = key;
            ceilIndex = mid;
        }
        else {
            subsequence[mid + 1] = key;
            ceilIndex = mid + 1;
        }
    } 
    cout << "Bin search: " << counter << endl;
    return ceilIndex;
}


void print(int* array, int size) {
    for (int i = 0; i < size; i++) {
        if (array[i] != INT_MAX) {
            cout << array[i] << " ";
        }
    }
    cout << "\n";
}