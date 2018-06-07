#ifndef BNPOINT_H_
#define BNPOINT_H_
#include"gmp.h"
#include"BNParams.h"


class   BNPoint :public BNParams
{

public:
	int b;
	mpz_t PX,PY,PZ;
	BNPoint(){ mpz_init_set_ui(PX, 1); mpz_init_set_ui(PY, 1); mpz_init_set_ui(PZ, 0); int b = 0; };
	BNPoint(BNParams BNParams);
	BNPoint(BNParams BNParams, int b);
	BNPoint(BNParams BNParams, int b, int x, int y);
	BNPoint(BNParams BNParams, int b, mpz_t x, mpz_t y);
	BNPoint(BNParams BNParams, int b, mpz_t x, mpz_t y, mpz_t z);
	bool isInfinite();
	void BNPointSetZero();
	void Resetb(int x){ b = x; };
	bool TestPointOnBNCurve();
	bool TestPointOrderIsN();
	void setBNPoint(BNPoint P);
	void BNPointSetCoordinate(mpz_t x, mpz_t y);
	void BNPointSetCoordinate(mpz_t x, mpz_t y, mpz_t z);
	void PointShow();
	void setZero(){ mpz_init(PX); mpz_init(PY); mpz_init(PZ); };
	BNPoint Add(BNPoint Q);
	BNPoint Sub(BNPoint Q);
	BNPoint ScalarMul(const mpz_t &k);
	BNPoint Neg();
	BNPoint Twice(int n);
	BNPoint GenerateRandomPoint();
	void Affine();
	BNPoint& operator=(const BNPoint& st);
	




};



















#endif
