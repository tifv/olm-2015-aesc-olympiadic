import geometry;

// access /_style/jeolm.asy as jeolm.asy
access jeolm;
from jeolm access mark;

real size = 7cm;
real mr = size/13;

size(size);

point T = (0,0), O = (1,0);
real alpha = 2;

circle omega1 = circle(O, 0.20),
    omega2 = circle((point) (omega1.C * alpha), omega1.r * alpha);

line[] tangents = tangents(omega1, T);

line CD = tangents[0], AB = tangents[1];

point
    A = omega1.C - omega1.r * AB.v,
    B = omega2.C - omega2.r * AB.v,
    C = omega1.C - omega1.r * CD.v,
    D = omega2.C - omega2.r * CD.v;

point
    M = (A+B)/2,
    P = omega1.C - omega1.r * unit(C-M)^2 / unit(C-omega1.C),
    Q = omega2.C - omega2.r * unit(D-M)^2 / unit(D-omega2.C);

point X = 2 M - P, Y = 2 M - Q;

pen gray = gray(0.7);

clipdraw(circle(A, B, P), gray+1);
draw(circle(A, B, X), gray+1);

draw(omega1);
draw(omega2);
draw(CD);
draw(AB);

draw(M--X ^^ M--Y, dashed);
draw(C--M ^^ D--M);

mark(A--M, 1);
mark(B--M, 1);

mark(P--M, 2);
mark(X--M, 2);
mark(Q--M, tildeframe);
mark(Y--M, tildeframe);

dot(Label("$A$", A, 1.5N));
dot(Label("$B$", B, N+0.5NW));
dot(Label("$C$", C, SW));
dot(Label("$D$", D, SSE));
dot(Label("$M$", M, 2N+1.5NNE));
dot(Label("$P$", P, 1.3W));
dot(Label("$Q$", Q, E));
dot(Label("$X$", X, NNE));
dot(Label("$Y$", Y, NNW));

