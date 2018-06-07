#ifndef BNPARAMS_H_
#define BNPARAMS_H_
#include"gmp.h"

class  BNParams {

public:
	mpz_t p,
		n,
		u;
	BNParams(){ mpz_init(u); mpz_init(p); mpz_init(n); };
	BNParams(mpz_t);
	//BNParams(int bits);
	void ResetUvalue(const mpz_t &);
	BNParams& operator=(const BNParams& st);
	//mpz_t *getP();
	//mpz_t *getN();


};






#endif
