#ifndef BNFIELD6_H_
#define BNFIELD6_H_
#include"BNField2.h"
#include"BNPoint2.h"
class   BNField6 :public BNPoint2
{
public:
	BNField2 a0, a1, a2;
	BNField6(){ a0.setZero(); a1.setZero(); a2.setZero(); };
	BNField6(mpz_t u, int b, BNField2 para,int mode=0) :BNPoint2(u, b, para,mode), a0(u,para.quadraticExtension), a1(u,para.quadraticExtension), a2(u,para.quadraticExtension)
	{
		a0.setBNField2Coordinate(0, 0);
		a1.setBNField2Coordinate(0, 0);
		a2.setBNField2Coordinate(0, 0);
	};

	BNField6(mpz_t u, int b, BNField2 para, BNField2 x, int mode = 0) :BNPoint2(u, b, para, mode), a0(u, para.quadraticExtension), a1(u, para.quadraticExtension), a2(u, para.quadraticExtension)
	{
		a0 = x;

	}


	BNField6(mpz_t u, int b, BNField2 para, BNField2 x, BNField2 y ,int mode = 0) :BNPoint2(u, b, para,mode), a0(u,para.quadraticExtension), a1(u,para.quadraticExtension), a2(u,para.quadraticExtension)
	{
		a0 = x;
		a1 = y;
	}

	BNField6(mpz_t u, int b, BNField2 para, BNField2 x, BNField2 y, BNField2 z ,int mode = 0) :BNPoint2(u, b, para,mode), a0(u,para.quadraticExtension), a1(u,para.quadraticExtension), a2(u,para.quadraticExtension)
	{
		a0 = x;
		a1 = y;
		a2 = z;
	}

	void setBNField6(BNField2 x, BNField2 y, BNField2 z);
	void setBNField6(BNField6);
	void setZero(){ a0.setZero(); a1.setZero(); a2.setZero(); };
	void setOne();
	bool isEqual(const BNField6 &st);
	BNField6 add(BNField6);
	BNField6 sub(BNField6);
	BNField6 mul(BNField6);
	BNField6 mulV();
	BNField6 square();
	BNField6 mulConst(int);
	BNField6 mulConst(mpz_t n);
	BNField6 exp(mpz_t k);
	BNField6 neg();
	BNField6 Inverse();
	BNField6& operator=(const BNField6& st);
	void BNField6Show();



};





#endif
