v = 0.3;

ix=0;
iy=0;
jx=10;
jy=0;
mx=5;
my=10;



bi=jy-my
ri=mx-jx
bj=my-iy
rj=ix-mx
bm=iy-jy
rm=jx-ix


a = [bi 0 ri;
    0 ri bi;
    bj 0 rj;
    0 rj bj;
    bm 0 rm;
    0 rm bm];

b = [1 v 0;
    v 1 0;
    0 0 (1-v)/2];

c = [bi 0 bj 0 bm 0;
    0 ri 0 rj 0 rm;
    ri bi rj bj rm bm];

d = [2;1;0.5;0;3;1];

x = a*b*c

y = b*c*d