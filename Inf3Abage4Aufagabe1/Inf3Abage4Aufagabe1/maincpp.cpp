#include<iostream>
#include<functional>
#include <string>
#include "FilterableList.h"
#include <time.h>
using namespace std;


int main(void)
{
	FilterableList<float>* FilterableList1 = new FilterableList<float>();
	FilterableList1->printAll();

	srand(time(NULL));
	cout << "Random Numbers: " << endl;
	for (int t = 0; t<10; t++)
	{
		int random_x;
		
		float randomNum = rand() % 210 + (-100);
		FilterableList1->add(randomNum / 2.0*1.3);
		
		cout << "\nRandom Number = " << randomNum / 2.0*1.3;
	}



	FilterableList<string>* liststring = new FilterableList<string>();
	for (int i = 0; i < 10; i++) {
		liststring->add(genString());
	}
	//Lambda Expressions Float
	FilterableList<float>* negList = FilterableList1->filter([](float t) -> bool { return t < 0.0; });
	FilterableList<float>* evenList = FilterableList1->filter([](float t) -> bool { return (int)round(t) % 2 == 0; });
	FilterableList<float>* last = FilterableList1->filter([](float t)->bool {return t <= 5.0; });
	//Lambda Expressions String
	FilterableList<string>* firstList = liststring->filter([](string fList)->bool {return fList.length() >= 3; });
	FilterableList<string>* hasS = liststring->filter([](string s) -> bool {return s.find("s") != string::npos; });

	//Output

	cout << "\n";
	cout << "\n";
	cout << "Word list:" << endl;
	
	liststring->printAll();
	cout << "\n";
	cout << "Strings with length >= 3: " << endl;
	firstList->printAll();
	cout << "\n";
	cout << "Strings containing 's': " << endl;
	hasS->printAll();
	cout << "\n";
	cout << "Neg List: " << endl;
	negList->printAll();
	cout << "\n";
	cout << "Even List: " << endl;
	evenList->printAll();
	cout << "\n";
	cout << "Smaller than 5: " << endl;
	last->printAll();
	system("pause");

	return 0;
}