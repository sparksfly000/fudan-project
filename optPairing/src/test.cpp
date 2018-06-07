#include<stdlib.h>
#include<stdio.h>
#include<time.h>
#include"gmp.h"
#include"BNPoint.h"
#include"BNParams.h"
#include"BNField2.h"
#include"BNCurve2.h"
#include"BNPoint2.h"
#include<iostream>
#include<vector>
#include<iterator>
#include<string>
#include"BNField6.h"
#include"BNField12.h"
#include"BNPairing.h"
#include"DefineFunction.h"
#define POINTPARAMETER 2  //b

#define EXTENSION  -1    //i^2=
#define MODE  0
using namespace std;
#pragma comment(linker,"/NODEFAULTLIB:LIBC.lib")


int main()
{	
	/***********************
	 test the opt pairing function	  
	 ************************/

	mpz_t u;
	mpz_init_set_str(u, "600000000058F98A", 16);
	int para_re = 0;
	int para_im = 5;
	int beita = -2;
	int b = 5;
	BNField2 para(u, para_re, para_im, beita);

	mpz_t px, py;
	mpz_init_set_str(px, "-1", 16);
	mpz_init_set_str(py, "2", 16);

	mpz_t qx_re, qx_im, qy_re, qy_im;
	mpz_init_set_str(qx_re, "5f907159c988545bf5a939de92fd8d4513db46669bc243c16147380b1411c1c5",16);
	mpz_init_set_str(qx_im, "6142300cedc3633c2f8d7121544841957c70e70ba84d861a9138a03fab2f7595",16);
	mpz_init_set_str(qy_re, "2aaa080b9d068d03c809382ba9572fb5210309fe7a82f6eb2793bc9f4004e2ff",16);
	mpz_init_set_str(qy_im, "99db96566821d0ffb357d10347acfa586cfda58768df19391b83ccbc7041048e",16);
	BNField2 qx(u, qx_re, qx_im, beita);
	BNField2 qy(u, qy_re, qy_im, beita);

	BNPoint P(u, b, px, py),P111(u,b,px,py);
	BNPoint2 Q(u, b, para, qx, qy),Q22(u,b,para,qx,qy);
	mpz_t A, B, AB;
	mpz_init_set_str(A, "111", 10);
	mpz_init_set_str(B, "22", 10);
	mpz_init_set_str(AB, "2442", 10);

	P111 = P.ScalarMul(A);
	Q22 = Q.ScalarMul(B);

	BNPairing pairing1(u, b, para, Q, P);
	BNField12 f1 = pairing1.opt();
	BNField12 f2 = f1.exp(AB);
	BNPairing pairing2(u, b, para, Q22, P111);
	BNField12 f3 = pairing2.opt();
	cout << "e(Q,P)=" << endl;
	f1.BNField12Show();
	cout << "e(Q,P)^2442=" << endl;
	f2.BNField12Show();
	cout << "e(22*Q,111*P)=" << endl;
	f3.BNField12Show();
	
	if(f2.isEqual(f3))
		cout<<"\033[0;32m----------------- test opt pariing pass -------------------\033[0m\n\n";
	else
		cout<<"\033[0;31m----------------- test opt pariing fail -------------------\033[0m\n\n";


	/***********************
	  According to the input length , We can generate the parameters of the BN.
	 ************************/

	int m = 100;
	BNParams paraNew = GenerateBNParams(m);
	cout<<"length = "<< m<< "  random BNparams is "<<endl;
	gmp_printf("paraNew.p=%ZX\n", paraNew.p);
	gmp_printf("paraNew.n=%ZX\n", paraNew.n);
	gmp_printf("paraNew.u=%ZX\n", paraNew.u);
}




