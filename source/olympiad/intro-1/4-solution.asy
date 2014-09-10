import geometry;

// access /_style/jeolm.asy as jeolm.asy
access jeolm;
from jeolm access mark;

real size = 7cm;
real mr = size/13;

size(size);


point A = (0,0), B = (4,0), M = (A+B)/2, T = (B+M)/2;

circle omega1 = circle(A, B), omega2 = circle(A, M);

line BN = tangents(omega2, B)[0];
point N = omega1.C + omega1.r * BN.v^2 / unit(B - omega1.C);
point L = omega2.C - omega2.r * BN.v;
point C = omega2.C;

pen gray = gray(0.7);

draw(omega1, gray+1);
draw(omega2, gray+1);

draw(A--B);

draw(line(B, N, extendA=false));

draw(A--N ^^ C--L, dashed);

perpendicularmark(L, unit(C-L), dir=SE, size=0.5mr);
perpendicularmark(N, unit(A-N), dir=SE, size=0.5mr);

mark(A--C, tildeframe);
mark(C--M, tildeframe);
mark(M--T, tildeframe);
mark(T--B, tildeframe);

dot(Label("$A$", A, NW));
dot(Label("$B$", B, NE));
dot(Label("$M$", M, NE));
dot(Label("$N$", N, 1.3 SSW));
dot(Label("$L$", L, -BN.v));
dot(Label("$C$", C, plain.N));
dot(T);

