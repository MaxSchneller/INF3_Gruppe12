#include "LambdaFunctions.h"
#include <iostream>
#include <functional>
#include <vector>

using namespace std;

LambdaFunctions::LambdaFunctions() {
	cout << "Constructor call" << endl;
}

LambdaFunctions::~LambdaFunctions() {
	cout << "destructor call" << endl;
}

function<float(float)> LambdaFunctions::max(vector<function<float(float)>> lambdaExpressions, float functionValue) {

	return nullptr;

}

int LambdaFunctions::sum(vector<function<int(int)>> lambdaExpressions, int functionValue) {
	int res = 0;
	for (int i = 0; i < lambdaExpressions.size(); i++) {
		res += lambdaExpressions[i](functionValue);
	}
	return res;
}
