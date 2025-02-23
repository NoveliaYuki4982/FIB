
int: n=4;
set of int: RANGE = 1..n;
array[RANGE] of var RANGE: x;

constraint forall(i,j in RANGE where i<j) (x[i]!=x[j]);
constraint forall(i,j in RANGE where i<j) (abs(x[i]-x[j])!=abs(i-j));

solve satisfy;

output [(if fix(x[i])=j then "Q" else "X" endif) ++ (if j=n then "\n" else "" endif) | i,j in RANGE];
