% Tikhonov regularized pseudoinverse of matrix based on singular value decomposition
%        B = pinvreg(A, alpha)
%
% INPUT
%	A:     matrix
%	alpha: regularization parameter (e.g., alpha = 5e-3)
%
% OUTPUT
%	B:     pseudoinverse of A
%
% See also pinv, svd

% C�sar D. Salvador
% salvador@perception3d.com
% https://cesardsalvador.github.io/
% https://www.perception3d.com/
% February 11, 2024

% Reference and citation
% [1] C. D. Salvador et al., �Design theory for binaural synthesis:
%     Combining microphone array recordings and head-related transfer function datasets,�
%     Acoust. Sci. Technol., vol. 38, no. 2, pp. 51�62, Mar. 2017.
%     DOI: 10.1250/ast.38.51

function B = pinvreg(A, alpha)
[U, S, V] = svd(A, 'econ');
s = diag(S);
Sreginv = diag( abs(s).^2 ./ (abs(s).^2+alpha^2) ./ s );
B = V * Sreginv * U';
