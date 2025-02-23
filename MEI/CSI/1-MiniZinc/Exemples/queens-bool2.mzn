int: n=16;
set of int: RANGE =1..n;

array[RANGE, RANGE] of var bool: X;
%rows
constraint forall(i in RANGE) (sum(j in RANGE)(X[i,j])=1);
%columns
constraint forall(i in RANGE) (sum(j in RANGE)(X[j,i])=1);

%descending diagonals
constraint forall(k in RANGE)(sum(i in 1..n-k+1)(X[i+k-1,i])<2);
constraint forall(k in RANGE)(sum(i in 1..n-k+1)(X[i,i+k-1])<2);
%ascending diagonals
constraint forall(k in RANGE)(sum(i in 1..n-k+1)(X[n-i+1,i+k-1])<2);
constraint forall(k in RANGE)(sum(i in 1..n-k+1)(X[n-i+1-k+1,i])<2);



constraint forall(k in RANGE)(sum(i in 1..n-k+1)(X[i+k-1,n-i+1])<2);


%constraint forall(i in RANGE) (sum(j in 1..n-i+1)(X[j+i-1,j])<2);

solve satisfy;

output [(if fix(X[i,j])=true then "Q" else "X" endif) ++ (if j=n then "\n" else "" endif) | i,j in RANGE];
