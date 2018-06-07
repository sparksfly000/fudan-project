#ifndef BNFIELD2_H_
#define BNFIELD2_H_
#include"BNParams.h"
#include"gmp.h"


class   BNField2 :public BNParams
{
public:
	mpz_t re;
	mpz_t im;
	int quadraticExtension;
	BNField2(){ mpz_init(re); mpz_init(im); quadraticExtension = -1; };
	BNField2(mpz_t u, int i2) :BNParams(u){ quadraticExtension = i2; mpz_init_set_ui(re, 0);  mpz_init_set_ui(im, 0); };
	BNField2(mpz_t u, mpz_t b0, mpz_t b1, int i2) :BNParams(u){ quadraticExtension = i2; mpz_init_set(re, b0); mpz_init_set(im, b1); };
	BNField2(mpz_t u, int b0, int b1, int i2) : BNParams(u){ quadraticExtension = i2; mpz_init_set_si(re, b0); mpz_init_set_si(im, b1); };
	void setBNField2(BNField2); 
	void setBNField2Coordinate(mpz_t X0, mpz_t X1){ mpz_set(re, X0); mpz_set(im, X1); }
	void setBNField2Coordinate(int X0, int X1){ mpz_init_set_si(re, X0); mpz_init_set_si(im, X1); }  //  if not positive integer , do ????
	bool isZero();
	bool isOne();
	bool isEqual(const BNField2& Field2);
	void setOne();
	void setZero(){ mpz_init_set_ui(re, 0); mpz_init_set_ui(im, 0); quadraticExtension = -1; };
	BNField2 add(BNField2);
	BNField2 sub(BNField2);
	BNField2 mul(BNField2);
	BNField2 twice(int n);
	BNField2 mulConst(mpz_t a);
	BNField2 mulConst(int a);
	BNField2 square();
	BNField2 mulI();
	BNField2 mulI_1();
	BNField2 divI_1();
	BNField2 exp(mpz_t k);
	BNField2 neg();
	BNField2 conjugate();
	BNField2 Inverse();
	BNField2 SquareRoot();
	BNField2& operator=(const BNField2& st);
	void BNField2Show();
};





#endif
