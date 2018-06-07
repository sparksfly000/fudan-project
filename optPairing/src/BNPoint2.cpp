#include"BNField2.h"
#include"BNPoint2.h"
#include"DefineFunction.h"
#include<ctime>
#include<iterator>

BNPoint2::BNPoint2(BNPoint BNpoint) :BNPoint(BNpoint.u, BNpoint.b), b_(BNpoint.u,1,-1,-1), Yemoseilong(u,1,1,-1), GX(u, -1), GY(u, -1), GZ(u, -1)
{

	GX.setBNField2Coordinate(1, 0);
	GY.setBNField2Coordinate(1, 0);
	GZ.setBNField2Coordinate(0, 0);

}
BNPoint2::BNPoint2(mpz_t u, int b, BNField2 para,int mode) :BNPoint(u, b), b_(u,para.re,para.im,para.quadraticExtension), Yemoseilong(u,para.quadraticExtension), GX(u,para.quadraticExtension), GY(u,para.quadraticExtension), GZ(u,para.quadraticExtension)
{ 
	GX.setBNField2Coordinate(1, 0); 
    GY.setBNField2Coordinate(1, 0); 
	GZ.setBNField2Coordinate(0, 0); 
	if (mode == 0)
	{
		b_ = para;
		Yemoseilong = para.Inverse().mulConst(b);   //yemoseilong=b/para
	}
	else if(mode == 1)
	{
		Yemoseilong = para;
		b_ = para.Inverse().mulConst(b);  //b_=b/para
	}
	else
	{
		printf("Please input right mode ! 0 or 1 ,0 represent the input argument is b_,1 represent the input argument is Yemoweilong\n");
		throw "Please input right mode!!! ";
	}
 };

BNPoint2::BNPoint2(mpz_t u, int b, BNField2 para, BNField2 x, BNField2 y) :BNPoint(u, b), b_(u,para.re,para.im,para.quadraticExtension), Yemoseilong(u,para.quadraticExtension), GX(u, x.re, x.im,para.quadraticExtension), GY(u, y.re, y.im,para.quadraticExtension), GZ(u,para.quadraticExtension)
{
	GZ.setBNField2Coordinate(1, 0); 
    Yemoseilong = para.Inverse().mulConst(b);

};


BNPoint2::BNPoint2(mpz_t u, int b, BNField2 para, BNField2 x, BNField2 y, BNField2 z) :BNPoint(u, b), b_(u,para.re,para.im,para.quadraticExtension), Yemoseilong(u,para.quadraticExtension), GX(u, x.re, x.im,para.quadraticExtension), GY(u, y.re, y.im,para.quadraticExtension), GZ(u, z.re, z.im,para.quadraticExtension)
{
	
	Yemoseilong = para.Inverse().mulConst(b);

};


/*---set the point coordinate-------(x,y)-----*/
void BNPoint2::setBNPoint2SetCoordinate(BNField2 Field2X, BNField2 Field2Y)
{
	GX.setBNField2(Field2X);
	GY.setBNField2(Field2Y);
	GZ.setOne();

}


/*---set the point coordinate-------(x,y,z)-----*/
void BNPoint2::setBNPoint2SetCoordinate(BNField2 Field2X, BNField2 Field2Y, BNField2 Field2Z)
{
	GX.setBNField2(Field2X);
	GY.setBNField2(Field2Y);
	GZ.setBNField2(Field2Z);

}

/*---set the point coordinate-------BNPoint2-----*/
void BNPoint2::setBNPoint2(BNPoint2 Q)
{
this->setBNPoint2SetCoordinate(Q.GX, Q.GY, Q.GZ);


}


void BNPoint2::PointShow()
{
	Affine();
	gmp_printf("GX.re=%ZX\n", GX.re);
	gmp_printf("GX.im=%ZX\n", GX.im);
	gmp_printf("GY.re=%ZX\n", GY.re);
	gmp_printf("GY.im=%ZX\n", GY.im);
	gmp_printf("GZ.re=%ZX\n", GZ.re);
	gmp_printf("GZ.im=%ZX\n", GZ.im);

}

/*--------------------check the point is on the curve2----------------------*/

bool BNPoint2::TestPoint2OnBNCurve2()
{
	BNField2 X_(u,b_.quadraticExtension), Y_(u,b_.quadraticExtension), Z_(u,b_.quadraticExtension), tempx(u,b_.quadraticExtension), tempy(u,b_.quadraticExtension), tempz(u,b_.quadraticExtension);

	X_.setBNField2(GX);
	Y_.setBNField2(GY);
	Z_.setBNField2(GZ);
	X_.square();
	tempy = Y_.square();   //Y^2
	tempx = X_.square();
	tempx = tempx.mul(X_);    //X^3
	tempz = Z_.square();
	tempz = tempz.square().mul(tempz); //Z^6
	tempz = tempz.mul(b_); //b*Z^6
	tempx = tempx.add(tempz);  //x^3+b*Z^6
	
	bool test = tempy.isEqual(tempx);

	if (test)
		return true;
	else
	{
		throw "point is not on the curve!";
		return false;
	}
	
}

/*--------------------check the point order is n----------------------*/
bool BNPoint2::TestPointOrderIsN()
{

	bool test=this->ScalarMul(b_.n).isInfinite();  //test the [n]P==0?
	if (test)
		return true;
	else
	{
		throw "point order is not right!";
		return false;
	}

}
/*  ---check the point is infinity ------*/
bool BNPoint2::isInfinite()
{
	return GZ.isZero();
}

/*----test the point2 is equal*/
/*
bool BNPoint2::isEqual(BNPoint2 Q)
{
	this->TestPoint2OnBNCurve2();
	Q.TestPoint2OnBNCurve2();
	BNPoint2 Point2(b_.u,b,b_,quadraticExtension); // BNPoint2 is infinite point
	BNField2 X1(u), Y1(u), Z1(u), X2(u), Y2(u), Z2(u), Z1Z1(u), Z2Z2(u), U1(u), U2(u), S1(u), S2(u), H(u), I(u), J(u), R(u), V(u), X3(u), Y3(u), Z3(u);
	X1 = GX;
	Y1 = GY;
	Z1 = GZ;
	X2 = Q.GX;
	Y2 = Q.GY;
	Z2 = Q.GZ;
	Z1Z1.setOne();
	Z2Z2.setOne();
	U1 = X1;
	U2 = X2;
	S1 = Y1;
	S2 = Y2;
	bool Z1is1 = Z1.isOne();
	bool Z2is1 = Z2.isOne();
	if (!Z1is1)
	{
		Z1Z1 = Z1.square();  //Z1Z1=Z1^2
		U2 = X2.mul(Z1Z1);   // U2 = X2*Z1Z1
		S2 = Z1.mul(Z1Z1).mul(Y2);// S2 = Y2*Z1*Z1Z1
	}

	if (!Z2is1)
	{
		Z2Z2 = Z2.square();  //Z2Z2=Z2^2
		U1 = X1.mul(Z2Z2);   // U1 = X1*Z2Z2
		S1 = Z2.mul(Z2Z2).mul(Y1);// S1 = Y1*Z2*Z2Z2

	}

	if (U1.isEqual(U2))
	{
		if (S1.isEqual(S2))
			return  true;
		else
			return false;

		
	}

	else
	{
		return false;
	}

}
*/
/*
BNPoint2 BNPoint2::Addtion(BNPoint2 Q)
{
	this->TestPoint2OnBNCurve2();
	Q.TestPoint2OnBNCurve2();
	BNField2 Xq(Q.u), Yq(Q.u), Zq(Q.u), Xt(Q.u), Yt(Q.u), Zt(Q.u);
	
	Xq = Q.GX;
	Yq = Q.GY;
	Zq = Q.GZ;

	BNField2  Xr(u), Yr(u), Zr(u);
	Xr = GX;
	Yr = GY;
	Zr = GZ;
	BNField2 t0(Q.u), t1(Q.u), t2(Q.u), t3(Q.u), t4(Q.u), t5(Q.u), t6(Q.u), t7(Q.u), t8(Q.u), t9(Q.u), t10(Q.u);

	t0 = Xq.mul(Zr.square());  //t0=Xq*Zr^2
	t1 = Yq.add(Zr).square().sub(Yq.square()).sub(Zr.square());//t1=(Yq+Zr)^2-Yq^2-Zr^2
	t1 = t1.mul(Zr.square());//t1=t1*Zr^2
	t2 = t0.sub(Xr);//t2=t0-Xr
	t3 = t2.square();//t3=t2^2
	t4 = t3.mulConst(4);//t4=4*t3
	t5 = t4.mul(t2);//t5=t4*t2
	t6 = t1.sub(Yr.mulConst(2));//t6=t1-2*Yr
	t9 = t6.mul(Xq);//t9=t6*Xq
	t7 = Xr.mul(t4);//t7=Xr*t4
	Xt = t6.square().sub(t5).sub(t7.mulConst(2));//Xt=t6^2-t5-2*t7
	Zt = Zr.add(t2).square().sub(Zr.square()).sub(t3);//Zt=(Zr+t2)^2-Zr^2-t3
	t10 = Yq.add(Zt);//t10=Yq+Zt
	t8 = t7.sub(Xt).mul(t6);//t8=(t7-Xt)*t6
	t0 = Yr.mul(t5).mulConst(2);//t0=2*(Yr*t5)
	Yt = t8.sub(t0);//Yt=t8-t0
	return BNPoint2 (u, b, b_, Xt, Yt, Zt);



}


BNPoint2 BNPoint2::Double()
{
	this->TestPoint2OnBNCurve2();
	BNField2 Xq(u), Yq(u), Zq(u), Xt(u), Yt(u), Zt(u);


	Xq = GX;
	Yq = GY;
	Zq = GZ;


	BNField2 tmp0(u), tmp1(u), tmp2(u), tmp3(u), tmp4(u), tmp5(u), tmp6(u);
	tmp0 = Xq.square();  //tmp0=Xq^2
	tmp1 = Yq.square();//tmp1=Yq^2
	tmp2 = tmp1.square(); //tmp2=tmp1^2
	tmp3 = tmp1.add(Xq).square().sub(tmp0).sub(tmp2); //tmp3 = (tmp1+Xq)^2-tmp0-tmp2
	tmp3 = tmp3.mulConst(2);//tmp3=2*tmp3
	tmp4 = tmp0.mulConst(3);//tmp4=3*tmp0
	tmp6 = Xq.add(tmp4);//tmp6=Xq+tmp4
	tmp5 = tmp4.square();//tmp5=tmp4^2
	Xt = tmp5.sub(tmp3.mulConst(2));//Xt=tmp5-2*tmp3
	Zt = Yq.add(Zq).square().sub(tmp1).sub(Zq.square());//Zt=(Yq+Zq)^2-tmp1-Zq^2
	Yt = tmp3.sub(Xt).mul(tmp4).sub(tmp2.mulConst(8));//Yt=(tmp3-Xt)*tmp4-8*tmp2
	return BNPoint2 (u, b, b_, Xt, Yt, Zt);



}
*/
/* ------------ calculate the point2 add----------------- */

BNPoint2 BNPoint2::Add(BNPoint2 Q)
{
	this->TestPoint2OnBNCurve2();
	Q.TestPoint2OnBNCurve2();
	BNPoint2 Point2(u,b,b_); // BNPoint2 is infinite point
	if (this->isInfinite())
	{
		return Q;
	}

	if (Q.isInfinite())
	{
		return *this;
	}

	BNField2 X1(u,b_.quadraticExtension),
		Y1(u,b_.quadraticExtension), 
		Z1(u,b_.quadraticExtension), 
		X2(u,b_.quadraticExtension),
		Y2(u,b_.quadraticExtension),
		Z2(u,b_.quadraticExtension),
		Z1Z1(u,b_.quadraticExtension),
		Z2Z2(u,b_.quadraticExtension),
		U1(u,b_.quadraticExtension),
		U2(u,b_.quadraticExtension), 
		S1(u,b_.quadraticExtension),
		S2(u,b_.quadraticExtension),
		H(u,b_.quadraticExtension),
		I(u,b_.quadraticExtension), 
		J(u,b_.quadraticExtension), 
		R(u,b_.quadraticExtension), 
		V(u,b_.quadraticExtension),
		X3(u,b_.quadraticExtension), 
		Y3(u,b_.quadraticExtension),
		Z3(u,b_.quadraticExtension);
	X1 = GX;
	Y1 = GY;
	Z1 = GZ;
	X2 = Q.GX;
	Y2 = Q.GY;
	Z2 = Q.GZ;
	Z1Z1.setOne();
	Z2Z2.setOne();
	U1 = X1;
	U2 = X2;
	S1 = Y1;
	S2 = Y2;
	bool Z1is1 = Z1.isOne();
	bool Z2is1 = Z2.isOne();
	if (!Z1is1)
	{
		Z1Z1 = Z1.square();  //Z1Z1=Z1^2
		U2 = X2.mul(Z1Z1);   // U2 = X2*Z1Z1
		S2 = Z1.mul(Z1Z1).mul(Y2);// S2 = Y2*Z1*Z1Z1
	}

	if (!Z2is1)
	{
		Z2Z2 = Z2.square();  //Z2Z2=Z2^2
		U1 = X1.mul(Z2Z2);   // U1 = X1*Z2Z2
		S1 = Z2.mul(Z2Z2).mul(Y1);// S1 = Y1*Z2*Z2Z2
	
	}

	if (U1.isEqual(U2))
	{
		if (S1.isEqual(S2))
			return Q.Twice(1);

		else
		{
			
			return Point2;  //the point2 is infinite point;
		}
	}



	H = U2.sub(U1); // H = U2-U1
	I = H.mulConst(2).square();  // I = (2*H)^2
	J = H.mul(I);  // J = H*I
	R = S2.sub(S1).mulConst(2);  // R = 2*(S2-S1)
	V = U1.mul(I); //V = U1*I
	X3 = R.square().sub(J).sub(V.mulConst(2));  // X3 = R^2-J-2*V
	Y3 = V.sub(X3).mul(R).sub(S1.mul(J).mulConst(2));  // Y3 = R*(V-X3)-2*S1*J

	if (Z2is1)
	{
		if (Z1is1)
		{
			Z3 = H.mulConst(2);// Z3 = 2*H
			
		}
		else
		{
			Z3 = Z1.mul(H).mulConst(2);  //Z3=2*Z1*H
		}
	}
	else
	{
		if (Z1is1)
		{
			Z3 = Z2.mul(H).mulConst(2);  //Z3=2*Z2*H
		}
		else
		{
			Z3 = Z1.mul(Z2).mul(H).mulConst(2);//Z3=2*Z1*Z2*H

		}
	}

	Point2.setBNPoint2SetCoordinate(X3, Y3, Z3);

	return Point2;



}

BNPoint2 BNPoint2::Sub(BNPoint2 Q)
{
	return this->Add(Q.Neg());
}


/*----         get the 2^n*point2        --------------*/
BNPoint2 BNPoint2::Twice(int n)
{
	this->TestPoint2OnBNCurve2();
	BNPoint2 Point2(u,b,b_);  //Point2 is infinite point.
	BNField2 A(u,b_.quadraticExtension),
		B(u,b_.quadraticExtension), 
		C(u,b_.quadraticExtension), 
		S(u,b_.quadraticExtension),
		M(u,b_.quadraticExtension), 
		X_(u,b_.quadraticExtension),
		Y_(u,b_.quadraticExtension),
		Z_(u,b_.quadraticExtension);
	X_ = GX;
	Y_ = GY;
	Z_ = GZ;
	while (n-->0)
	{
		A = X_.square();// A = X^2 (modular reduction is irrelevant)
		B = Y_.square();  // B = Y^2
		C = B.square();  // C = B^2 (modular reduction is irrelevant)
		S = X_.add(B).square().sub(A).sub(C).twice(1); // S = 2*((X+B)^2-A-C)
		M = A.mulConst(3);// M = 3*A
		X_ = M.square().sub(S.mulConst(2)); // X = M^2-2*S
		Z_ = Y_.mul(Z_).mulConst(2);  // Z = 2*Y*Z
		Y_ = M.mul(S.sub(X_)).sub(C.mulConst(8)); // Y3 = M*(S-X)-8*C

	}

	Point2.setBNPoint2SetCoordinate(X_, Y_, Z_);
	return Point2;

}





/*-----  get the k*point -----------*/
BNPoint2 BNPoint2::ScalarMul(const mpz_t& k)

{ 
	this->TestPoint2OnBNCurve2();
	std::vector<int> vec =NAF(k);
	BNPoint2 Q(u,b,b_);   // the Q is infinite point
	BNPoint2 P(u,b,b_);
	P= *this;

	std::vector<int>::iterator pIter;
	pIter = vec.begin();
	for (; pIter != vec.end(); pIter++)
	{
		if (*pIter==1)
		{
			Q = Q.Add(P);
		}
		else if (*pIter==-1)
		{
			Q = Q.Sub(P);
		}
		P = P.Twice(1);


	}
	return Q;
}

/*--get the -Q ---(X,Y,Z)--->(X,-Y,Z)*/
BNPoint2 BNPoint2::Neg()
{
	BNField2 Y(u,b_.quadraticExtension);
	Y =GY.neg();  //Y=-GY
	BNPoint2 Q_neg(u, b,b_);
	Q_neg.setBNPoint2SetCoordinate(GX, Y, GZ); 
	return Q_neg;

}


/*--        (x,y,z)->(x',y',1)  ---*/
void BNPoint2::Affine()
{
	if (!GZ.isOne())

	{
		if (!GZ.isZero())
		{
			GX = GX.mul(GZ.square().Inverse());  //GX = GX / (GZ^2)
			GY = GY.mul(GZ.square().mul(GZ).Inverse());//GY=GY/(GZ^3)
			GZ.setOne();
		}
		else
		{
			GX.setOne();
			GY.setOne();  // (1:1:0)
		}
	}


}

/* get the random point-------*/

BNPoint2 BNPoint2::RandomPoint()
{

	gmp_randstate_t st;
	unsigned long tm;
	gmp_randinit_default(st);
	tm = (unsigned long)time(NULL);
	gmp_randseed_ui(st, tm);
	BNField2 gx(u,b_.quadraticExtension),tmp(u,b_.quadraticExtension);
	mpz_t p2_1_2;
	mpz_init(p2_1_2);
	mpz_mul(p2_1_2, p, p);
	mpz_sub_ui(p2_1_2, p2_1_2, 1);
	mpz_cdiv_q_ui(p2_1_2, p2_1_2, 2);//p2_1_2=(p^2-1)/2

	do
	{
		mpz_urandomm(gx.re, st, p);
		mpz_urandomm(gx.im, st, p);
		tmp = gx.square().mul(gx).add(b_);
		
	} while (!tmp.exp(p2_1_2).isOne());

	BNField2 gy(u,b_.quadraticExtension);
	gy = tmp.SquareRoot();
	
	return BNPoint2 (u, b,b_, gx, gy);
}

BNPoint2& BNPoint2::operator=(const BNPoint2& st)
{
	if (this == &st)
		return *this;
	GX=st.GX;
	GY=st.GY;
	GZ=st.GZ;
	b_ = st.b_;
	Yemoseilong = st.Yemoseilong;
	b = st.b;
	return *this;


}
