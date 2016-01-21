#pragma once
#include <iostream> 
#include <algorithm>
#include <functional> 
#include <vector> 

using namespace std;

class LambdaFunctions {

private:
	function<float(float)> biggestFunction;


public:
	LambdaFunctions();
	~LambdaFunctions();

	function<float(float)> max(vector <function<float(float)> > lambdaExpressions, float functionValue);
	int sum(vector< function<int(int)> > integerFunctions, int functionValue);


};
