#ifndef BNPOINT2_H_
#define BNPOINT2_H_
#include"BNPoint.h"


class   BNPoint2 :public BNPoint
{
public:
	BNField2 b_;
	BNField2 Yemoseilong;
	BNField2 GX;
	BNField2 GY;
	BNField2 GZ;
	BNPoint2(){ GX.setOne(); GY.setOne(); GZ.setBNField2Coordinate(0, 0); };
	BNPoint2(mpz_t u,int b, BNField2 para,int mode = 0);
	BNPoint2(BNPoint);
	
	BNPoint2(mpz_t u, int b, BNField2 para, BNField2 x, BNField2 y);
	
	BNPoint2(mpz_t u, int b, BNField2 para, BNField2 x, BNField2 y, BNField2 z);

	void setBNPoint2SetCoordinate(BNField2 Field2GX, BNField2 Field2GY);
	void setBNPoint2SetCoordinate(BNField2 Field2GX, BNField2 Field2GY,BNField2 Field2GZ);
	void setBNPoint2(BNPoint2 Q);
	void Restb_(BNField2 para){ b_ = para; Yemoseilong = b_.Inverse().mulConst(b); };
	bool TestPoint2OnBNCurve2();
	bool TestPointOrderIsN();
	bool isInfinite();
	void setZero(){ GX.setOne(); GY.setOne(); GZ.setZero(); }
	bool isEqual(BNPoint2);
	BNPoint2 Add(BNPoint2 Q);
	BNPoint2 Sub(BNPoint2 Q);
	BNPoint2 ScalarMul(const mpz_t& k);
	BNPoint2 Twice(int n);
	BNPoint2 Neg();
	BNPoint2 Double();
	BNPoint2 Addtion(BNPoint2);
	void Affine();
	BNPoint2 RandomPoint();
	BNPoint2& operator=(const BNPoint2& st);
	void PointShow();


};




#endif
