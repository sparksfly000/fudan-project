/*
#ifndef BNCURVE2_H_
#define BNCURVE2_H_
#include"gmp.h"
#include"BNField2.h"
#include"BNParams.h"

class   __declspec(dllexport) BNCurve2 :public BNField2
{
public:
	BNField2 B;
	//BNCurve2(mpz_t u) :BNField2(u){ mpz_init_set_ui(b0, 0); mpz_init_set_ui(b1, 0); };
	BNCurve2(mpz_t u, BNField2 para) :BNField2(u), B(u){ B.setBNField2(para); }
	void setBNCurve2Para(BNField2 x){ B.setBNField2(x);}

};
	 

*/








//