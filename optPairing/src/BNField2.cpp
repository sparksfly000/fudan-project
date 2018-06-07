#include"BNField2.h"
#include"BNParams.h"
#include"gmp.h"
#include"BNPoint2.h"
#include"DefineFunction.h"

void BNField2::setBNField2(BNField2 Field2)
{
	setBNField2Coordinate(Field2.re, Field2.im);

}

/*---  test is zero---------*/
bool BNField2::isZero()
{
	return mpz_cmp_ui(re, 0) == 0 && mpz_cmp_ui(im, 0) == 0;
}


/*---  test is one---------*/
bool BNField2::isOne()
{
	return mpz_cmp_ui(re, 1) == 0 && mpz_cmp_ui(im, 0) == 0;
}


/*---  test is equal---------*/
bool BNField2::isEqual(const BNField2& Field2)
{
	return mpz_cmp(re, Field2.re) == 0 && mpz_cmp(im, Field2.im) == 0;
}

/*---  set  one---------*/
void BNField2::setOne()
{
	//this->setBNField2Coordinate(1, 0);
	mpz_set_ui(re, 1);
	mpz_set_ui(im, 0);


}


BNField2 BNField2::add(BNField2 Field2)
{
	
	mpz_t X0, X1;
	mpz_init(X0);
	mpz_init(X1);
	mpz_add(X0, Field2.re, re);
	mpz_mod(X0, X0, p);
	mpz_add(X1, Field2.im, im);
	mpz_mod(X1, X1, p);
	BNField2 Field2Add(u, X0, X1,quadraticExtension);
	return Field2Add;

}

BNField2 BNField2::sub(BNField2 Field2)
{

	mpz_t X0, X1;
	mpz_init(X0);
	mpz_init(X1);
	mpz_sub(X0, re, Field2.re );
	mpz_mod(X0, X0, p);
	mpz_sub(X1, im,Field2.im);
	mpz_mod(X1, X1, p);
	BNField2 Field2Sub(u, X0, X1,quadraticExtension);
	return Field2Sub;

}

BNField2 BNField2::mul(BNField2 Field2)
{
	mpz_t X0;
	mpz_t X1;
	mpz_t tmp;
	mpz_init(tmp);
	mpz_init(X0);
	mpz_init(X1);
	mpz_mul(X0, re, Field2.re);
	mpz_mul(tmp, im, Field2.im); //tmp=im*im
	mpz_mul_si(tmp, tmp, quadraticExtension);
	mpz_add(X0, X0, tmp);   //X0=re*re+im*im*quadraticExtension
	mpz_mod(X0, X0, p);
	mpz_mul(X1, re, Field2.im);
	mpz_addmul(X1, im, Field2.re);  //X1=re*im+im*re;
	mpz_mod(X1, X1, p);
	BNField2 Field2MUL(u, X0, X1,quadraticExtension);
	return Field2MUL;


}

BNField2 BNField2::square()
{  
	mpz_t X0;
	mpz_t X1;
	mpz_t tmp;
	mpz_init(tmp);
	mpz_init(X0);
	mpz_init(X1);
	mpz_mul(X0, re, re);
	mpz_mul(tmp, im, im); //tmp=im*im
	mpz_mul_si(tmp, tmp, quadraticExtension);
	mpz_add(X0, X0, tmp);   //X0=re*re+im*im*quadraticExtension
	mpz_mod(X0, X0, p);
	mpz_mul(X1, re,im);
	mpz_mul_ui(X1, X1, 2);  //X1=2*re*im;
	mpz_mod(X1, X1, p);
	BNField2 Field2Square(u,X0,X1,quadraticExtension);
	return Field2Square;


}

BNField2 BNField2::twice(int n)
{
	mpz_t X0;
	mpz_t X1;
	mpz_init_set(X0,re);
	mpz_init_set(X1,im);

	while (n-- > 0)
	{
		mpz_mul_ui(X0, X0, 2);   //X0=2*X0
		mpz_mod(X0, X0, p);
		mpz_mul_ui(X1, X1, 2);  //X1=2*X1;
		mpz_mod(X1, X1, p);
	}
	BNField2 Field2(u, X0, X1,quadraticExtension);
	return Field2;


}

BNField2 BNField2::mulConst(int a)
{
	mpz_t X0;
	mpz_t X1;
	mpz_init(X0);
	mpz_init(X1);
	mpz_mul_ui(X0, re, a);
	mpz_mod(X0, X0, p);
	mpz_mul_ui(X1, im, a);
	mpz_mod(X1, X1, p);
	BNField2 Field2(u, X0, X1,quadraticExtension);
	return Field2;



}

BNField2 BNField2::mulConst(mpz_t a)
{
	mpz_t X0;
	mpz_t X1;
	mpz_init(X0);
	mpz_init(X1);
	mpz_mul(X0, re, a);
	mpz_mod(X0, X0, p);
	mpz_mul(X1, im, a);
	mpz_mod(X1, X1, p);
	BNField2 Field2(u, X0, X1,quadraticExtension);
	return Field2;



}


/*-----     multiply  i      */
BNField2 BNField2::mulI()
{
	mpz_t X0;
	mpz_init_set(X0, im);
	mpz_neg(X0, X0);
	mpz_mod(X0, X0, p);
	BNField2 Field2(u,X0 ,re,quadraticExtension); // (x+yi)*i=-y+x*i
	return Field2;



}

/*-----     multiply  1+i      */
BNField2 BNField2::mulI_1()
{
	BNField2 Fie(u, 1, 1,quadraticExtension);  //1+i
	return (*this).mul(Fie);

}
/*-----     devide  1+i      */
BNField2 BNField2::divI_1()
{
	BNField2 Fie(u, 1, 1,quadraticExtension);//1+i
	Fie = Fie.Inverse();//(1+i)^(-1)
	return (*this).mul(Fie);

}


BNField2 BNField2::exp( mpz_t k)
{
	BNField2 A(u,quadraticExtension), C(u,quadraticExtension);
	A = *this;
	C.setOne();  // set C is unit . 
	std::vector<int> vec = BaseConvert(k, 2);
	std::vector<int>::iterator Iter = vec.begin();
	for (; Iter != vec.end(); Iter++)
	{
		if (*Iter)
		{
			C = C.mul(A);
		}
		A = A.square();


	}
	return C;

}
/* -----          -re-im*i       --------------         */
BNField2 BNField2::neg()
{
	mpz_t x0, y0;
	mpz_init(x0);
	mpz_init(y0);
	mpz_neg(x0, re);
	mpz_neg(y0, im);
	mpz_mod(x0, x0, p);
	mpz_mod(y0, y0, p);
	BNField2 Fie(u, x0, y0,quadraticExtension);
	return Fie;

}

/*----   re-im*i        ---------------*/
BNField2 BNField2::conjugate()
{
	mpz_t y0;
	mpz_init(y0);
	mpz_neg(y0, im);
	mpz_mod(y0, y0, p);
	BNField2 Fie(u, re, y0,quadraticExtension);
    return Fie;


}


/*------        1/(re+im*i)        ----------- */
BNField2 BNField2::Inverse()
{
	mpz_t t0, t1, c0, c1,tmp;
	mpz_init(t0);
	mpz_init(t1);
	mpz_init(c0);
	mpz_init(c1);
	mpz_init(tmp);
	mpz_pow_ui(t0, re, 2);//t0=a0^2
	mpz_pow_ui(t1, im, 2); //t1=a1^2
	mpz_mul_si(tmp, t1, quadraticExtension);
	mpz_sub(t0, t0, tmp);// t0=t0-t1*quadraticExtension
	mpz_mod(t0, t0, p);
	mpz_invert(t1, t0, p); //t1 = t0^(-1)
	mpz_mul(c0, re, t1);
	mpz_mod(c0, c0, p); //c0=a0*t1
	mpz_mul(c1, im, t1);
	mpz_neg(c1, c1);
	mpz_mod(c1, c1, p);//c1=-a1*t1

	BNField2 Fie(u, c0, c1,quadraticExtension);
	return Fie;

}


BNField2 BNField2::SquareRoot()
{
	
	mpz_t p2,t;
	mpz_init(p2);
	mpz_init(t);
	mpz_mul(p2, p, p);
	mpz_sub_ui(p2, p2, 1);   //p2=p^2-1
	mpz_t temp;
	mpz_init(temp);
	mpz_fdiv_q_ui(temp, p2, 2);
	if (!this->exp(temp).isOne())
	{
	
		printf(" the BNField2 is non-residue\n");
		throw "the BNField2 is non-residue";
	}

	int s = mpz_scan1(p2, 0);  //p^2-1=2^s*t   t is odd;
	
	mpz_cdiv_q_2exp(t, p2, s);  //p^2-1=2^s*t   t is odd;
	BNField2 b(u,quadraticExtension);
	gmp_randstate_t st;
	gmp_randinit_default(st);
	mpz_t p2_2;
	mpz_init(p2_2);
	mpz_mul(p2_2, p, p);
	mpz_sub_ui(p2_2, p2_2, 1);
	mpz_cdiv_q_ui(p2_2, p2_2, 2);//p2_2=(p^2-1)/2
	do
	{
		mpz_urandomm(b.re, st, p);  //get a number between  0-(p-1)
		mpz_urandomm(b.im, st, p);

	} while (b.exp(p2_2).isOne());    // b is non_residue
	BNField2 c(u,quadraticExtension), r(u,quadraticExtension), a(u,re,im,quadraticExtension),h(u,quadraticExtension),d(u,quadraticExtension);
	c = b.exp(t);  //c=b^t
	r = a.exp(t);//r=a^t
	h.setOne();  //h = 1;
	c = c.Inverse();//c=c^£¨-1£©
	mpz_t e;
	mpz_init(e);
	for (int i = 1; i <= s - 1; i++)
	{
		mpz_ui_pow_ui(e, 2, s - 1 - i);
		d = r.exp(e); //d=r^(2^(s-i-1))
		if (!d.isOne())  //if d!=1
		{
			h = h.mul(c);
			r = r.mul(c.square());

		}
		c = c.square();
	
	}

	mpz_t t_1_2;
	mpz_init(t_1_2);
	mpz_add_ui(t_1_2, t, 1);
	mpz_cdiv_q_ui(t_1_2, t_1_2, 2); //t_1_2=(t+1)/2
	return a.exp(t_1_2).mul(h);  //return a^((t+1)/2)*h
}

BNField2& BNField2::operator=(const BNField2& st)
{
	if (this == &st)
		return *this;
	mpz_set(re, st.re);
	mpz_set(im, st.im);
	quadraticExtension = st.quadraticExtension;
	return *this;


}

void BNField2::BNField2Show()
{
	gmp_printf("re=%Zd\n", re);
	gmp_printf("im=%Zd\n", im);
}