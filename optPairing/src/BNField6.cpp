#include"gmp.h"
#include"BNField6.h"
#include"BNPoint2.h"
#include"DefineFunction.h"

void BNField6::setBNField6(BNField2 x, BNField2 y, BNField2 z)
{
	a0.setBNField2(x);
	a1.setBNField2(y);
	a2.setBNField2(z);

}
 
void BNField6::setBNField6(BNField6 x)
{
	a0.setBNField2(x.a0);
	a1.setBNField2(x.a1);
	a2.setBNField2(x.a2);

}

void BNField6::setOne()
{
	a0.setBNField2Coordinate(1, 0);
	a1.setBNField2Coordinate(0, 0);
	a2.setBNField2Coordinate(0, 0);

}

bool BNField6::isEqual(const BNField6 &st)
{
	return a0.isEqual(st.a0) && a1.isEqual(st.a1) && a2.isEqual(st.a2);
}




BNField6 BNField6::add(BNField6 Field6)
{
	BNField2 b0(u,b_.quadraticExtension), b1(u,b_.quadraticExtension), b2(u,b_.quadraticExtension);
	b0 = a0.add(Field6.a0);
	b1 = a1.add(Field6.a1);
	b2 = a2.add(Field6.a2);
	
	return BNField6(u, b, b_, b0, b1, b2);

}



BNField6 BNField6::sub(BNField6 Field6)
{
	BNField2 b0(u,b_.quadraticExtension), b1(u,b_.quadraticExtension), b2(u,b_.quadraticExtension);
	b0 = a0.sub(Field6.a0);
	b1 = a1.sub(Field6.a1);
	b2 = a2.sub(Field6.a2);

	return 	BNField6(u, b, b_, b0, b1, b2);

}

BNField6 BNField6::neg()
{
	return BNField6(u, b, b_, a0.neg(), a1.neg(), a2.neg());


}

/*----- Fp6=Fp2[v](v^3-i)  ---------*/
BNField6 BNField6::mul(BNField6 Field6)
{
	BNField2 c0(u,b_.quadraticExtension), c1(u,b_.quadraticExtension), c2(u,b_.quadraticExtension),t0(u,b_.quadraticExtension),t1(u,b_.quadraticExtension),t2(u,b_.quadraticExtension);
	t0 = a0.mul(Field6.a0); //t0=a0*b0
	t1 = a1.mul(Field6.a1); //t1=a1*b1
	t2 = a2.mul(Field6.a2);  //t2=a2*b2
	c0 = a1.add(a2).mul(Field6.a1.add(Field6.a2)).sub(t1).sub(t2).mul(Yemoseilong).add(t0);  //c0=[(a1+a2)*(b1+b2)-t1-t2]*¦Î+t0
	c1 = a0.add(a1).mul(Field6.a0.add(Field6.a1)).sub(t0).sub(t1).add(t2.mul(Yemoseilong)); //c1=(a0+a1)*(b0+b1)-t0-t1+¦Î*t2
	c2 = a0.add(a2).mul(Field6.a0.add(Field6.a2)).sub(t0).sub(t2).add(t1);//c2=(a0+a2)*(b0+b2)-t0-t2+t1
	
	return BNField6(u, b, b_, c0, c1, c2);


}
/*----- Fp6=Fp2[v](v^3-i)  ---------*/
BNField6 BNField6::square()
{
	BNField2 c0(u,b_.quadraticExtension), c1(u,b_.quadraticExtension), c2(u,b_.quadraticExtension), c3(u,b_.quadraticExtension), c4(u,b_.quadraticExtension), c5(u,b_.quadraticExtension);
	c4 = a0.mul(a1).mulConst(2);  //c4=2(a0*a1)
	c5 = a2.square();    //c5=a2^2
	c1 = c5.mul(Yemoseilong).add(c4);  //c1=a5*¦Î+c4
	c2 = c4.sub(c5);//c2=c4-c5
	c3 = a0.square();//c3=a0^2
	c4 = a0.sub(a1).add(a2);//c4=a0-a1+a2
	c5 = a1.mul(a2).mulConst(2); //c5=2(a1*a2)
	c4 = c4.square(); //c4=c4^2
	c0 = c5.mul(Yemoseilong).add(c3);  //c0=c5*¦Î+c3
	c2 = c2.add(c4).add(c5).sub(c3); //c2=c2+c4+c5-c3
	return BNField6(u, b, b_, c0, c1, c2);


}

/*----- Fp6=Fp2[v](v^3-i)  ---------*/
BNField6 BNField6::mulV()
{
	BNField2 c0(u,b_.quadraticExtension);
	c0 = a2.mul(Yemoseilong); // c0=a2*(i+1)
	BNField6 Fie(u, b, b_, c0, a0, a1);
	return BNField6(u, b, b_, c0, a0, a1);

};

BNField6 BNField6::mulConst(int n)
{
	BNField2 b0(u,b_.quadraticExtension), b1(u,b_.quadraticExtension), b2(u,b_.quadraticExtension);
	b0 = a0.mulConst(n);
	b1 = a1.mulConst(n);
	b2 = a2.mulConst(n);
	
	return BNField6(u, b, b_, b0, b1, b2);



};

BNField6 BNField6::mulConst(mpz_t n)
{
	BNField2 b0(u,b_.quadraticExtension), b1(u,b_.quadraticExtension), b2(u,b_.quadraticExtension);
	b0 = a0.mulConst(n);
	b1 = a1.mulConst(n);
	b2 = a2.mulConst(n);
	
	return BNField6(u, b, b_, b0, b1, b2);



};

/*----get A^k */
BNField6 BNField6::exp(mpz_t k)
{
	BNField6 A(u, b, b_), C(u, b, b_);
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

//-----------------------kesei=1+i--------------------
BNField6 BNField6::Inverse()
{
	BNField2 t0(u,b_.quadraticExtension), t1(u,b_.quadraticExtension), t2(u,b_.quadraticExtension), t3(u,b_.quadraticExtension), t4(u,b_.quadraticExtension), t5(u,b_.quadraticExtension), t6(u,b_.quadraticExtension),c0(u,b_.quadraticExtension),c1(u,b_.quadraticExtension),c2(u,b_.quadraticExtension);
	t0 = a0.square();//t0=a0^2
	t1 = a1.square();
	t2 = a2.square();
	t3 = a0.mul(a1);
	t4 = a0.mul(a2);
	t5 = a2.mul(a1);
	c0 = t0.sub(t5.mul(Yemoseilong));
	c1 = t2.mul(Yemoseilong).sub(t3);
	c2 = t1.sub(t4);
	t6 = a0.mul(c0);
	t6 = t6.add(a2.mul(c1).mul(Yemoseilong));
	t6 = t6.add(a1.mul(c2).mul(Yemoseilong));
	t6 = t6.Inverse();
	c0 = c0.mul(t6);
	c1 = c1.mul(t6);
	c2 = c2.mul(t6);

	return BNField6(u, b, b_, c0, c1, c2);




}

BNField6& BNField6::operator=(const BNField6& st)
{
	if (this == &st)
	   return *this;
	a0 = st.a0;
	a1 = st.a1;
	a2 = st.a2;
	b_ = st.b_;
	Yemoseilong = st.Yemoseilong;
	b = st.b;
	return *this;


}

void BNField6::BNField6Show()
{
	gmp_printf("a0.re=%Zd\n", a0.re);
	gmp_printf("a0.im=%Zd\n", a0.im); 
	gmp_printf("a1.re=%Zd\n", a1.re);
	gmp_printf("a1.im=%Zd\n", a1.im);
	gmp_printf("a2.re=%Zd\n", a2.re);
	gmp_printf("a2.im=%Zd\n", a2.im);


}

