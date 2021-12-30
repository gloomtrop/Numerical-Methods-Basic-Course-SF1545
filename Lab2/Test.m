Bin = abs(-(n-1)/2:(n-1)/2)';
d = 0;
A = spdiags(Bin,d,A);
full(A)
