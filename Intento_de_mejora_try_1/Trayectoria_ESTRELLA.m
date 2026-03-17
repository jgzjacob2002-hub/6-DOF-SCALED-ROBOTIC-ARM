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
%%%%%%%%%%%%%%%%%%%% CHEN %%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% DADRAS %%%%%%%%%%%%%%%%%%%%

N = 800;

x_c = 17.8;
y_c = 0.0;
z_c = 18.0;

% Parámetros Dadras
a = 3;
b = 2.7;
c = 1.7;
d = 2;
e = 9;

f = @(t,x)[ ...
    x(2) - a*x(1) + b*x(2)*x(3);
    c*x(2) - x(1)*x(3) + x(3);
    d*x(1)*x(2) - e*x(3)
];

tspan = linspace(0,35,N);
x0 = [0.5 0.5 0.5];

opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
[~,A] = ode45(f,tspan,x0,opts);

xr = A(:,1);
yr = A(:,2);
zr = A(:,3);

% Centrado
xr = xr - mean(xr);
yr = yr - mean(yr);
zr = zr - mean(zr);

% Escalado controlado
factor = 0.45;
xr = factor * xr;
yr = factor * yr;
zr = factor * zr;

% Traslado
Px = x_c + xr;
Py = y_c + yr;
Pz = z_c + zr;

trya = [Px Py Pz];



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