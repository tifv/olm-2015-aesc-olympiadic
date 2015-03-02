import geometry;

size(6cm);

point X = (0, 0);
point
    A1 = (2, 3), B1 = (1, 4), C1 = (3, 3),
    A2 = X + (A1-X) * 2.4,
    B2 = X + (B1-X) * 1.8,
    C2 = X + (C1-X) * 1.4;

point
    D = extension(A1, B1, A2, B2),
    E = extension(B1, C1, B2, C2),
    F = extension(C1, A1, C2, A2);

draw(line(X, A1, extendA=false));
draw(line(X, B1, extendA=false));
draw(line(X, C1, extendA=false));

pen dashed2 = linetype(new real[] {2, 3});

draw(line(B1, D, extendA=false, extendB=false), p=dashed2);
draw(line(B2, D, extendA=false, extendB=false), p=dashed2);
draw(line(C1, E, extendA=false, extendB=false), p=dashed2);
draw(line(C2, E, extendA=false, extendB=false), p=dashed2);
draw(line(C1, F, extendA=false, extendB=false), p=dashed2);
draw(line(C2, F, extendA=false, extendB=false), p=dashed2);

draw(triangle(A1, B1, C1), linewidth(1));
draw(triangle(A2, B2, C2), linewidth(1));

draw(line(D, E), dashed);

dot(Label("$X$", X, SW));

dot(Label("$A_1$", A1, 1.3W));
dot(Label("$B_1$", B1, WSW));
dot(Label("$C_1$", C1, 0.8S+0.8SSE));
dot(Label("$A_2$", A2, NW));
dot(Label("$B_2$", B2, NW));
dot(Label("$C_2$", C2, 1.5plain.E));
dot(Label(scale(0.7) * "$D$", D, SW));
dot(Label(scale(0.7) * "$E$", E, NE));
dot(Label(scale(0.7) * "$F$", F, ENE));

