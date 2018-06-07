#ifndef BNFIELD12_H_
#define BNFIELD12_H_
#include"BNField6.h"


class  BNField12 :public BNField6
{
public:
	BNField6 c0, c1;
	BNField12(){ c0.setZero(); c1.setZero(); };
	BNField12(BNPoint2 Q, BNPoint P):BNField6(P.u, P.b,Q.b_), c0(P.u, P.b,Q.b_), c1(P.u, P.b,Q.b_){}
	BNField12(mpz_t u, int b, BNField2 para, int mode = 0) :BNField6(u,b,para,mode),c0(u, b, para, mode), c1(u, b, para, mode){};
	BNField12(mpz_t u, int b, BNField2 para, BNField6 x, BNField6 y, int mode = 0) :BNField6(u, b, para, mode), c0(u, b, para, mode), c1(u, b, para, mode){ c0 = x; c1 = y; };
	void setBNField12(BNField6 x, BNField6 y);
	void setBNField12(BNField12);
	void setOne();
	BNField12 add(BNField12);
	BNField12 sub(BNField12);
	BNField12 mul(BNField12);
	BNField12 square();
	bool isEqual(const BNField12 &st);
	BNField12 exp(const mpz_t& k);
	BNField12 frobeniusMapP();
	BNField12 frobeniusMapP2();
	BNField12 frobeniusMapP3();
	BNField12 finalExp();
	BNField12 conjugation();
	BNField12 Inverse();
	BNField12 Exponentiation(const mpz_t& k); //using in Final Exponentiation
	BNField12& operator=(const BNField12& st);
	void BNField12Show();
};

#endif
