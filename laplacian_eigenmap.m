function [ Y ] = laplacian_eigenmap( X, K, dmax )
%LAPLACIAN_EIGENMAP Summary of this function goes here
%   Detailed explanation goes here

sigma2 = 100; % determines strength of connection in graph... see below
m                = size(X,1);
dt               = squareform(pdist(X));
[srtdDt,srtdIdx] = sort(dt,'ascend');
dt               = srtdDt(1:K+1,:);
nidx             = srtdIdx(1:K+1,:);

% nz   = dt(:) > 0;
% mind = min(dt(nz));
% maxd = max(dt(nz));

% compute weights
tempW  = exp(-dt.^2/sigma2); 

% build weight matrix
i = repmat(1:m,K+1,1);
W = sparse(i(:),double(nidx(:)),tempW(:),m,m); 
W = max(W,W'); % for undirected graph.
W = W - diag(diag(W));% set diagonal elements to zero 

L = diag(sum(W,2))-W; % graph Laplacian

% The original normalized graph Laplacian, non-corrected for density
ld = diag(sum(W,2).^(-1/2));
Ln = ld*L*ld;
Ln = max(Ln,Ln');
fprintf(1,'Ln is symmetric %d\n ',issymmetric(Ln));

% get eigenvectors
[v,d] = eigs(Ln,10,'sa');
Y = v(:,2:dmax+1)

end

