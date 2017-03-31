clear;
close all;
load TwoSwissRolls.mat;
N=2000;
X=X_data(:,1:N); %The 3D Swiss Roll X
Y=Y_data(:,1:N); %The 3D Swiss Roll Y
Z=Z_data(:,1:N); %The 2D Plane (Generating data of Swiss Roll)

%P_aX=[10,10,5];
%P_aY=[10,10,5];

% The 3D Swiss Roll X with additive Gaussian noise
%Xa=[X(1,:)+wgn(1,N,P_aX(1)); X(2,:)+wgn(1,N,P_aX(2));X(3,:)+wgn(1,N,P_aX(3))];
% The 3D Swiss Roll Y with additive Gaussian noise
%Ya=[Y(1,:)+wgn(1,N,P_aY(1)); Y(2,:)+wgn(1,N,P_aY(2));Y(3,:)+wgn(1,N,P_aY(3))];

figure;
scatter(Z(1,:),Z(2,:),30,color(1:N),'o');
title('2D Linear Manifold');

figure;
scatter3(X(1,:),X(2,:),X(3,:),30,color(1:N),'o');
title('3D Nonlinear Swiss Roll X');

%figure;
%scatter3(Xa(1,:),Xa(2,:),Xa(3,:),30,color(1:N),'o');
%title('3D Nonlinear Noisy Swiss Roll X');

figure;
scatter3(Y(1,:),Y(2,:),Y(3,:),30,color(1:N),'o');
title('3D Nonlinear Swiss Roll Y');

%figure;
%scatter3(Ya(1,:),Ya(2,:),Ya(3,:),30,color(1:N),'o');
%title('3D Nonlinear Noisy Swiss Roll Y');

K=20;
d=2;

%Run Laplacian Eigenmap ALGORITHM
%lXa=laplacian_eigenmap_pca(Xa',K,d);
%lYa=laplacian_eigenmap_pca(Ya',K,d);
lXa=laplacian_eigenmap_pca(X',K,d);
lYa=laplacian_eigenmap_pca(Y',K,d);

figure;
scatter(lXa(:,1),lXa(:,2),30,color(1:N),'o');
title('Recovered 2D Linear Manifold X by LE');

figure;
scatter(lYa(:,1),lYa(:,2),30,color(1:N),'o');
title('Recovered 2D Linear Manifold Y by LE');