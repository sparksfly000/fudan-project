#ifndef BNPAIRING_H_
#define BNPAIRING_H_
#include"BNField12.h"
#include"BNPoint2.h"
#include"BNPoint.h"

class   BNPairing :public BNField12
{
public:
	BNPoint2 Q_;
	BNPoint P_;
	BNPairing(){ Q_.setZero(); P_.setZero(); };
	BNPairing(mpz_t u, int b, BNField2 curve2Para,int mode=0) : BNField12(u,b,curve2Para,mode), P_(u, b), Q_(u, b,curve2Para,mode){};
	BNPairing(mpz_t u, int b, BNField2 curve2Para, BNPoint2 Q, BNPoint P,int mode = 0) : BNField12(u, b, curve2Para,mode), P_(u, b), Q_(u, b,curve2Para,mode){
	
		Q_.setBNPoint2(Q);
		P_.setBNPoint(P);
	};
	BNPairing(BNPoint2 Q,BNPoint P):BNField12(Q.u,Q.b,Q.b_),P_(P.u,P.b),Q_(Q.u,Q.b,Q.b_){
		Q_.setBNPoint2(Q);
		P_ .setBNPoint(P);
	};
	void setPairing(BNPoint2 Q, BNPoint P);
	BNField12 lDoublePoint(BNPoint2 Q, BNPoint P);
	BNField12 lAddtionPoint(BNPoint2 Q, BNPoint2 R, BNPoint P);
	BNField12 opt();
	BNField12 ate();
	BNPairing& operator=(const BNPairing& st);
	friend BNField12 getAte(BNPairing);




};

#endif
