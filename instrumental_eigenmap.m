function [ Ex, Ey ] = instrumental_eigenmap( X, Y, K, dmax )
%LAPLACIAN_EIGENMAP Summary of this function goes here
%   Detailed explanation goes here

Gx = gram_by_LE(X, K);
Gy = gram_by_LE(Y, K);

% use svd 
[U, A, V] = svds(Gx*Gy, 10);
a1=diag(A);
a=diag(a1(1:dmax).^(-1/2));
Ex = U(:,1:dmax)*a;
Ey = V(:,1:dmax)*a;

end





