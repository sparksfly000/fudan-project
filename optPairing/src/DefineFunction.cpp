#include"DefineFunction.h"
#include"BNPairing.h"
#include<ctime>

bool isOdd(mpz_t k)
{
	if (mpz_scan1(k, 0) == 0)
		return true;
	else return false;

}
bool isEven(mpz_t k)
{
	return !isOdd(k);
}

//------------------------NAF-------------------------------
vector<int> NAF(const mpz_t& x)
{
	bool isOdd(mpz_t k);
	mpz_t k, r, tmp;
	mpz_init(r);
	mpz_init(tmp);
	mpz_init_set(k, x);
	vector<int>vec;
	int ki;
	while (mpz_cmp_ui(k, 0))  //while x!=0
	{
		if (isOdd(k))
		{
			ki = 2 - mpz_fdiv_r_ui(r, k, 4);
			vec.push_back(ki); //ki=2-(k mod 4)
			mpz_set_si(tmp, ki);
			mpz_sub(k, k, tmp);  //k=k-ki

		}
		else
			vec.push_back(0);
		mpz_fdiv_q_ui(k, k, 2);  //k=k/2
	}
	return vec;   //from lsb to msb

}


/*------------        convert base--------------  */
vector<int>BaseConvert(mpz_t x, int base)
{
	mpz_t q, n;
	int r;
	mpz_init_set(n, x);
	mpz_init(q);
	vector<int> vec;
	do
	{
		mpz_fdiv_q_ui(q, n, base);
		r = mpz_fdiv_ui(n, base);
		mpz_set(n, q);
		vec.push_back(r);

	} while (mpz_cmp_ui(q, 0) != 0); 
	return vec; //from lsb to msb
}


//--------------------------------------------------
bool TestIsOdd(const char *ch)
{
	mpz_t t;
	mpz_init_set_str(t, ch, BASE);
	return isOdd(t);


}

//-----------result is the a^(0.5)
void  SquareRoot(mpz_t a, mpz_t mod,mpz_t &result)
{
	if (mpz_legendre(a, mod) == -1)
	{
		printf("the a is non residue!!!!\n");
		throw " the a is non residue!!!!";
	}
	mpz_t q, t;
	mpz_init(q);
	mpz_init(t);
	mpz_sub_ui(q, mod, 1);   //q=mod-1
	int s = mpz_scan1(q, 0);  //q-1=2^s*t   t is odd;
    mpz_cdiv_q_2exp(t, q, s);  //q-1=2^s*t   t is odd;
	mpz_t b;
	mpz_init(b);
	gmp_randstate_t st;
	gmp_randinit_default(st);
	do
	{
		mpz_urandomm(b,st, mod);

	} while (mpz_legendre(b,mod)!=-1);  //b is non_residue
	mpz_t c;
	mpz_t r;
	mpz_init(c);
	mpz_init(r);
	mpz_powm(c, b, t, mod); //c=b^t
	mpz_powm(r, a, t, mod);//r=a^t
	mpz_t h,d,tmp;
	mpz_init_set_ui(h,1); //h=1
	mpz_init(d);
	mpz_init(tmp);
	mpz_invert(c, c, mod); //c=c^-1
	for (int i = 1; i < s; i++)
	{
		mpz_init(d);
		mpz_ui_pow_ui(d, 2, s - i - 1);  //2^(s-i-1)
		mpz_powm(d, r, d, mod);
		if (mpz_cmp_ui(d, 1) != 0)
		{
			mpz_mul(h, h, c);//h=h*c
			mpz_mul(tmp, c, c);//tmp=c*c
			mpz_mul(r, r, tmp);//r=r*c^2
		}
		mpz_mul(c, c, c);//c=c^2
		mpz_clear(d);
	}
	mpz_add_ui(tmp, t, 1);
	mpz_cdiv_q_ui(tmp, tmp, 2);
	mpz_powm(tmp, a, tmp, mod);
	mpz_mul(tmp, tmp, h);
	mpz_mod(tmp, tmp, mod);
	mpz_set(result, tmp);


}






BNParams GenerateBNParams(int m)
{
	//------------------generate-----p and n is prime-------------------------
	int bits = m / 4;
	gmp_randstate_t st;
	unsigned long tm;
	tm = (unsigned long)time(NULL);
	gmp_randinit_default(st);
	gmp_randseed_ui(st, tm);
	mpz_t u, Refrence;
	mpz_init(u);
	mpz_init(Refrence);
	mpz_ui_pow_ui(Refrence, 2, bits);
	mpz_t p, n;
	mpz_t temp;
	mpz_init(p);
	mpz_init(n);
	mpz_init(temp);
	do
	{
		do
		{
			mpz_urandomb(u, st, bits + 1);

		} while (mpz_cmp(u, Refrence) < 0);
		
		
		
		mpz_pow_ui(p, u, 4);//p=u^4
		mpz_mul_ui(p, p, 36); //p=36*u^4
		mpz_pow_ui(temp, u, 3);//temp=u^3
		mpz_mul_ui(temp, temp, 36); //temp=36*u^3
		mpz_add(p, p, temp);//p=36*u^4+36*u^3
		mpz_pow_ui(temp, u, 2); //temp=u^2
		mpz_mul_ui(temp, temp, 24); //temp=24*u^2
		mpz_add(p, p, temp);//p=36*u^4+36*u^3+24*u^2
		mpz_mul_ui(temp, u, 6);//temp=6*u
		mpz_add(p, p, temp);//p=36*u^4+36*u^3+24*u^2+6*u
		mpz_add_ui(p, p, 1); //p=36*u^4+36*u^3+24*u^2+6*u+1

		mpz_set(temp, u);
		mpz_pow_ui(temp, temp, 2);
		mpz_mul_ui(temp, temp, 6);  //temp=6u^2;
		mpz_sub(n, p, temp);//  n=p-6u^2
	} while (mpz_probab_prime_p(p, 25) ==0  || mpz_probab_prime_p(n, 25) == 0||mpz_fdiv_q_ui(temp,p,4)!=3);
	return BNParams(u);
	
}

bool isQuadraticResidue(const int &x, const mpz_t &mod)
{
	mpz_t a;
	mpz_init_set_si(a, x);
	if (mpz_legendre(a, mod) == -1)
		return false;
	else 
		return true;

}

bool isQuadraticResidue(const mpz_t &a, const mpz_t &mod)
{
	if (mpz_legendre(a, mod) == -1)
		return false;
	else
		return true;

}
bool isQuadraticResidue(BNField2 &a)
{
	mpz_t p2_1_2;
	mpz_init(p2_1_2);
	mpz_mul(p2_1_2, a.p, a.p);//p_1_2=p*p
	mpz_sub_ui(p2_1_2, p2_1_2, 1); //p_1_2=p*p-1
	mpz_fdiv_q_ui(p2_1_2, p2_1_2, 2); //p_1_2=(p*p-1)/2
	if (a.exp(p2_1_2).isOne())
	{
		return true;
	}
	else
	{
		return false;
	}

}
bool isCubicResidue(const int &x, const mpz_t &mod)
{
	mpz_t p_1_3;
	mpz_init(p_1_3);
	mpz_sub_ui(p_1_3, mod, 1);//p_1_3=mod-1
	mpz_fdiv_q_ui(p_1_3, p_1_3, 3);//p_1_3=(mod-1)/3
	mpz_t a;
	mpz_init_set_si(a, x);
	mpz_powm(a,a, p_1_3, mod);
	if (mpz_cmp_ui(a, 1) == 0)
	{
		return true;
	}
	else
		return false;
}

bool isCubicResidue(const mpz_t &a, const mpz_t &mod)
{
	mpz_t p_1_3;
	mpz_init(p_1_3);
	mpz_sub_ui(p_1_3, mod, 1);//p_1_3=mod-1
	mpz_fdiv_q_ui(p_1_3, p_1_3, 3);//p_1_3=(mod-1)/3
	mpz_powm(p_1_3, a, p_1_3, mod);
	if (mpz_cmp_ui(p_1_3, 1) == 0)
	{
		return true;
	}
	else
		return false;
}

bool isCubicResidue(BNField2 &a)
{
	mpz_t p2_1_3;
	mpz_init(p2_1_3);
	mpz_mul(p2_1_3, a.p, a.p);//p_1_2=p*p
	mpz_sub_ui(p2_1_3, p2_1_3, 1); //p_1_2=p*p-1
	mpz_fdiv_q_ui(p2_1_3, p2_1_3, 3); //p_1_2=(p*p-1)/2
	if (a.exp(p2_1_3).isOne())
	{
		return true;
	}
	else
	{
		return false;
	}

}

BNPoint GenerateBNPoint(BNParams &st)
{
	BNPoint point1(st, 2);
	int b = 1;
	bool flag;
	do
	{
		flag = true;
		b++;
		while (isQuadraticResidue(b, st.p) || isCubicResidue(b, st.p))
		{
			b++;

		}
		point1.Resetb(b);
		point1 = point1.GenerateRandomPoint();
		try{
			point1.TestPointOrderIsN();
		}
		catch (const char*)
		{
			flag = false;
		}
	} while (!flag);  //get the right point1 and b
	point1.Affine();
	return point1;
}
BNPoint2 GenerateBNPoint2(BNPoint &point1)
{
	
	BNField2 para(point1.u, 1, 1, -1);  // first ---Yemoseilong=(1,1)
	BNPoint2 point2(point1.u, point1.b, para,1);  //  mode=1
	gmp_randstate_t ST;
	gmp_randinit_default(ST);
	unsigned long tm;
	tm = (unsigned long)time(NULL);
	gmp_randseed_ui(ST, tm);
	mpz_t temp_re;
	mpz_t temp_im;
	mpz_init_set_ui(temp_re,1);
	mpz_init_set_ui(temp_im,1);
	para.setBNField2Coordinate(temp_re, temp_im);
	mpz_t h;
	mpz_init(h);
	mpz_mul_ui(h, point1.p, 2);
	mpz_sub(h, h, point1.n);//h=2*p-n=p-1+t


		while (isQuadraticResidue(para) || isCubicResidue(para))
		{
			mpz_urandomm(temp_re, ST, para.p);
			mpz_urandomm(temp_im, ST, para.p);
			para.setBNField2Coordinate(temp_re, temp_im);
		}

		mpz_t five;
		mpz_init_set_ui(five, 5);
		bool flag;
		while (true)
		{
			flag = true;
			point2.Restb_(para.Inverse().mulConst(point2.b));
			point2 = point2.RandomPoint();
			point2 =point2.ScalarMul(h);
			try{
				point2.TestPointOrderIsN();
			}
			catch (const char*)
			{
				flag = false;
			}
			if (flag)
			{
				break;
			}
			else
			{
				
				para = para.exp(five);

			}
		 }
		point2.Affine();
		return point2;
}


BNPairing GeneratePairing(int length)
{
	
	BNParams parameter;
	parameter=GenerateBNParams(length);
	BNPoint point(parameter);
	point = GenerateBNPoint(parameter);
	BNPoint2 point2(point);
	point2= GenerateBNPoint2(point);
	return BNPairing(point2,point);

}