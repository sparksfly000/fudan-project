#include"BNPairing.h"
#include"BNField2.h"
#include"DefineFunction.h"

/* set the point on the pairing------*/
void BNPairing::setPairing(BNPoint2 Q, BNPoint P)
{
	Q_.setBNPoint2(Q);
	P_.setBNPoint(P);
}


/*---calculate the line evaluation  lQ,Q(P)-----------*/
BNField12 BNPairing::lDoublePoint(BNPoint2 Q, BNPoint P)
{

	BNField2 Xq(u, Q.b_.quadraticExtension), Yq(u, Q.b_.quadraticExtension), Zq(Q.u, Q.b_.quadraticExtension), Xt(Q.u, Q.b_.quadraticExtension), Yt(Q.u, Q.b_.quadraticExtension), Zt(Q.u, Q.b_.quadraticExtension);
	mpz_t xp, yp;	
	mpz_init_set(xp, P.PX);
	mpz_init_set(yp, P.PY);// require the PZ=1

	Xq = Q.GX;
	Yq = Q.GY;
	Zq = Q.GZ;
	

	BNField2 tmp0(Q.u, Q.b_.quadraticExtension), tmp1(Q.u, Q.b_.quadraticExtension), tmp2(Q.u, Q.b_.quadraticExtension), tmp3(Q.u, Q.b_.quadraticExtension), tmp4(Q.u, Q.b_.quadraticExtension), tmp5(Q.u, Q.b_.quadraticExtension), tmp6(Q.u, Q.b_.quadraticExtension);
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
		tmp3 = tmp4.mul(Zq.square()).mulConst(2).neg();//tmp3=-2*tmp4*Zq^2
		tmp3 = tmp3.mulConst(xp);//tmp3=tmp3*xp
		tmp6 = tmp6.square().sub(tmp0).sub(tmp5).sub(tmp1.mulConst(4));//tmp6=tmp6^2-tmp0-tmp5-4*tmp1
		tmp0 = Zt.mul(Zq.square()).mulConst(2);//tmp0=2*Zt*Zq^2
		tmp0 = tmp0.mulConst(yp);//tmp0=tmp0*yp
		BNField6 L0(Q.u, b, b_, tmp0), L1(Q.u, b, b_, tmp3, tmp6);//L0=tmp0+tmp3*v+0*v^2
		BNField12 L(Q.u, b, b_, L0, L1); //L1=tmp6+0*v+0*v^2
		return L;

	
}

BNField12 BNPairing::lAddtionPoint(BNPoint2 Q, BNPoint2 R, BNPoint P)
{
	// require Q is affine  
	// 
	BNField2 Xq(Q.u, Q.b_.quadraticExtension), Yq(Q.u, Q.b_.quadraticExtension), Zq(Q.u, Q.b_.quadraticExtension), Xt(Q.u, Q.b_.quadraticExtension), Yt(Q.u, Q.b_.quadraticExtension), Zt(Q.u, Q.b_.quadraticExtension);
	mpz_t xp, yp;
	mpz_init_set(xp, P.PX);
	mpz_init_set(yp, P.PY);// require the PZ=1

	Xq = Q.GX;
	Yq = Q.GY;
	Zq = Q.GZ;

	BNField2  Xr(R.u, Q.b_.quadraticExtension), Yr(R.u, Q.b_.quadraticExtension), Zr(R.u, Q.b_.quadraticExtension);
	Xr = R.GX;
	Yr = R.GY;
	Zr = R.GZ;
	BNField2 t0(Q.u, Q.b_.quadraticExtension), t1(Q.u, Q.b_.quadraticExtension), t2(Q.u, Q.b_.quadraticExtension), t3(Q.u, Q.b_.quadraticExtension), t4(Q.u, Q.b_.quadraticExtension), t5(Q.u, Q.b_.quadraticExtension), t6(Q.u, Q.b_.quadraticExtension), t7(Q.u, Q.b_.quadraticExtension), t8(Q.u, Q.b_.quadraticExtension), t9(Q.u, Q.b_.quadraticExtension), t10(Q.u, Q.b_.quadraticExtension);

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
	t10 = t10.square().sub(Yq.square()).sub(Zt.square());//t10=t10^2-Yq^2-Zt^2
	t9 = t9.mulConst(2).sub(t10);//t9=2*t9-t10
	t10 = Zt.mulConst(yp).mulConst(2);//t10=2*(Zt*yp)  //yp is not BNField2
	t6 = t6.neg();//t6=-t6
	t1 = t6.mulConst(xp).mulConst(2);//t1=2*(t6*xp)    //xp is not BNField2
	BNField6 L0(Q.u, b, b_, t10), L1(Q.u, b, b_, t1, t9);//L0=t10+t1*v+0*v^2
	BNField12 L(Q.u, b, b_, L0, L1);  //L1=t9+0*v+0*v^2
	return L;

	

}


/*----calculate the opt(Q,P)----*/
BNField12 BNPairing::opt()
{
	Q_.Affine();
	P_.Affine();
	//BNPairing Pairing(Q.u,P.b,Q.B,Q, P);
	mpz_t s;
	mpz_init(s);
	mpz_mul_ui(s, Q_.u, 6);
	mpz_add_ui(s, s, 2);//s=6*u+2
	mpz_abs(s, s);//s=|6u+2|
	std::vector<int> vec = NAF(s);
	reverse(vec.begin(), vec.end());
	BNPoint2 T(Q_.u, b, b_);
	T = Q_; //T=Q
	BNField12 f(Q_.u, b, b_);
	f.setOne();//f=1
	std::vector<int>::iterator Iter = vec.begin()+1;   //begin at L-2 
	for (; Iter != vec.end() ; Iter++)   // missing the vec.begin()
	{

		f = f.square().mul(lDoublePoint(T, P_)); //f=f^2*(lT,T(P));
		T = T.Twice(1);//T=2T

		if (*Iter==1)
		{
			f = f.mul(lAddtionPoint(Q_,T, P_));
			T = T.Add(Q_);
		}
		
		if (*Iter ==-1)
		{
			f = f.mul(lAddtionPoint(Q_.Neg(), T, P_));
			T = T.Sub(Q_);
		}
		
	}
	

	
	if (mpz_cmp_ui(Q_.u, 0) < 0)  //if u<0   
	{
	
		T = T.Neg();  //T=-T
		f = f.conjugation();//f=f_conjugation
	}
	
	
	BNPoint2 Q1(Q_.u, b, b_);
	BNPoint2 Q2(Q_.u, b, b_);
	BNField2 kesei(Q_.u, Yemoseilong.re, Yemoseilong.im, b_.quadraticExtension);   //kesei=Yemoseilong ;
	mpz_t expX;
	mpz_t expY;
	mpz_t p_1,_3_,_2_;
	mpz_init(p_1);
	mpz_init(_3_);
	mpz_init(_2_);
	mpz_init(expX);
	mpz_init(expY);
	mpz_sub_ui(p_1, Q_.p, 1);  //p_1=p-1;
	mpz_set_ui(_3_, 3);
	mpz_set_ui(_2_, 2);
	mpz_cdiv_q(expX, p_1, _3_);  //expX=(p-1)/3
	mpz_cdiv_q(expY, p_1, _2_);  //expX=(p-1)/2
	BNField2 keseip_1_3(Q_.u, b_.quadraticExtension), keseip_1_3_(Q_.u, b_.quadraticExtension), keseip_1_2(Q_.u, b_.quadraticExtension), keseip_1_2_(Q_.u,b_.quadraticExtension);
	keseip_1_3 = kesei.exp(expX);
	keseip_1_3_ = keseip_1_3.conjugate();
	keseip_1_2 = kesei.exp(expY);
	keseip_1_2_ = keseip_1_2.conjugate();
	Q1.setBNPoint2SetCoordinate(Q_.GX.conjugate().mul(keseip_1_3), Q_.GY.conjugate().mul(keseip_1_2));  //Q1 = ¦Ðp(Q)	
	Q2.setBNPoint2SetCoordinate(Q_.GX.mul(keseip_1_3).mul(keseip_1_3_),Q_.GY.mul(keseip_1_2).mul(keseip_1_2_));   //Q2=¦Ðp2(Q)
	Q1.Affine();
	Q2.Affine();
	f = f.mul(lAddtionPoint(Q1,T, P_));
	T = T.Add(Q1);
	f = f.mul(lAddtionPoint(Q2.Neg(),T, P_));
	T = T.Add(Q2.Neg());
	

	f = f.finalExp();

	return f;




}
BNPairing& BNPairing::operator=(const BNPairing& st)
{
	if (this == &st)
		return *this;
	Q_ = st.Q_;
	P_ = st.P_;
	return *this;
	

}

/*----calculate the ate(Q,P)----*/

BNField12 BNPairing::ate()
{
	Q_.Affine();
	P_.Affine();
	mpz_t t;
	mpz_init(t);
	mpz_mul(t, Q_.u,Q_.u );
	mpz_mul_ui(t, t,6 );//t=6*u^2
	std::vector<int> vec = NAF(t);
	reverse(vec.begin(), vec.end());
	BNPoint2 R(Q_.u, b, b_);
	R = Q_; //R=Q
	BNField12 f(Q_.u, b, b_);
	f.setOne();//f=1
	std::vector<int>::iterator Iter = vec.begin()+1;   //begin at L-2 
	for (; Iter != vec.end(); Iter++)   // missing the vec.begin()
	{

		f = f.square().mul(lDoublePoint(R, P_)); //f=f^2*(lT,T(P));
		R = R.Twice(1);//T=2T

		if (*Iter==1)
		{
			f = f.mul(lAddtionPoint(Q_, R, P_));
			R = R.Add(Q_);
		}
		else if (*Iter==-1)
		{
			f = f.mul(lAddtionPoint(Q_.Neg(), R, P_));
			R = R.Sub(Q_);
		}


	}


	f = f.finalExp();
	return f;


}



BNField12 getAte(BNPairing pairing)
{

	return pairing.ate();


}
