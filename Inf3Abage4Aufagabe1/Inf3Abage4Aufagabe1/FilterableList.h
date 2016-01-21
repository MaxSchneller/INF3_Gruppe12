#pragma once
#include<vector>
#include<functional>
#include<iostream>
#include <algorithm>
#include <string>
#include <cstdlib>
#include <random>
#include <cmath>
using namespace std;

template<typename T>
class FilterableList
{
private:
	vector<char> characters;
	vector<T> vec;
	random_device randomizer;

	void printSingle(T element) {
		cout << element << endl;
	}
public:



	//add object T
	void add(T object)
	{
		vec.push_back(object);
	}
	//remove object T
	void remove(T object)
	{
		vec.erase(object);

	}
	//Check if object T constains in vec
	void has(T object)
	{
		if (std::find(vec.begin(), vec.end(), item) != vec.end())
			return true;
		else
			return false;
	}
	
	FilterableList<T>* filter(function<bool(T)> l){
		FilterableList <T>* newList =new FilterableList<T>();
		for (int i = 0; i < vec.size(); i++) {
			if (l(vec[i])) {
				newList->add(vec[i]);
			}
		}
		return newList;

	}


	int size() {
		return vec.size();
	}

	void printAll() {
		for (int i = 0; i < vec.size(); i++) {
			cout << vec[i] << endl;
		}
	}





};
// String generator
string genString() {

	random_device randomDevice;
	const vector<string> alphabet = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };

	string result("");

	int wordSize = (randomDevice() % 10) + 1;

	for (int i = 0; i < wordSize; i++) {
		result.append(alphabet[randomDevice() % alphabet.size()]);
	}

	return result;
}





