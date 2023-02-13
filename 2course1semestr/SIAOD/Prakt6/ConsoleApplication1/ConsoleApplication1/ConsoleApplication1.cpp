// ConsoleApplication1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//


#include <iostream>
using namespace std;

const double h = 0.5;

double nextY(double* x, double* y, int n);

double f(double x, double y);

double* getK(double* x, double* y, int n);

int main()
{
    double* x = new double[5];
    x[0] = 0;
    for (int i = 1; i < 5; i++) x[i] = x[i - 1] + 0.5;
    double* y = new double[5];
    y[0] = 2.4;
    for (int i = 1; i < 5; i++) {
        y[i] = nextY(x, y, i);
        std::cout << "Answer: " << y[i] << std::endl;
    }
}

double nextY(double* x, double* y, int n) {
    double* K = getK(x, y, n);
    cout << "K :" << endl;
    for (int i = 0; i < 4; i++) {
        cout << "K " << i + 1 << " : " << K[i] << endl;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ;
    }
    cout << y[n - 1] << " + " << h / 6 << " * " << "( " << K[0] << " + 2 * " << K[1] << "  + 2 * " << K[2] << " + " << K[3] << " ) ";
    return y[n-1] + h/6*(K[0] + 2*K[1] + 2*K[2] + K[3]);
}

double f(double x, double y) {
    return x * x + 1.5 * y;
}

double* getK(double* x, double* y, int n) {
    double* K = new double[4];
    K[0] = f(x[n - 1], y[n - 1]);
    K[1] = f(x[n - 1] + h / 2, y[n - 1] + h * K[0] / 2);
    K[2] = f(x[n - 1] + h / 2, y[n - 1] + h * K[1] / 2);
    K[3] = f(x[n - 1] + h, y[n - 1] + h * K[2]);
    return K;
}