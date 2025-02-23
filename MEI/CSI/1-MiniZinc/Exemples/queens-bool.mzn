int: n=4;
set of int: RANGE =1..n;

array[RANGE, RANGE] of var bool: X;


constraint forall(i,j,l in RANGE where j<l)(not X[i,j] \/ not X[i,l]);
constraint forall(i,j,k in RANGE where i<k)(not X[i,j] \/ not X[k,j]);
constraint forall(i,j,k,l in RANGE where (i!=k \/ j!=l) /\ abs(i-k)=abs(j-l))(not X[i,j] \/ not X[k,l]);


constraint sum(i,j in RANGE)(X[i,j])=n;

solve satisfy;

output [(if fix(X[i,j])=true then "Q" else "X" endif) ++ (if j=n then "\n" else "" endif) | i,j in RANGE];
