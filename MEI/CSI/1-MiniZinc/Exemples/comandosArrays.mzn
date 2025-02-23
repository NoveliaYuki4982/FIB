include "globals.mzn" ;


int: n;  % numero de soldados
set of int : SOLD = 1..n;
array [SOLD] of 0..10: valor;
set of SOLD: idioma;
set of SOLD: teleco;
int: h; %numero de pares de hermanos
array[1..h,1..2] of SOLD: hermanos;
int: k;% numero de misiones
set of int : MIS = 1..k;
array [MIS] of int : minimo;
array [MIS] of int : maximo;
array [MIS] of int : dificultad;

%Determinar el número máximo de soldados que puede haber en una misión
int: max = max(maximo);
set of int: SOL = 1..max;

%Variable de Array de Arrays. Por cada misión sus soldados
array[MIS, SOL] of var 0..n: x;

%En la misma misión no hay repetidos y evitamos simetrias ordenándolo decrecientemente porque pueden haber valores = 0 (no soldado)
constraint forall(i in MIS, j in 1..max-1)(x[i,j]>=bool2int(x[i,j]!=0) + x[i, j+1]);

%Ningún soldado está asignado a más de una misión
constraint alldifferent([x[i,j] | i in MIS, j in SOL where x[i,j]!=0]);

%El número de soldados que hay que asignar a cada misión está acotado por un máximo y un mínimo
constraint forall(i in MIS)(sum(j in SOL)(x[i,j]>0)>= minimo[i]);

constraint forall(i in MIS)(sum(j in SOL)(x[i,j]>0)<= maximo[i]);

%La suma del valor de los soldados en cada misión es superior o igual a su dificultad
constraint forall(i in MIS)(sum(j in SOL where x[i,j]!=0)(valor[x[i,j]])>=dificultad[i]);

%Cada misión tiene mínimo 2 soldados que conocen el idioma y 1 soldado de telecomunicaciones
constraint forall(i in MIS)(sum(j in SOL where x[i,j]!=0)(x[i,j] in idioma) >= 2);

constraint forall(i in MIS)(sum(j in SOL where x[i,j]!=0)(x[i,j] in teleco) >= 1);

%No hay hermanos asignados en la misma misión
constraint forall(i in 1..h, m in MIS)(hermanos[i,1] in {x[m,j]|j in SOL} -> not(hermanos[i,2] in {x[m,j]|j in SOL}));



solve minimize sum(i in MIS, j in SOL where x[i,j]!=0)(valor[x[i,j]]);