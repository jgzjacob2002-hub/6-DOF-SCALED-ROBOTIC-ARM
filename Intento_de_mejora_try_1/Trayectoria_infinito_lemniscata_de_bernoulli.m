clear;
clc;

% Parámetros robot
l1 = 9.5; l2 = 12; l3 = 1.5; l4 = 12.5; l5 = 3.8;  l6=3.5;
t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0;
qk = [t1; t2; t3; t4; t5; t6];

xd = [1;0;0; 0;-1;0; 0;0;-1; 17.8;0;18];
eps = 0.001;

%%%%%%%%%%%%%%%%% INICIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           % Cuántos círculos hará sobre la diagonal
%%%%%%%%%%%%%%%%% GENERADOR DE TRAYECTORIAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 300;
a = 2;  % tamaño del infinito

t = linspace(0,2*pi,n)';
Px = 17 + (a * sin(t));
Py = 0  + (a * sin(t).*cos(t));
Pz = 18 * ones(n,1);

trya = [Px,Py,Pz];




%%%%%%%%%%%%%%%%%% FINAL %%%%%%%%%%%%%%%%%%%%%%%%%%%


cons = xd(1:9);
Q = zeros(size(trya,1), 6);

for i = 1:size(trya,1)
    px = trya(i, 1);
    py = trya(i, 2);
    pz = trya(i, 3);

    xd = [cons; px; py; pz];
    qk = CIMN(qk, xd, t1, t2, t3, t4, t5, t6, l1, l2, l3, l4, l5, l6);

    Q(i, :) = qk';

    Graf(l1, l2, l3, l4, l5, l6, qk(1), qk(2), qk(3), qk(4), qk(5), qk(6), Px, Py, Pz)
    pause(1e-3)
end

Q_deg = rad2deg(Q);

% --- MAPEADO A RANGO DE THONNY ---
matlab_min = [-90, -90, -35, -90, -90, -90];
matlab_max = [+90, +90, +145, +90, +90, +90];
thonny_min = [0, 0, 0, 0, 0, 0];
thonny_max = [180, 180 180, 180, 180, 180];

Q_thonny = zeros(size(Q_deg));
for j = 1:6
    Q_thonny(:,j) = (Q_deg(:,j) - matlab_min(j)) ./ (matlab_max(j) - matlab_min(j)) .* ...
                    (thonny_max(j) - thonny_min(j)) + thonny_min(j);
end

writematrix(Q_thonny, 'trayectoria_thonny.csv');
disp('Trayectoria traducida guardada como "trayectoria_thonny.csv"');