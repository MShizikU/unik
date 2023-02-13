#include <iostream>
#include <vector>
#include <iomanip>
#include <fstream>
#include <math.h>
using namespace std;


void Parabol() {

	float f, L = 4.0, K = 2.4,
		a = (K - L) / 2, b = K + L;
	int n;

	ofstream out;
	out.open("result1.txt");

	for (int i = 4; i <= 8; i += 2) {
		n = i;

		cout << setprecision(5);

		float h = (b - a) / (2 * n);
		float x = a;

		vector<float> fVec;
		vector<float> xVec;


		cout << "- n = " << n << "\n\n";
		cout << " i |    xi   | f(xi)\n";
		cout << "___|_________|___________\n";

		out << "- n = " << n << "\n\n" << " i |    xi   | f(xi)\n" << "___|_________|___________\n";


		for (int i = 0; i < 2 * n + 1; i++) {

			xVec.push_back(x);
			f = (x + L) / (x * x + x + K);
			fVec.push_back(f);

			cout << setw(2) << i << " |";
			cout << setw(8) << x << " | ";
			cout << setw(7) << f << "\n";

			out << setw(2) << i << " |" << setw(8) << x << " | " << setw(7) << f << "\n";

			x += h;
		}

		float itg = 0, sum;

		sum = fVec[0] + fVec[fVec.size() - 1];
		for (int i = 1; i <= 2 * n - 1; i += 2)
			sum += 4 * fVec[i];

		for (int i = 2; i <= 2 * n - 2; i += 2)
			sum += 2 * fVec[i];

		itg = (h / 3) * sum;

		cout << setprecision(10);
		cout << "\n\n-= Ipar = " << itg << endl;
		cout << "-=   I = 5.28174" << endl;

		out << "\n\n-= Ipar = " << itg << "\n" << "-=   I = 5.28174" << "\n\n\n\n\n";
	}
	out.close();
}

void Trapec() {
	float f, L = 4.0, K = 2.4,
		a = (K - L) / 2, b = K + L;
	int n = 8;

	ofstream out;
	out.open("result2.txt");

	for (int i = 4; i <= 8; i += 2) {
		n = i;

		float h = (b - a) / n;
		float x = a;

		vector<float> fVec;
		vector<float> xVec;


		cout << "- n = " << n << "\n\n";
		cout << " i |    xi   | f(xi)\n";
		cout << "___|_________|___________\n";

		out << "- n = " << n << "\n\n" << " i |    xi   | f(xi)\n" << "___|_________|___________\n";


		for (int i = 0; i < n + 1; i++) {
			xVec.push_back(x);
			f = (x + L) / (x * x + x + K);
			fVec.push_back(f);

			cout << setw(2) << i << " |";
			cout << setw(8) << x << " | ";
			cout << setw(7) << f << "\n";

			out << setw(2) << i << " |" << setw(8) << x << " | " << setw(7) << f << "\n";

			x += h;
		}

		float itg, sum;

		sum = (fVec[0] + fVec[fVec.size() - 1]) / 2;

		for (int i = 1; i <= n - 1; i++)
			sum += fVec[i];

		itg = h * sum;

		cout << setprecision(10);
		cout << "\n\n-= Itr = " << itg << endl;
		cout << "-=   I = 5.28174" << endl;

		out << "\n\n-= Itr = " << itg << "\n" << "-=   I = 5.28174" << "\n\n\n\n\n";
	}
	out.close();
}

void Gauss() {
	float f, L = 4.0, K = 2.4,
		a = (K - L) / 2, b = K + L;
	int n;

	cout << endl << (0.5 * log(b * b + b + K) + ((L - 0.5) / (sqrt(K - 0.25))) * atan((b + 0.5) / (sqrt(K - 0.25)))) - (0.5 * log(a * a + a + K) + ((L - 0.5) / (sqrt(K - 0.25))) * atan((a + 0.5) / (sqrt(K - 0.25)))) << endl;

	float fourA[] = {
		0.347854,
		0.652145
	};
	float sixA[] = {
		0.171324,
		0.360761,
		0.467913,
	};
	float eightA[] = {
		0.101228,
		0.222381,
		0.313706,
		0.362683,
	};

	float fourT[] = {
		0.861136,
		0.339981
	};
	float sixT[] = {
		0.932464,
		0.661209,
		0.238619
	};
	float eightT[] = {
		0.960289,
		0.796666,
		0.525532,
		0.183434
	};


	ofstream out;
	out.open("result3.txt");

	for (int j = 4; j <= 8; j += 2) {
		n = j;

		cout << setprecision(6) << fixed;
		float x;
		float itg = (b - a) / 2, sum = 0, A = 0, T = 0;
		vector<float> fVec;
		vector<float> xVec;


		cout << "- n = " << n << "\n\n";
		cout << " i |    xi   |   f(xi)  |    Ai    |      Ti    \n";
		cout << "___|_________|__________|__________|____________\n";

		out << "- n = " << n << "\n\n"
			<< " i |    xi   |   f(xi)  |    Ai    |      Ti    \n"
			<< "___|_________|__________|__________|____________\n";


		for (int i = 1; i <= n; i++) {

			switch (n)
			{
			case 4:
				if (i <= n / 2) {
					T = -fourT[i - 1];
					A = fourA[i - 1];
				}
				else {
					T = fourT[n - i];
					A = fourA[n - i];
				}

				break;
			case 6:
				if (i <= n / 2) {
					T = -sixT[i - 1];
					A = sixA[i - 1];
				}
				else {
					T = sixT[n - i];
					A = sixA[n - i];
				}

				break;
			case 8:
				if (i <= n / 2) {
					T = -eightT[i - 1];
					A = eightA[i - 1];
				}
				else {
					T = eightT[n - i];
					A = eightA[n - i];
				}

				break;
			}


			x = (a + b) / 2 + T * (b - a) / 2;
			f = A * (x + L) / (x * x + x + K);

			xVec.push_back(x);
			fVec.push_back(f);

			cout << setw(2) << i << " |";
			cout << setw(8) << x << " | ";
			cout << setw(8) << f << " | ";
			cout << setw(7) << A << " | ";
			cout << setw(6) << T << " \n";

			out << setw(2) << i << " |"
				<< setw(8) << x << " | "
				<< setw(8) << f << " | "
				<< setw(7) << A << " | "
				<< setw(6) << T << " \n";

			sum += f;
		}

		itg *= sum;

		cout << setprecision(10);
		cout << "\n\n-= Ig = " << itg << endl;
		cout << "-=  I = 5.28174" << "\n\n\n\n\n";

		out << "\n\n-= Ig = " << itg << "\n" << "-=  I = 5.28174" << "\n\n\n\n\n";
	}
	out.close();
}


void main() {
	

	Parabol();
	Trapec();
	Gauss();
}