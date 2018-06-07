#include"BNField12.h"
#include"BNPoint2.h"
#include"DefineFunction.h"
#include<vector>
#include<iterator>
void BNField12::setBNField12(BNField6 x, BNField6 y)
{
	c0 = x;
	c1 = y;

}

void BNField12::setBNField12(BNField12 x)
{
	c0 = x.c0;
	c1 = x.c1;

}

void BNField12::setOne()
{
	BNField2 A0(u,a0.quadraticExtension), A1(u, a0.quadraticExtension), A2(u, a0.quadraticExtension);
	A0.setOne();
	BNField6 B0(c0.u, c0.b, c0.b_), B1(c0.u, c0.b, c0.b_);
	B0.setBNField6 (A0, A1, A2);
	this->setBNField12(B0, B1);
	
}

/*----Fp12=Fp6[w](w^2-v)-----------*/
BNField12 BNField12::add(BNField12 Field12)
{
	BNField6 b0(c0.u, c0.b, c0.b_), b1(c0.u, c0.b, c0.b_);
	b0 = c0.add(Field12.c0);
	b1 = c1.add(Field12.c1);

	
	return BNField12(c0.u, c0.b, c0.b_, b0, b1);


}



/*----Fp12=Fp6[w](w^2-v)-----------*/
BNField12 BNField12::sub(BNField12 Field12)
{
	BNField6 b0(c0.u, c0.b, c0.b_), b1(c0.u, c0.b, c0.b_);
	b0 = c0.sub(Field12.c0);
	b1 = c1.sub(Field12.c1);

	
	return BNField12(c0.u, c0.b, c0.b_, b0, b1);


}


/*----Fp12=Fp6[w](w^2-v)-----------
  input:A=a0+a1*w  B=b0+b1*w   
     out:  C=c0+c1*w=A*B

*/

BNField12 BNField12::mul(BNField12 Field12)
{
	BNField6 b0(c0.u, c0.b, c0.b_),
		b1(c0.u, c0.b, c0.b_),
		t0(c0.u, c0.b, c0.b_),
		t1(c0.u, c0.b, c0.b_);
	t0 = c0.mul(Field12.c0);  //t0=a0*b0
	t1 = c1.mul(Field12.c1);  //t1=a1*b1
	b0 = t0.add(t1.mulV());  //c0=t0+t1*v
	b1 = c0.add(c1).mul(Field12.c0.add(Field12.c1)).sub(t0).sub(t1); // c1=(a0+a1)*(b0+b1)-t0-t1

	BNField12 Fie(c0.u, c0.b, c0.b_, b0, b1);
	return Fie;


}


/* ----Fp12 = Fp6[w](w ^ 2 - v)---------- 
input:A = a0 + a1*w  
  out : C = c0 + c1*w = A^2

*/

BNField12 BNField12::square()
{
	BNField6 b0(c0.u, c0.b, c0.b_),
		b1(c0.u, c0.b, c0.b_), 
		b2(c0.u, c0.b, c0.b_), 
		b3(c0.u, c0.b, c0.b_);
	b0 = c0.sub(c1);  //c0=a0-a1
	b3 = c0.sub(c1.mulV()); //c3=a0-a1*v
	b2 = c0.mul(c1);    //c2=a0*a1
	b0 = b0.mul(b3).add(b2);  //c0=c0*c3+c2
	b1 = b2.mulConst(2);//c1=2*c2
	b2 = b2.mulV();  //c2=c2*v
	b0 = b0.add(b2);  //c0=c0+c2

	BNField12 Fie(c0.u, c0.b, c0.b_, b0, b1);
	return Fie;


}


bool BNField12::isEqual(const BNField12& st)
{
	return c0.isEqual(st.c0) && c1.isEqual(st.c1);


}

/*---       get  A^k     */
BNField12 BNField12::exp(const mpz_t  &k)
{
	BNField12 A(c0.u, c0.b, c0.b_), C(c0.u, c0.b, c0.b_);
	A = *this;
	C.setOne();  // set C is unit . 
	vector<int> vec = NAF(k);
	vector<int>::iterator Iter = vec.begin();
	for (; Iter != vec.end(); Iter++)
	{
		if (*Iter == 1)
		{
			C = C.mul(A);
		}
		else if (*Iter == -1)
			C = C.mul(A.Inverse());   

		A = A.square();


	}
	return C;

}
 

//-------------- conjugation ------------
BNField12 BNField12::conjugation()
{
	return BNField12(c0.u, c0.b, c0.b_,c0,c1.neg());

}

BNField12 BNField12::Inverse()
{
	BNField6 t0(c0.u, c0.b, c0.b_), 
		t1(c0.u, c0.b, c0.b_), 
		b0(c0.u, c0.b, c0.b_), 
		b1(c0.u, c0.b, c0.b_);
	t0 = c0.square();
	t1 = c1.square();
	t0 = t0.sub(t1.mulV());
	t1 = t0.Inverse();
	b0 = c0.mul(t1);
	b1 = c1.mul(t1).neg();
	return BNField12(c0.u, c0.b, c0.b_, b0, b1);


}


//--------------------only using in final exponentiation-----------------
BNField12 BNField12::Exponentiation(const mpz_t& k)
{
	BNField12 A(c0.u, c0.b, c0.b_), C(c0.u, c0.b, c0.b_);
	A = *this;
	C.setOne();  // set C is unit . 
	vector<int> vec = NAF(k);
	vector<int>::iterator Iter = vec.begin();
	for (; Iter != vec.end(); Iter++)
	{
		if (*Iter == 1)
		{
			C = C.mul(A);
		}
		else if (*Iter == -1)
			C = C.mul(A.conjugation());   //beacause m.conjuation=m.Inverse;

		A = A.square();


	}
	return C;


}

//----------------Frobenius Map raise to p------------------------
BNField12 BNField12::frobeniusMapP()
{
	BNField2 t1(u,a0.quadraticExtension),
		t2(u,a0.quadraticExtension),
		t3(u,a0.quadraticExtension),
		t4(u,a0.quadraticExtension), 
		t5(u,a0.quadraticExtension), 
		t6(u,a0.quadraticExtension);
	t1 = c0.a0.conjugate();
	t2 = c1.a0.conjugate();
	t3 = c0.a1.conjugate();
	t4 = c1.a1.conjugate();
	t5 = c0.a2.conjugate();
	t6 = c1.a2.conjugate();
	mpz_t p_1_6;
	mpz_init(p_1_6);
	mpz_sub_ui(p_1_6, p, 1);//p_1_6=p-1
	mpz_cdiv_q_ui(p_1_6, p_1_6, 6);//p_1_6=(p-1)/6
	BNField2 tmp(u,a0.quadraticExtension),kesei(u,Yemoseilong.re,Yemoseilong.im,a0.quadraticExtension);  //kesei=Yemoseilong
	tmp = kesei.exp(p_1_6); //tmp=(i+1)^((p-1)/6)
	BNField2 r1(u,a0.quadraticExtension), 
		r2(u,a0.quadraticExtension), 
		r3(u,a0.quadraticExtension), 
		r4(u,a0.quadraticExtension),
		r5(u,a0.quadraticExtension);
	r1 = tmp;
	r2 = r1.mul(tmp);
	r3 = r2.mul(tmp);
	r4 = r3.mul(tmp);
	r5 = r4.mul(tmp);

	t2 = t2.mul(r1);
	t3 = t3.mul(r2);
	t4 = t4.mul(r3);
	t5 = t5.mul(r4);
	t6 = t6.mul(r5);
	BNField6 L0(u, b,b_,t1, t3, t5), L1(u,b,b_, t2, t4, t6);
	return BNField12(u, b,b_,L0, L1);


}




//----------------Frobenius Map raise to p2------------------------
BNField12 BNField12::frobeniusMapP2()
{
	
	BNField2 t1(u,a0.quadraticExtension), 
		t2(u,a0.quadraticExtension), 
		t3(u,a0.quadraticExtension), 
		t4(u,a0.quadraticExtension),
		t5(u,a0.quadraticExtension), 
		t6(u,a0.quadraticExtension);
	mpz_t p_1_6;
	mpz_init(p_1_6);
	mpz_sub_ui(p_1_6, p, 1);//p_1_6=p-1
	mpz_cdiv_q_ui(p_1_6, p_1_6, 6);//p_1_6=(p-1)/6
	BNField2 tmp(u,a0.quadraticExtension), kesei(u, Yemoseilong.re, Yemoseilong.im,a0.quadraticExtension);  //kesei=Yemoseilong
	tmp = kesei.exp(p_1_6); //tmp=(i+1)^((p-1)/6)
	BNField2 r1_1(u,a0.quadraticExtension), 
		r1_2(u,a0.quadraticExtension),
		r1_3(u,a0.quadraticExtension),
		r1_4(u,a0.quadraticExtension),
		r1_5(u,a0.quadraticExtension), 
		r2_1(u,a0.quadraticExtension), 
		r2_2(u,a0.quadraticExtension),
		r2_3(u,a0.quadraticExtension), 
		r2_4(u,a0.quadraticExtension), 
		r2_5(u,a0.quadraticExtension);
	r1_1 = tmp;
	r1_2 = r1_1.mul(tmp);
	r1_3 = r1_2.mul(tmp);
	r1_4 = r1_3.mul(tmp);
	r1_5 = r1_4.mul(tmp);
	r2_1 = r1_1.mul(r1_1.conjugate());
	r2_2 = r1_2.mul(r1_2.conjugate());
	r2_3 = r1_3.mul(r1_3.conjugate());
	r2_4 = r1_4.mul(r1_4.conjugate());
	r2_5 = r1_5.mul(r1_5.conjugate());
	t1 = c0.a0;
	t2 = c1.a0.mul(r2_1);
	t3 = c0.a1.mul(r2_2);
	t4 = c1.a1.mul(r2_3);
	t5 = c0.a2.mul(r2_4);
	t6 = c1.a2.mul(r2_5);
	BNField6 L0(u, b,b_,t1, t3, t5), L1(u,b,b_, t2, t4, t6);
	return BNField12(u,b,b_, L0, L1);
	
	

}

//----------------Frobenius Map raise to p3------------------------
BNField12 BNField12::frobeniusMapP3()
{
	return this->frobeniusMapP().frobeniusMapP2();

}


BNField12& BNField12::operator=(const BNField12& st)
{
	if (this == &st)
		return *this;
	c0 = st.c0;
	c1 = st.c1;
	return *this;

}
void BNField12::BNField12Show()
{
	gmp_printf("f.c0.a0.re=%ZX\n", c0.a0.re);
	gmp_printf("f.c0.a0.im=%ZX\n", c0.a0.im);
	gmp_printf("f.c1.a0.re=%ZX\n", c1.a0.re);
	gmp_printf("f.c1.a0.im=%ZX\n", c1.a0.im);
	gmp_printf("f.c0.a1.re=%ZX\n", c0.a1.re);
	gmp_printf("f.c0.a1.im=%ZX\n", c0.a1.im);
	gmp_printf("f.c1.a1.re=%ZX\n", c1.a1.re);
	gmp_printf("f.c1.a1.im=%ZX\n", c1.a1.im);
	gmp_printf("f.c0.a2.re=%ZX\n", c0.a2.re);
	gmp_printf("f.c0.a2.im=%ZX\n", c0.a2.im);
	gmp_printf("f.c1.a2.re=%ZX\n", c1.a2.re);
	gmp_printf("f.c1.a2.im=%ZX\n", c1.a2.im);
	printf("\n");


}

BNField12 BNField12::finalExp()
{
	BNField12 m(u,b,b_), 
	    mt(u, b, b_),
		mt2(u, b, b_),
		mt3(u, b, b_),
		mp(u, b, b_),
		mp2(u, b, b_),
		mp3(u, b, b_),
		f(u, b, b_);
	BNField12 y0(u, b, b_),
		y1(u, b, b_),
		y2(u, b, b_),
		y3(u, b, b_),
		y4(u, b, b_),
		y5(u, b, b_),
		y6(u, b, b_),
		t0(u, b, b_),
		t1(u, b, b_);
	m = this->conjugation().mul(this->Inverse());  //m=f^(p6-1)=f.conjugation*f^(-1)
	m = m.frobeniusMapP2().mul(m);// m=m^(p2+1) 

	
	
	mp = m.frobeniusMapP();     //mp=m^p
	mp2 = m.frobeniusMapP2();    //mp=m^p2
	mp3 = m.frobeniusMapP3();     //mp=m^p3
	mt = m.Exponentiation(u);          //mt=m^t
	mt2 = mt.Exponentiation(u);        //mt2=m^t2
	mt3 = mt2.Exponentiation(u);        //mt3=m^t3
	y0 = mp.mul(mp2).mul(mp3);   //y0=m^p * m^p2 * m^p3
	y1 = m.conjugation();           //y1=m^(-1)
	y2 = mt2.frobeniusMapP2();          //y2=m^t2p2
	y3 = mt.frobeniusMapP().conjugation();  //y3=m^(-tp)               
	y4 = mt.conjugation().mul(mt2.frobeniusMapP().conjugation());  //y4=m^(-t)  *m^(-t2p)      
	y5 = mt2.conjugation();    //y5=m^(-t2)
	y6 = mt3.conjugation().mul(mt3.frobeniusMapP().conjugation());  //y6=m^(-t3) *m^(-t3p)
	t0 = y6.square();
	t0 = t0.mul(y4);
	t0 = t0.mul(y5);
	t1 = y3.mul(y5);
	t1 = t1.mul(t0);
	t0 = t0.mul(y2);
	t1 = t1.square();
	t1 = t1.mul(t0);
	t1 = t1.square();
	t0 = t1.mul(y1);
	t1 = t1.mul(y0);
	t0 = t0.square();
	f=  t0.mul(t1); 
	return f;

}
