#include"gmp.h"
#include"BNPoint.h"
#include"DefineFunction.h"
#include<ctime>

/*---  default is infinite point*/

BNPoint::BNPoint(BNParams BNparams) :BNParams(BNparams.u)
{
	b = 2;
	mpz_init_set_ui(PX, 1);
	mpz_init_set_ui(PY, 1);
	mpz_init_set_ui(PZ, 0);

}
BNPoint::BNPoint(BNParams BNparams, int x) :BNParams(BNparams.u)
{
	b = x;
	mpz_init_set_ui(PX, 1);
	mpz_init_set_ui(PY, 1);
	mpz_init_set_ui(PZ, 0);
}

BNPoint::BNPoint(BNParams BNparams, int tmp, int x, int y) :BNParams(BNparams.u)
{
	b = tmp;
	mpz_init_set_ui(PX, x);
	mpz_init_set_ui(PY, y);
	mpz_init_set_ui(PZ, 1);

}
BNPoint::BNPoint(BNParams BNparams, int tmp, mpz_t x, mpz_t y) :BNParams(BNparams.u)
{
	b = tmp;
	mpz_init_set(PX, x);
	mpz_init_set(PY, y);
	mpz_init_set_ui(PZ, 1);
}

BNPoint::BNPoint(BNParams BNparams, int tmp, mpz_t x, mpz_t y, mpz_t z) :BNParams(BNparams.u)
{
	b = tmp;
	mpz_init_set(PX, x);
	mpz_init_set(PY, y);
	mpz_init_set(PZ, z);
}

/*  ---check the point is infinity ------*/
bool BNPoint::isInfinite()
{
	return mpz_cmp_ui(PZ, 0) == 0;
}

/*  -- reset the point is zero------(1,1,0)---*/
void BNPoint::BNPointSetZero()
{
	mpz_set_ui(PX, 1);
	mpz_set_ui(PY, 1);
	mpz_set_ui(PZ, 0);
	
}
/*---set the point coordinate-------(x,y)-----*/
void BNPoint::BNPointSetCoordinate(mpz_t x, mpz_t y)
{
	mpz_set(PX, x);
	mpz_set(PY, y);
	mpz_set_ui(PZ, 1);

}



/*---set the point coordinate-------(x,y,z)-----*/
void BNPoint::BNPointSetCoordinate(mpz_t x, mpz_t y,mpz_t z)
{
	mpz_set(PX, x);
	mpz_set(PY, y);
	mpz_set(PZ, z);
	

}


/*---set the point coordinate-------BNPoint-----*/
void BNPoint::setBNPoint(BNPoint P)
{
this->BNPointSetCoordinate(P.PX, P.PY, P.PZ);


}


/*--------------------check the point is on the curve----------------------*/

bool BNPoint::TestPointOnBNCurve()
{
	mpz_t X, Y, Z, tempx, tempy, tempz;
	mpz_init_set(X, PX);
	mpz_init_set(Y, PY);
	mpz_init_set(Z, PZ);
	mpz_init(tempx);
	mpz_init(tempy);
	mpz_init(tempz);
	mpz_powm_ui(tempy, Y, 2, p);
	mpz_powm_ui(tempx, X, 3, p);
	mpz_powm_ui(tempz, Z, 6, p);
	mpz_t b_temp;
	mpz_init_set_si(b_temp, b);
	mpz_addmul(tempx, tempz, b_temp);
	mpz_mod(tempx, tempx, p);
	int test = mpz_cmp(tempx, tempy);
	if (test == 0)
		return true;
	else
	{
		throw "point is not on the curve!"; 
		return false;
	}
}


/*--------------------check the point order is n----------------------*/
bool BNPoint::TestPointOrderIsN()
{

	bool test = this->ScalarMul(n).isInfinite();  //test the [n]P==0?
	if (test)
		return true;
	else
	{
		throw "point order is not right!";
		return false;
	}

}

void BNPoint::PointShow()
{
	Affine();
	gmp_printf("PX=%ZX\n", PX);
	gmp_printf("PY=%ZX\n", PY);
	gmp_printf("PZ=%ZX\n", PZ);
}


/* ------------ calculate the point add----------------- */

BNPoint  BNPoint::Add(BNPoint Q)
{
	this->TestPointOnBNCurve();
	Q.TestPointOnBNCurve();
	BNPoint Point(u, b); // BNPoint is infinite point
	if (this->isInfinite())
	{
		return Q;
	}

	if (Q.isInfinite())
	{
		return *this;
	}

	mpz_t X1, Y1, Z1, X2, Y2, Z2, Z1Z1, Z2Z2, U1, U2, S1, S2, H, I, J, R, V, X3, Y3, Z3;
	mpz_init_set(X1, PX);
	mpz_init_set(Y1, PY);
	mpz_init_set(Z1, PZ);
	mpz_init_set(X2, Q.PX);
	mpz_init_set(Y2, Q.PY);
	mpz_init_set(Z2, Q.PZ);
	mpz_init_set_ui(Z1Z1, 1);
	mpz_init_set_ui(Z2Z2, 1);
	mpz_init_set(U1, X1);
	mpz_init_set(U2, X2);
	mpz_init_set(S1, Y1);
	mpz_init_set(S2, Y2);
	mpz_init(H);
	mpz_init(I);
	mpz_init(J);
	mpz_init(R);
	mpz_init(V);
	mpz_init(X3);
	mpz_init(Y3);
	mpz_init(Z3);
	bool Z1is1 = (mpz_cmp_ui(Z1, 1) == 0);
	bool Z2is1 = (mpz_cmp_ui(Z2, 1) == 0);
	if (!Z1is1)
	{
		mpz_powm_ui(Z1Z1, Z1, 2, p);   //Z1Z1=Z1^2
		mpz_mul(U2, X2, Z1Z1);
		mpz_mod(U2, U2, p);    // U2 = X2*Z1Z1
		mpz_mul(S2, Z1Z1, Z1);
		mpz_mul(S2, S2, Y2);
		mpz_mod(S2, S2, p);   // S2 = Y2*Z1*Z1Z1
	}

	if (!Z2is1)
	{
		mpz_powm_ui(Z2Z2, Z2, 2, p);   //Z2Z2=Z2^2
		mpz_mul(U1, X1, Z2Z2);
		mpz_mod(U1, U1, p);    // U1 = X1*Z2Z2
		mpz_mul(S1, Z2Z2, Z2);
		mpz_mul(S1, S1, Y1);
		mpz_mod(S1, S1, p);   // S1 = Y1*Z2*Z2Z2
	}

	if (mpz_cmp(U1, U2) == 0)
	{
		if (mpz_cmp(S1, S2) == 0)
			return Q.Twice(1);

		else
		{  
			
			return Point;  // BNPoint is infinite point
		}
	}




	mpz_sub(H, U2, U1);  // H = U2-U1
	mpz_mul_ui(I, H, 2);
	mpz_powm_ui(I, I, 2, p);  // I = (2*H)^2
	mpz_mul(J, H, I);  // J = H*I
	mpz_sub(R, S2, S1);
	mpz_mul_ui(R, R, 2);  // R = 2*(S2-S1)
	mpz_mul(V, U1, I);  //V = U1*I
	mpz_mul(X3, R, R);
	mpz_sub(X3, X3, J);
	mpz_submul_ui(X3, V, 2);
	mpz_mod(X3, X3, p);  // X3 = R^2-J-2*V
	mpz_sub(Y3, V, X3);
	mpz_mul(Y3, Y3, R);    //Y3=R*(V-X3)
	mpz_t tmp;
	mpz_init(tmp);
	mpz_mul(tmp, S1, J);
	mpz_mul_ui(tmp, tmp, 2);  //tmp=2 * S1*J
	mpz_sub(Y3, Y3, tmp);
	mpz_mod(Y3, Y3, p);     // Y3 = R*(V-X3)-2*S1*J

	if (Z2is1)
	{
		if (Z1is1)
		{
			mpz_mul_ui(Z3, H, 2);// Z3 = 2*H
			mpz_mod(Z3, Z3, p);
		}
		else
		{
			mpz_mul(Z3, Z1, H);
			mpz_mul_ui(Z3, Z3, 2);
			mpz_mod(Z3, Z3, p);  //Z3=2*Z1*H
		}
	}
	else
	{
		if (Z1is1)
		{
			mpz_mul(Z3, Z2, H);
			mpz_mul_ui(Z3, Z3, 2);
			mpz_mod(Z3, Z3, p);  //Z3=2*Z2*H
		}
		else
		{
			mpz_mul(Z3, Z1, Z2);
			mpz_mul(Z3, Z3, H);
			mpz_mul_ui(Z3, Z3, 2);
			mpz_mod(Z3, Z3, p);//Z3=2*Z1*Z2*H

		}
	}

	Point.BNPointSetCoordinate(X3, Y3, Z3);

	return Point;



}


BNPoint BNPoint::Sub(BNPoint Q)
{
	return this->Add(Q.Neg());
}

BNPoint BNPoint::Neg()
{
	mpz_t tmp;
	mpz_init(tmp);
	mpz_neg(tmp, PY); //tmp=-PY
	mpz_mod(tmp, tmp, p);
	return BNPoint(u, b,PX, tmp, PZ);
}

/*----         get the 2^n*point        --------------*/
BNPoint BNPoint::Twice(int n)
{
	BNPoint Point(u, b);  //Point is infinite point.
	mpz_t A, B, C, S, M, X, Y, Z;
	mpz_init_set(X, PX);
	mpz_init_set(Y, PY);
	mpz_init_set(Z, PZ);
	mpz_init(A);
	mpz_init(B);
	mpz_init(C);
	mpz_init(S);
	mpz_init(M);
	while (n-->0)
	{
		mpz_mul(A, X, X); // A = X1^2 (modular reduction is irrelevant)
		mpz_mul(B, Y, Y);
		mpz_mod(B, B, p);  // B = Y1^2
		mpz_mul(C, B, B);   // C = B^2 (modular reduction is irrelevant)
		mpz_add(S, X, B);
		mpz_mul(S, S, S);
		mpz_sub(S, S, A);
		mpz_sub(S, S, C);
		mpz_mul_ui(S, S, 2);
		mpz_mod(S, S, p); // S = 2*((X+B)^2-A-C)
		mpz_mul_ui(M, A, 3);
		mpz_mod(M, M, p); // M = 3*A
		mpz_mul(X, M, M);
		mpz_submul_ui(X, S, 2);
		mpz_mod(X, X, p); // X3 = M^2-2*S
		mpz_mul(Z, Y, Z);
		mpz_mul_ui(Z, Z, 2);
		mpz_mod(Z, Z, p);  // Z3 = 2*Y1*Z1
		mpz_sub(Y, S, X);
		mpz_mul(Y, Y, M);
		mpz_submul_ui(Y, C, 8);
		mpz_mod(Y, Y, p); // Y3 = M*(S-X3)-8*C



	}

	Point.BNPointSetCoordinate(X, Y, Z);
	return Point;

}



/*-----  get the k*point -----------*/
BNPoint BNPoint::ScalarMul(const mpz_t &k)
{
	
	vector<int> vec = NAF(k);
	BNPoint Q(u,b);   // the Q is infinite point
	BNPoint P(u, b, PX, PY, PZ);
	
	vector<int>::iterator pIter;
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
		P=P.Twice(1);
		

	}
	return Q;
}


void BNPoint::Affine()
{
	if (mpz_cmp_ui(PZ, 1))
	{
		if (!(this->isInfinite()))
		{
			mpz_t tmpx, tmpy;
			mpz_init(tmpx);
			mpz_init(tmpy);
			mpz_mul(tmpx, PZ, PZ);
			mpz_invert(tmpx, tmpx, p);
			mpz_mul(PX, PX, tmpx);
			mpz_mod(PX, PX, p);  //PX/(PZ)^2
			mpz_pow_ui(tmpy, PZ, 3);
			mpz_invert(tmpy, tmpy, p);
			mpz_mul(PY, PY, tmpy);
			mpz_mod(PY, PY, p);  //PY/(PZ)^3
			mpz_set_ui(PZ, 1);  //PZ=1

		}

		else
		{
			this->BNPointSetZero();

		}
	}
}


BNPoint BNPoint::GenerateRandomPoint()
{
	mpz_t x;
	mpz_t y;
	mpz_t temp;
	mpz_init(x);
	mpz_init(y);
	mpz_init(temp);
	gmp_randstate_t st;
	unsigned long tm;
	gmp_randinit_default(st);
	tm = (unsigned long)time(NULL);
	gmp_randseed_ui(st, tm);
	mpz_t b_temp;
	mpz_init_set_si(b_temp, b);  //b_temp=b;
	do
	{
		mpz_urandomm(x, st, p);
		mpz_powm_ui(temp, x, 3, p);
		mpz_add(temp, temp, b_temp);
		mpz_mod(temp, temp, p);
	} while (mpz_legendre(temp,p)==-1);
	mpz_t root;
	mpz_init(root);
	SquareRoot(temp, p, root);
	mpz_set(y, root);
	return BNPoint(u, b, x, y);
	


}


BNPoint& BNPoint::operator=(const BNPoint& st)
{

	if (this == &st)
		return *this;
	mpz_set(PX, st.PX);
	mpz_set(PY, st.PY);
	mpz_set(PZ, st.PZ);
	b = st.b;

	return *this;

}
