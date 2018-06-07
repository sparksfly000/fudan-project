#ifndef DEFINEFUNCTION_H_
#define DEFINEFUNCTION_H_
#include<iostream>
#include<gmp.h>
#include<vector>
#include<algorithm>
#include"BNParams.h"
#define BASE 16
using namespace std;
extern "C"
{
	 bool isOdd(mpz_t);
	 bool isEven(mpz_t);
	

	 bool TestIsOdd(const char *);
}
 vector<int> NAF(const mpz_t &);
 vector<int>BaseConvert(mpz_t x, int base);

BNParams GenerateBNParams(int m);
void  SquareRoot(mpz_t a, mpz_t mod,mpz_t &result);

//BNPairing GeneratePairing(int length);





#endif
