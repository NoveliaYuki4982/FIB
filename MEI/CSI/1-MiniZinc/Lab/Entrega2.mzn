% Albert Bausili Fernández i Noa Yu Ventura Vila
include "globals.mzn";
int: CAPACITY=12 * 60 div 15; %  capacidad diaria de cada LINAC
set of int: DAY=1..7*3; % dias en tres semanas

int: m; % numero de LINACS
set of int: LINAC = 1..m;
array[LINAC,DAY] of 0..CAPACITY: disponible; % tiempo disponible cada dia en cada LINAC descontando el tiempo ya comprometido por tandas anterior

int: p; % numero de nuevos pacientes cuyas tandas hay que incorporar
set of int: PACIENTE = 1..p;
int: s; % sesiones por tanda
array[PACIENTE] of 1..5: solicitud; % dia (laborable) de la semana
%en que se hizo la solicitud
set of int: SESION = 1..s;
array[PACIENTE, SESION] of int: duracion; % duracion de la sesion (en multiplo de 15)
array[PACIENTE, SESION] of int: separacion; %numero de dias que idealmente tienen que pasar entre la sesion anterior y la actual. La primera columna se refiere al dia de la solicitud

array[PACIENTE, SESION] of var DAY: dia; % representa el dia en el que planificamos cada sesion y paciente

array[PACIENTE, SESION] of var LINAC: linac; % representa el LINAC assignado a cada sesion y paciente

% 1. La suma de las duraciones de las sesiones para un dia y linac concreto no puede superar la disponibilidad que este tiene. Sumamos 15 minutos por sesion para contar el cambio entre pacientes y restamos 15 a la suma por el ultimo paciente que no se tiene que cambiar con nadie
constraint forall(l in LINAC, d in DAY)(
  sum(pa in PACIENTE, se in SESION where linac[pa, se] = l /\ dia[pa, se] = d)(duracion[pa, se] + 1) - 1 <= disponible[l, d]);

% 2. Las sesiones para todo paciente tienen que estar en orden cronologico. Asumimos que el orden de las sesiones que nos entran es el orden en el que se tienen que realizar estas
constraint forall(pa in PACIENTE, se in SESION where se < s)(dia[pa,se] < dia[pa,se+1]);

% 3. El dia para el que esta planeada la primera sesion de la tanda mas los dias que lleva el paciente esperando (desde la solicitud) tiene que ser menor o igual a 8
constraint forall(pa in PACIENTE)(dia[pa,1] + solicitud[pa] <= 8);

% 4. No puede haber una sesion planificada dos veces (implicito por diseño)

% 5. No puede haber un paciente con dos sesiones en el mismo dia (implicito en la constraint 2)

% Asumimos que todas las sesiones se pueden planificar dadas las 3 semanas y la disponiblidad introducida

% Funcion objetivo: Minimizamos el maximo en valor absoluto de la diferencia entre la separacion ideal y la separacion real
solve minimize max([abs(separacion[pa, se] - (dia[pa, se+1] - dia[pa, se])) | pa in PACIENTE, se in 1..(s-1)]);