clear;
clc;

% Parámetros robot (tus longitudes/unidades)
l1 = 9.5; l2 = 12; l3 = 1.5; l4 = 12.5; l5 = 3.8;  l6 = 3.5;
t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0;
qk = [t1; t2; t3; t4; t5; t6];

% Orientación constante (matriz R 3x3 aplanada) + posición deseada inicial (px,py,pz)
xd = [1;0;0; 0;-1;0; 0;0;-1; 17.8;0;18];
eps = 0.001;

%%%%%%%%%%%%%%%%% INICIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 200;           % Puntos por círculo (ajusta para suavidad)
vueltas=4;
% ----- Define la diagonal en el espacio -----
x_inicio = 17 + 2;
x_final  = 17 + 5 ;

y_inicio = 0 ;
y_final  = 0 +17;

z_inicio = 18 ;
z_final  = 18 - 5 ;

Px_centro = linspace(x_inicio, x_final, n)';
Py_centro = linspace(y_inicio, y_final, n)';
Pz_centro = linspace(z_inicio, z_final, n)';

% ----- Parámetros del círculo -----
radio = 2;
theta = linspace(0, 2*pi*vueltas, n)';

% Trayectoria final: círculo que se mueve a lo largo de la diagonal
Px = Px_centro + radio * cos(theta);
Py = Py_centro + radio * sin(theta);
Pz = Pz_centro;

trya = [Px, Py, Pz];
%%%%%%%%%%%%%%%%%% FINAL %%%%%%%%%%%%%%%%%%%%%%%%%%%

cons = xd(1:9);
Q = zeros(size(trya,1), 6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 🔵 PARTE NUEVA: ABRIR EL PUERTO SERIAL CON ARDUINO %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puerto = "COM3";   % <<< CAMBIA ESTO al puerto de tu Arduino
baud   = 9600;

s = serialport(puerto, baud);
pause(2);   % espera a que el Arduino reinicie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:size(trya,1)
    px = trya(i, 1);
    py = trya(i, 2);
    pz = trya(i, 3);

    xd = [cons; px; py; pz];
    qk = CIMN(qk, xd, t1, t2, t3, t4, t5, t6, l1, l2, l3, l4, l5, l6);

    Q(i, :) = qk';

    % Visualización
    Graf(l1, l2, l3, l4, l5, l6, qk(1), qk(2), qk(3), qk(4), qk(5), qk(6), Px, Py, Pz)
    pause(1e-3)

    %---------------------------------------------------------------
    % 🔵 NUEVO: CONVERTIR qk (rad) → grados → rango de servos
    %---------------------------------------------------------------
    Q_deg = rad2deg(qk);

    matlab_min = [-90, -90, -35, -90, -90, -90];
    matlab_max = [+90, +90, +145, +90, +90, +90];
    thonny_min = [0, 0, 0, 0, 0, 0];
    thonny_max = [180, 180, 180, 180, 180, 180];

    angles = zeros(1,6);
    for j = 1:6
        angles(j) = (Q_deg(j) - matlab_min(j)) / (matlab_max(j) - matlab_min(j)) ...
                    * (thonny_max(j) - thonny_min(j)) + thonny_min(j);
    end

    %---------------------------------------------------------------
    % 🔵 NUEVO: ENVÍO SERIAL AL ARDUINO
    % Formato: "a1,a2,a3,a4,a5,a6\n"
    %---------------------------------------------------------------
    linea = sprintf("%d,%d,%d,%d,%d,%d\n", ...
        round(angles(1)), ...
        round(angles(2)), ...
        round(angles(3)), ...
        round(angles(4)), ...
        round(angles(5)), ...
        round(angles(6)));

    write(s, linea, "string");
end

% --- GUARDAR CSV (se mantiene igual)
Q_deg = rad2deg(Q);

matlab_min = [-90, -90, -35, -90, -90, -90];
matlab_max = [+90, +90, +145, +90, +90, +90];
thonny_min = [0, 0, 0, 0, 0, 0];
thonny_max = [180, 180, 180, 180, 180, 180];

Q_thonny = zeros(size(Q_deg));
for j = 1:6
    Q_thonny(:,j) = (Q_deg(:,j) - matlab_min(j)) ./ (matlab_max(j) - matlab_min(j)) .* ...
                    (thonny_max(j) - thonny_min(j)) + thonny_min(j);
end

writematrix(Q_thonny, 'trayectoria_thonny.csv');
