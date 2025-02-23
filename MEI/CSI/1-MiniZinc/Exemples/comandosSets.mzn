%include "globals.mzn" ;


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

%La variable es un Array de Sets, donde cada Set representa una misión y contiene a sus soldados
array[MIS] of var set of SOLD: x;

%El número de soldados que hay que asignar a cada misión está acotado por un máximo y un mínimo
constraint forall(i in MIS) (card(x[i])>= minimo[i] /\ card(x[i])<=maximo[i]);

%La suma del valor de los soldados en cada misión es superior o igual a su dificultad
constraint forall(i in MIS) (sum([valor[j] | j in x[i]]) >= dificultad[i]);

%Cada misión tiene mínimo 2 soldados que conocen el idioma y 1 soldado de telecomunicaciones
constraint forall(i in MIS)(card(x[i] intersect idioma) >= 2);

constraint forall(i in MIS)(card(x[i] intersect teleco) >= 1);

%Ningún soldado está asignado a más de una misión
constraint forall(i,j in MIS where i<j) (card(x[i] intersect x[j]) == 0);

%No hay hermanos asignados en la misma misión
constraint forall(i in MIS, j in 1..h)(hermanos[j,1] in x[i] -> not(hermanos[j,2] in x[i]));

%minimizar la suma de valor de los soldados asignados
var int: sumv = sum([sum([valor[j]| j in x[i]])| i in MIS]);

solve minimize sumv;