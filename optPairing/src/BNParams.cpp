#include"BNParams.h"
#include"gmp.h"


BNParams::BNParams(mpz_t x)
{
	mpz_init_set(u, x);
mpz_init(p);
mpz_init(n);
mpz_t temp;
mpz_init(temp);
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
};

void BNParams::ResetUvalue(const mpz_t &x)
{
	mpz_init_set(u, x);
	mpz_t temp;
	mpz_init(temp);
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

}


/*
BNParams::BNParams(int bits)
{
	gmp_randstate_t st;
	gmp_randinit_default(st);
	mpz_t u,Refrence;
	mpz_init(u);
	mpz_init(Refrence);
	mpz_ui_pow_ui(Refrence, 2, bits);
	BNParams test(Refrence);
	do
	{

		do
		{
			mpz_urandomb(u, st, bits + 1);

		} while (mpz_cmp(u, Refrence) < 0);

		test.ResetUvalue(u);

	} while (mpz_probab_prime_p(test.p, 25) ==0 || mpz_probab_prime_p(test.n, 25) == 0);

		mpz_init_set(u, test.u);
		mpz_init_set(p, test.p);
		mpz_init_set(n, test.n);

}

*/
BNParams& BNParams::operator=(const BNParams& st)
{

	if (this == &st)
		return *this;
	mpz_set(u, st.u);
	mpz_set(p, st.p);
	mpz_set(n, st.n);
	return *this;
}
/*
mpz_t* BNParams::getP()
{  //p=36*u^4+36*u^3+24*u^2+6*u+1
	mpz_init(p);
	mpz_t temp;
	mpz_init(temp);
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
	mpz_t *pp = &p;
	return pp;


}



mpz_t * BNParams::getN()
{  //p=36*u^4+36*u^3+18*u^2+6*u+1
	mpz_init(n);
	mpz_t temp;
	mpz_init(temp);
	mpz_pow_ui(n, u, 4);//p=u^4
	mpz_mul_ui(n, n, 36); //p=36*u^4
	mpz_pow_ui(temp, u, 3);//temp=u^3
	mpz_mul_ui(temp, temp, 36); //temp=36*u^3
	mpz_add(n, n, temp);//p=36*u^4+36*u^3
	mpz_pow_ui(temp, u, 2); //temp=u^2
	mpz_mul_ui(temp, temp, 18); //temp=24*u^2
	mpz_add(n, n, temp);//p=36*u^4+36*u^3+24*u^2
	mpz_mul_ui(temp, u, 6);//temp=6*u
	mpz_add(n, n, temp);//p=36*u^4+36*u^3+24*u^2+6*u
	mpz_add_ui(n, n, 1); //p=36*u^4+36*u^3+24*u^2+6*u+1
	mpz_t *pp = &n;
	return pp;


}
*/