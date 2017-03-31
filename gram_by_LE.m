function [ G ] = gram_by_LE( X, K )
%GRAPH_LAPLACIAN Summary of this function goes here
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
fprintf(1,'L is symmetric %d\n ',issymmetric(L));

G = pseudoinverse(L); % Pseudo-inverse of L
G = (eye(m)-ones(m,1)*ones(1,m))*G*(eye(m)-ones(m,1)*ones(1,m));
%G = (G+G')/2;
fprintf(1,'G is symmetric %d\n ',issymmetric(G));

end

