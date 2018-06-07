import fileinput
import re
from Crypto.Util import *
from MMQP import *
import MyCodeTEST
def FieldInverse(a,p):
    u=a
    v=p
    A=1
    C=0
    while u!=0:

         while u%2==0:
            u=u//2
            if A%2==0:
                A=A//2
            else:
                A=(A+p)//2
         while v%2==0:
             v=v//2
             if C%2==0:
                 C=C//2
             else:
                 C=(C+p)//2
         if u>=v:
             u=u-v
             A=A-C
         else:
             v=v-u
             C=C-A
    return C%p


class Field2(object):
    def __init__(self,item0,item1):
        self._re=item0
        self._im=item1
        
    def __str__(self):
        return 'Field2: re=%x,im=%x'%(self._re,self._im)
    def __add__(self,tmp):
        return self.Field2Add(tmp)
    def __sub__(self,tmp):
        return self.Field2Sub(tmp)
    def __mul__(self,tmp):
        return self.Field2Mul(tmp)
    def Field2Zero(self):
        return Field2(0,0)
    def Field2Squaring(self):
        a0=self._re
        a1=self._im
        t0=a0*a0
        t1=a1*a1
        c0=t1*bate
        c0=c0+t0
        c1=a0+a1
        c1=c1*c1-t0-t1
        result=Field2(c0,c1)
        return result
    
    def Field2Mul(self,tmp):
        a0=self._re
        a1=self._im
        b0=tmp._re
        b1=tmp._im
        s=a0+a1
        t=b0+b1
        d0=s*t
        d1=a0*b0
        d2=a1*b1
        d0=d0-d1
        d0=d0-d2
        d2=-bate*d2
        d1=d1-d2
        c0=d1%p
        c1=d0%p
        return Field2(c0,c1)
    def Field2MulConst(self,k):
        L = bin(k)[2:]
        length = len(L)
        C = self
        for i in range(1, length):
            k = L[i]
            C = C+C
            if k == '1':
                C = C+self
        return C
    
    def Field2Add(self,tmp):
        a0=self._re
        a1=self._im
        b0=tmp._re
        b1=tmp._im
        c0=(a0+b0)%p
        c1=(a1+b1)%p
        return Field2(c0,c1)
    def Field2Conjugate(self):
        return Field2(self._re,-self._im%p)
    
    def Field2Sub(self,tmp):
        a0=self._re
        a1=self._im
        b0=tmp._re
        b1=tmp._im
        c0=(a0-b0)%p
        c1=(a1-b1)%p
        return Field2(c0,c1)
    def Field2Neg(self):
        a0 = self._re
        a1 = self._im
        c0=-a0%p
        c1=-a1%p
        return Field2(c0,c1)
    def Field2MulYemeseilong(self):
        return self.Field2Mul(Yemeseilong)
    def Field2Inverse(self):
        a0 = self._re
        a1 = self._im
        t0=a0*a0;
        t1=a1*a1;
        t0=t0-bate*t1;
        t1=number.inverse(t0,p)
        c0=a0*t1%p
        c1=-a1*t1%p
        return Field2(c0,c1)
    def Field2IsEqual(self,tmp):
        return self._re==tmp._re and self._im==tmp._im
    def Field2Exp(self, e):
        L = bin(e)[2:]
        length = len(L)
        C = self
        for i in range(1, length):
            k = L[i]
            C = C * C
            if k == '1':
                C = C * self
        return C
class Field6(object):
    def __init__(self,item0,item1,item2):  # three Field2
        self._a0=item0
        self._a1=item1
        self._a2=item2
    def __str__(self):
        return 'Field6:a0=(%x,%x)\n       a1=(%x,%x)\n       a2=(%x,%x)'%(self._a0._re,self._a0._im,self._a1._re,self._a1._im,self._a2._re,self._a2._im)
    def __add__(self,tmp):
        return self.Field6Add(tmp)
    def __sub__(self,tmp):
        return self.Field6Sub(tmp)
    def __mul__(self,tmp):
        return self.Field6Mul(tmp)
    def Field6Add(self,tmp):
         a0=self._a0
         a1=self._a1
         a2=self._a2
         b0=tmp._a0
         b1=tmp._a1
         b2=tmp._a2
         c0=a0.Field2Add(b0)
         c1=a1.Field2Add(b1)
         c2=a2.Field2Add(b2)
         return Field6(c0,c1,c2)   

    def Field6Sub(self,tmp):
         a0=self._a0
         a1=self._a1
         a2=self._a2
         b0=tmp._a0
         b1=tmp._a1
         b2=tmp._a2
         c0=a0.Field2Sub(b0)
         c1=a1.Field2Sub(b1)
         c2=a2.Field2Sub(b2)
         return Field6(c0,c1,c2) 
     
    def Field6Mul(self,tmp):
         a0=self._a0
         a1=self._a1
         a2=self._a2
         b0=tmp._a0
         b1=tmp._a1
         b2=tmp._a2
         t0=a0.Field2Mul(b0)
         t1=a1.Field2Mul(b1)
         t2=a2.Field2Mul(b2)
         c0=a1.Field2Add(a2).Field2Mul(b1.Field2Add(b2)).Field2Sub(t1).Field2Sub(t2).Field2MulYemeseilong().Field2Add(t0)
         c1=a0.Field2Add(a1).Field2Mul(b0.Field2Add(b1)).Field2Sub(t0).Field2Sub(t1).Field2Add(t2.Field2MulYemeseilong())
         c2=a0.Field2Add(a2).Field2Mul(b0.Field2Add(b2)).Field2Sub(t0).Field2Sub(t2).Field2Add(t1)
         return Field6(c0,c1,c2)
     
    def Field6Squaring(self):
         return self.Field6Mul(self)
     
    def Field6MulGama(self):
        a0=self._a0
        a1=self._a1
        a2=self._a2
        c0=a2.Field2MulYemeseilong()
        c1=a0
        c2=a1
        return Field6(c0,c1,c2)
    def Field6Neg(self):
        a0 = self._a0
        a1 = self._a1
        a2 = self._a2
        c0=a0.Field2Neg()
        c1=a1.Field2Neg()
        c2=a2.Field2Neg()
        return Field6(c0,c1,c2)
    def Field6IsEqual(self,tmp):
        return  self._a0.Field2IsEqual(tmp._a0) and self._a1.Field2IsEqual(tmp._a1) and self._a2.Field2IsEqual(tmp._a2)
    def Field6Inverse(self):
        a0=self._a0
        a1=self._a1
        a2=self._a2
        t0=a0*a0
        t1=a1*a1
        t2=a2*a2
        t3=a0*a1
        t4=a0*a2
        t5=a1*a2
        c0=t0-t5.Field2MulYemeseilong()
        c1=t2.Field2MulYemeseilong()-t3
        c2=t1-t4
        t6=a0*c0
        t6=t6+a2*c1.Field2MulYemeseilong()
        t6=t6+a1*c2.Field2MulYemeseilong()
        t6=t6.Field2Inverse()
        c0=c0*t6
        c1=c1*t6
        c2=c2*t6
        return Field6(c0,c1,c2)
class Field12(object):
    def __init__(self,item0,item1):
        self._c0=item0
        self._c1=item1
    def __str__(self):

        return 'Field12:\nc0.a0.re=%x\nc0.a0.im=%x\nc0.a1.re=%x\nc0.a1.im=%x\nc0.a2.re=%x\nc0.a2.im=%x\nc1.a0.re=%x\nc1.a0.im=%x\nc1.a1.re=%x\nc1.a1.im=%x\nc1.a2.re=%x\nc1.a2.im=%x\n'%(self._c0._a0._re,self._c0._a0._im,self._c0._a1._re,self._c0._a1._im,self._c0._a2._re,self._c0._a2._im,self._c1._a0._re,self._c1._a0._im,self._c1._a1._re,self._c1._a1._im,self._c1._a2._re,self._c1._a2._im)
    def __add__(self,tmp):
        return self.Field12Add(tmp)
    def __sub__(self,tmp):
        return self.Field12Sub(tmp)
    def __mul__(self,tmp):
        return self.Field12Mul(tmp)
        
    def Field12Add(self,tmp):
        a0=self._c0
        a1=self._c1
        b0=tmp._c0
        b1=tmp._c1
        c0=a0+b0
        c1=a1+b1
        return Field12(c0,c1)
    
    def Field12Sub(self,tmp):
        a0=self._c0
        a1=self._c1
        b0=tmp._c0
        b1=tmp._c1
        c0=a0-b0
        c1=a1-b1
        return Field12(c0,c1) 
    
    def Field12Mul(self,tmp):
        a0=self._c0
        a1=self._c1
        b0=tmp._c0
        b1=tmp._c1   
        t0=a0*b0
        t1=a1*b1
        c0=t0+t1.Field6MulGama()
        c1=(a0+a1)*(b0+b1)-t0-t1
        return Field12(c0,c1)
    
    def Field12Squaring(self):
        return self.Field12Mul(self)
    def Field12Neg(self):
        a0 = self._c0
        a1 = self._c1
        c0=a0.Field6Neg()
        c1=a1.Field6Neg()
        return Field12(c0,c1)
    def Field12IsEqual(self,tmp):
        return self._c0.Field6IsEqual(tmp._c0) and self._c1.Field6IsEqual(tmp._c1)
    def Field12Inverse(self):
        a0=self._c0
        a1=self._c1
        t0=a0*a0
        t1=a1*a1
        t0=t0-t1.Field6MulGama()
        t1=t0.Field6Inverse()
        c0=a0*t1
        c1=a1*t1.Field6Neg()
        return Field12(c0,c1)
    def Field12Conjugate(self):
        return Field12(self._c0,self._c1.Field6Neg())
    def Field12Exp(self,e):
        L=bin(e)[2:]
        length=len(L)
        C=self
        for i in range(1,length):
            k=L[i]
            C=C*C
            if k=='1' :
                C=C*self
        return C
    def FrobeniusMap(self):
        return self.Field12Exp(p)
    def FrobeniusMap2(self):
        return self.FrobeniusMap().FrobeniusMap()
    def FrobeniusMap3(self):
        return self.FrobeniusMap().FrobeniusMap2()
    def FinalExp(self):
        return self.Field12Exp((p**12-1)//n)
    def BackFromField12(self):
        x_tmp=self._c0._a2
        y_tmp=self._c1._a1
        return Point2(x_tmp*Yemeseilong,y_tmp*Yemeseilong)
def Field12One():
    a=Field2(0,0)
    b=Field2(1,0)
    c=Field6(b,a,a)
    d=Field6(a,a,a)
    return Field12(c,d)
class Point1(object):
    def __init__(self,px,py,pz=1):
        self._px=px
        self._py=py
        self._pz=pz

class Point2(Field2):
    def __init__(self,Qx,Qy,Qz=Field2(1,0)):
        self._Qx=Qx
        self._Qy=Qy
        self._Qz=Qz
    def __add__(self, tmp):
        if self.Point2IsEqual(tmp):
            return self.Point2Double()
        else:
            return self.Point2Normalize().Point2Add(tmp)
    def __sub__(self,tmp):
        return self+(tmp.Point2Neg())
    def __str__(self):
        self.Point2Normalize()
        return 'qx_re=%x\nqx_im=%x\nqy_re=%x\nqy_im=%x\n'%(self._Qx._re,self._Qx._im,self._Qy._re,self._Qy._im)
    def Point2Double(self):
        XQ = self._Qx
        YQ = self._Qy
        ZQ = self._Qz
        tmp0 = XQ * XQ
        tmp1 = YQ * YQ
        tmp2 = tmp1 * tmp1
        tmp3 = (tmp1 + XQ) * (tmp1 + XQ) - tmp0 - tmp2
        tmp3 = tmp3.Field2MulConst(2)
        tmp4 = tmp0.Field2MulConst(3)
        tmp6 = XQ + tmp4
        tmp5 = tmp4 * tmp4
        XT = tmp5 - (tmp3.Field2MulConst(2))
        ZT = (YQ + ZQ) * (YQ + ZQ) - tmp1 - ZQ * ZQ
        YT = (tmp3 - XT) * tmp4 - (tmp2.Field2MulConst(8))
        return Point2(XT,YT,ZT)
    def Point2Add(self,R):
        XQ = self._Qx
        YQ = self._Qy
        XR = R._Qx
        YR = R._Qy
        ZR = R._Qz
        t0 = XQ * ZR * ZR
        t1 = (YQ + ZR) * (YQ + ZR) - YQ * YQ - ZR * ZR
        t1 = t1 * ZR * ZR
        t2 = t0 - XR
        t3 = t2 * t2
        t4 = t3.Field2MulConst(4)
        t5 = t4 * t2
        t6 = t1 - YR - YR
        t9 = t6 * XQ
        t7 = XR * t4
        XT = t6 * t6 - t5 - t7 - t7
        ZT = (ZR + t2) * (ZR + t2) - ZR * ZR - t3
        t10 = YQ + ZT
        t8 = (t7 - XT) * t6
        t0 = (YR * t5).Field2MulConst(2)
        YT = t8 - t0
        return Point2(XT,YT,ZT)
    def Point2MulScalar(self,k):
        L = bin(k)[2:]
        length = len(L)
        C = self
        for i in range(1, length):
            k = L[i]
            C = C+C
            if k == '1':
                C = C+self
        return C
    def Point2Neg(self):
        return Point2(self._Qx,self._Qy.Field2Neg(),self._Qz)
    def Point2Normalize(self):
        XQ=self._Qx
        YQ=self._Qy
        ZQ=self._Qz
        tmpx=ZQ*ZQ
        tmpx=tmpx.Field2Inverse()
        tmpy=ZQ*ZQ*ZQ
        tmpy=tmpy.Field2Inverse()
        self._Qx=XQ*tmpx
        self._Qy=YQ*tmpy
        self._Qz=Field2(1,0)
        return self
    def Point2IsInfinite(self):
        return self._Qz.Field2IsEqual(Field2(0,0))
    def Point2IsEqual(self,tmp):
        self.Point2Normalize()
        tmp.Point2Normalize()
        return self._Qx.Field2IsEqual(tmp._Qx) and self._Qy.Field2IsEqual(tmp._Qy)
    def Point2IsOnCurve2(self):
        X=self._Qx
        Y=self._Qy
        Z=self._Qz
        value=(Y*Y).Field2IsEqual(X*X*X+Z.Field2Exp(6).Field2Mul(Field2(0,5)))
        assert value,'the point is not on the curve\n'
        return value
    def MoveToField12(self):
        x=self._Qx
        y=self._Qy
        l0=Field6(Field2(0,0),Field2(0,0),x*(Yemeseilong.Field2Inverse()))
        l1=Field6(Field2(0,0),y*(Yemeseilong.Field2Inverse()),Field2(0,0))
        return Field12(l0,l1)
class Pairing(Field12,Point2,Point1):
    def __init__(self,Point2,Point1):
        self._P=Point1
        self._Q=Point2
    def LineDouble(self,Q,P):
        XQ=Q._Qx
        YQ=Q._Qy
        ZQ=Q._Qz
        xp=P._px
        yp=P._py
        tmp0=XQ*XQ
        tmp1=YQ*YQ
        tmp2=tmp1*tmp1
        tmp3=(tmp1+XQ)*(tmp1+XQ)-tmp0-tmp2
        tmp3=tmp3.Field2MulConst(2)
        tmp4=tmp0.Field2MulConst(3)
        tmp6=XQ+tmp4
        tmp5=tmp4*tmp4
        XT=tmp5-(tmp3.Field2MulConst(2))
        ZT=(YQ+ZQ)*(YQ+ZQ)-tmp1-ZQ*ZQ
        YT=(tmp3-XT)*tmp4-(tmp2.Field2MulConst(8))
        tmp3=tmp4*ZQ*ZQ.Field2MulConst(2).Field2Neg()
        tmp3=tmp3.Field2MulConst(xp)
        tmp6=tmp6*tmp6-tmp0-tmp5-(tmp1.Field2MulConst(4))
        tmp0=ZT*ZQ*ZQ.Field2MulConst(2)
        tmp0=tmp0.Field2MulConst(yp)
        a0=Field6(Field2(0,0),Field2(0,0),tmp0)
        a1=Field6(tmp6,tmp3,Field2(0,0))
        T=Point2(XT,YT,ZT)
        l=Field12(a0,a1)
        return T,l
    def LineAdd(self,Q,R,P):
        XQ = Q._Qx
        YQ = Q._Qy
        XR = R._Qx
        YR = R._Qy
        ZR = R._Qz
        xp = P._px
        yp = P._py
        t0=XQ*ZR*ZR
        t1=(YQ+ZR)*(YQ+ZR)-YQ*YQ-ZR*ZR
        t1=t1*ZR*ZR
        t2=t0-XR
        t3=t2*t2
        t4=t3.Field2MulConst(4)
        t5=t4*t2
        t6=t1-YR-YR
        t9=t6*XQ
        t7=XR*t4
        XT=t6*t6-t5-t7-t7
        ZT=(ZR+t2)*(ZR+t2)-ZR*ZR-t3
        t10=YQ+ZT
        t8=(t7-XT)*t6
        t0=(YR*t5).Field2MulConst(2)
        YT=t8-t0
        t10=t10*t10-YQ*YQ-ZT*ZT
        t9=t9+t9-t10
        t10=ZT.Field2MulConst(2*yp)
        t6=t6.Field2Neg()
        t1=t6.Field2MulConst(2*xp)
        l0=Field6(Field2(0,0),Field2(0,0),t10)
        l1=Field6(t9,t1,Field2(0,0))
        l=Field12(l0,l1)
        T=Point2(XT,YT,ZT)
        return T,l

    def optPairing(self,e=1):
        s=6*u+2
        L = bin(s)[2:]
        length = len(L)
        Q=self._Q.Point2Normalize()
        P=self._P
        T =Q
        f=Field12One()
        for i in range(1, length):
            k = L[i]
            tmp=self.LineDouble(T,P)
            f=f*f*tmp[1]
            T=tmp[0]
            if k == '1':
                tmp=self.LineAdd(Q,T,P)
                f=f*tmp[1]
                T=tmp[0]
        f_tmp=Q.MoveToField12()
        f_tmpFrobeniusMap=f_tmp.FrobeniusMap()
        f_tmpFrobeniusMap2=f_tmp.FrobeniusMap2()
        Q1=f_tmpFrobeniusMap.BackFromField12()
        Q2=f_tmpFrobeniusMap2.BackFromField12()
        tmp=self.LineAdd(Q1,T,P)
        f=f*tmp[1]
        T=tmp[0]
        tmp=self.LineAdd(Q2.Point2Neg(),T,P)
        f=f*tmp[1]
        T=tmp[0]
        f=f.FinalExp()
        return f.Field12Exp(e)



def digest_memory(src_file):
    filter_asmcode=[]
    for line in fileinput.input(src_file):
      k=re.match('\w+\s:\s(\w+)',line.strip("\n,\r"))
      if k:
        value=int(k.group(1),16)
        filter_asmcode.append(value)       
    return filter_asmcode;

def ToMontField(x,R,P):
    return (x*R)%P
def BackFromMontField(x,R,P):
    return (x*number.inverse(R, P))%P  #x*R^(-1) mod p
def MM(x,y):
    return MMQP(x, y, P1, P2, p, 12, 24)


def BinReverse(a):
    index = bin(a)[3:]  # remove the 0b and MSB 1
    k=index[::-1]     #reverse the string
    return int(k,2)

#******************define the Test Paramaters*************************

#ecc curve is y^2=x^3+5
# y^2=x^3+5i
u=0x600000000058F98A
p=0xb640000002a3a6f1d603ab4ff58ec74521f2934b1a7aeedbe56f9b27e351457d
n=36*u**4+36*u**3+18*u**2+6*u+1
b=5
bate=-2
Yemeseilong=Field2(0,1)
qx_re=0x5f907159c988545bf5a939de92fd8d4513db46669bc243c16147380b1411c1c5
qx_im=0x6142300cedc3633c2f8d7121544841957c70e70ba84d861a9138a03fab2f7595
qy_re=0x2aaa080b9d068d03c809382ba9572fb5210309fe7a82f6eb2793bc9f4004e2ff
qy_im=0x99db96566821d0ffb357d10347acfa586cfda58768df19391b83ccbc7041048e
px=0x9da8cc5fee721252fc18b66dda817d8743d31794f9c524773bd7e19e5162d377
py=0x87027bfd59ec12c41709f851777ec023ea3d4d3354f142aa03d80dec14920223
#n = 12
#r = 24
R = 2**(12*24)
P1=15099361911930728439538284461709792293024194120472470578770109170233090425357
P2=63169120937271838095302461559139863616862362541681386622472523312143443324673

P = Point1(px, py, 1)
Q = Point2(Field2(qx_re, qx_im), Field2(qy_re, qy_im), Field2(1, 0))

gama11 = Yemeseilong.Field2Exp((p - 1) // 6)
gama12 = gama11 * gama11
gama13 = gama11 * gama12
gama14 = gama11 * gama13
gama15 = gama11 * gama14

gama21 = gama11 * (gama11.Field2Conjugate())
gama22 = gama12 * (gama12.Field2Conjugate())
gama23 = gama13 * (gama13.Field2Conjugate())
gama24 = gama14 * (gama14.Field2Conjugate())
gama25 = gama15 * (gama15.Field2Conjugate())

gama31 = gama11 * gama21
gama32 = gama12 * gama22
gama33 = gama13 * gama23
gama34 = gama14 * gama24
gama35 = gama15 * gama25
#************convert  input paramater from original field to MontField****************

qx_re_MontField = ToMontField(qx_re, R, p)
qx_im_MontField = ToMontField(qx_im, R, p)
qy_re_MontField = ToMontField(qy_re, R, p)
qy_im_MontField = ToMontField(qy_im, R, p)
px_MontField = ToMontField(px, R, p)
py_MontField = ToMontField(py, R, p)

gama11_re_MontField=  ToMontField(gama11._re,R,p)
gama11_im_MontField=  ToMontField(gama11._im,R,p)
gama12_re_MontField=  ToMontField(gama12._re, R, p)
gama12_im_MontField = ToMontField(gama12._im, R, p)
gama13_re_MontField = ToMontField(gama13._re, R, p)
gama13_im_MontField = ToMontField(gama13._im, R, p)
gama14_re_MontField = ToMontField(gama14._re, R, p)
gama14_im_MontField = ToMontField(gama14._im, R, p)
gama15_re_MontField = ToMontField(gama15._re, R, p)
gama15_im_MontField = ToMontField(gama15._im, R, p)

gama21_re_MontField = ToMontField(gama21._re, R, p)
gama21_im_MontField = ToMontField(gama21._im, R, p)
gama22_re_MontField = ToMontField(gama22._re, R, p)
gama22_im_MontField = ToMontField(gama22._im, R, p)
gama23_re_MontField = ToMontField(gama23._re, R, p)
gama23_im_MontField = ToMontField(gama23._im, R, p)
gama24_re_MontField = ToMontField(gama24._re, R, p)
gama24_im_MontField = ToMontField(gama24._im, R, p)
gama25_re_MontField = ToMontField(gama25._re, R, p)
gama25_im_MontField = ToMontField(gama25._im, R, p)

gama31_re_MontField = ToMontField(gama31._re, R, p)
gama31_im_MontField = ToMontField(gama31._im, R, p)
gama32_re_MontField = ToMontField(gama32._re, R, p)
gama32_im_MontField = ToMontField(gama32._im, R, p)
gama33_re_MontField = ToMontField(gama33._re, R, p)
gama33_im_MontField = ToMontField(gama33._im, R, p)
gama34_re_MontField = ToMontField(gama34._re, R, p)
gama34_im_MontField = ToMontField(gama34._im, R, p)
gama35_re_MontField = ToMontField(gama35._re, R, p)
gama35_im_MontField = ToMontField(gama35._im, R, p)

#************convert  result from MontField to original field****************

memory_list=digest_memory('./MemDump/resultMemory.mif')

if MyCodeTEST.simulator.USING_WIDTH32==True:
    s1_MontField=(memory_list[0x0]<<160)+memory_list[0x1]
    s2_MontField=(memory_list[0x2]<<160)+memory_list[0x3]
    s3_MontField=(memory_list[0x4]<<160)+memory_list[0x5]
    s4_MontField=(memory_list[0x6]<<160)+memory_list[0x7]
    s5_MontField=(memory_list[0x8]<<160)+memory_list[0x9]
    s6_MontField=(memory_list[0xa]<<160)+memory_list[0xb]
    s7_MontField=(memory_list[0xc]<<160)+memory_list[0xd]
    s8_MontField=(memory_list[0xe]<<160)+memory_list[0xf]
    s9_MontField=(memory_list[0x10]<<160)+memory_list[0x11]
    s10_MontField=(memory_list[0x12]<<160)+memory_list[0x13]
    s11_MontField=(memory_list[0x14]<<160)+memory_list[0x15]
    s12_MontField=(memory_list[0x16]<<160)+memory_list[0x17]
elif MyCodeTEST.simulator.USING_WIDTH32==False:
    s1_MontField = memory_list[0x0]
    s2_MontField = memory_list[0x8]
    s3_MontField = memory_list[0x10]
    s4_MontField = memory_list[0x18]
    s5_MontField = memory_list[0x20]
    s6_MontField = memory_list[0x28]
    s7_MontField = memory_list[0x30]
    s8_MontField = memory_list[0x38]
    s9_MontField = memory_list[0x40]
    s10_MontField = memory_list[0x48]
    s11_MontField = memory_list[0x50]
    s12_MontField = memory_list[0x58]

s1 = BackFromMontField(s1_MontField,R,p)
s2 = BackFromMontField(s2_MontField,R,p)
s3 = BackFromMontField(s3_MontField, R, p)
s4 = BackFromMontField(s4_MontField, R, p)
s5 = BackFromMontField(s5_MontField, R, p)
s6 = BackFromMontField(s6_MontField, R, p)
s7 = BackFromMontField(s7_MontField, R, p)
s8 = BackFromMontField(s8_MontField, R, p)
s9 = BackFromMontField(s9_MontField, R, p)
s10 = BackFromMontField(s10_MontField, R, p)
s11 = BackFromMontField(s11_MontField, R, p)
s12 = BackFromMontField(s12_MontField, R, p)

pairing=Pairing(Q,P)
reference_result=pairing.optPairing().Field12Exp(e=21*13)

def test():
    pairing = Pairing(Q, P)
    reference_result = pairing.optPairing().Field12Exp(e=21 * 13)
    if reference_result._c0._a0._re == s1 \
            and reference_result._c0._a0._im == s2 \
            and reference_result._c0._a1._re == s3 \
            and reference_result._c0._a1._im == s4 \
            and reference_result._c0._a2._re == s5 \
            and reference_result._c0._a2._im == s6 \
            and reference_result._c1._a0._re == s7 \
            and reference_result._c1._a0._im == s8 \
            and reference_result._c1._a1._re == s9 \
            and reference_result._c1._a1._im == s10 \
            and reference_result._c1._a2._re == s11 \
            and reference_result._c1._a2._im == s12:
        print('\033[0;32m --------------- test true!!!------------\033[0m')
    else:
        print('\033[0;31m---------------- test false!!! -----------\033[0m')

if __name__=='__main__':

    print('qx_re_MontField=%x'%qx_re_MontField)
    print('qx_im_MontField=%x'%qx_im_MontField)
    print('qy_re_MontField=%x'%qy_re_MontField)
    print('qy_im_MontField=%x'%qy_im_MontField)
    print('px_MontField=%x'%px_MontField)
    print('py_MontField=%x'%py_MontField)


    print()
    print('gama11_re_MontField=%x' % gama11_re_MontField)
    print('gama11_im_MontField=%x' % gama11_im_MontField)
    print('gama12_re_MontField=%x' % gama12_re_MontField)
    print('gama12_im_MontField=%x' % gama12_im_MontField)
    print('gama13_re_MontField=%x' % gama13_re_MontField)
    print('gama13_im_MontField=%x' % gama13_im_MontField)
    print('gama14_re_MontField=%x' % gama14_re_MontField)
    print('gama14_im_MontField=%x' % gama14_im_MontField)
    print('gama15_re_MontField=%x' % gama15_re_MontField)
    print('gama15_im_MontField=%x' % gama15_im_MontField)

    print('gama21_re_MontField=%x' % gama21_re_MontField)
    print('gama21_im_MontField=%x' % gama21_im_MontField)
    print('gama22_re_MontField=%x' % gama22_re_MontField)
    print('gama22_im_MontField=%x' % gama22_im_MontField)
    print('gama23_re_MontField=%x' % gama23_re_MontField)
    print('gama23_im_MontField=%x' % gama23_im_MontField)
    print('gama24_re_MontField=%x' % gama24_re_MontField)
    print('gama24_im_MontField=%x' % gama24_im_MontField)
    print('gama25_re_MontField=%x' % gama25_re_MontField)
    print('gama25_im_MontField=%x' % gama25_im_MontField)

    print('gama31_re_MontField=%x' % gama31_re_MontField)
    print('gama31_im_MontField=%x' % gama31_im_MontField)
    print('gama32_re_MontField=%x' % gama32_re_MontField)
    print('gama32_im_MontField=%x' % gama32_im_MontField)
    print('gama33_re_MontField=%x' % gama33_re_MontField)
    print('gama33_im_MontField=%x' % gama33_im_MontField)
    print('gama34_re_MontField=%x' % gama34_re_MontField)
    print('gama34_im_MontField=%x' % gama34_im_MontField)
    print('gama35_re_MontField=%x' % gama35_re_MontField)
    print('gama35_im_MontField=%x' % gama35_im_MontField)

    print()
    print('loop=%x'%len(bin(6*u+2)[2:]))
    print('R*R=%x'%(R*R%p))
    print('t=%x'%u)
    print('loopIndex=%x'%BinReverse(6*u+2))
    print('MontFieldOne=%x'%ToMontField(1,R,p))
    print('p=%x'%p)

    print()
    print('s1=%x'%  s1)
    print('s2=%x' % s2)
    print('s3=%x' % s3)
    print('s4=%x' % s4)
    print('s5=%x' % s5)
    print('s6=%x' % s6)
    print('s7=%x' % s7)
    print('s8=%x' % s8)
    print('s9=%x' % s9)
    print('s10=%x' % s10)
    print('s11=%x' % s11)
    print('s12=%x' % s12)
    print(reference_result)

    test()




