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
N = 800;

x_c = 17.8;
y_c = 0.0;
z_c = 18.0;

sigma = 10; 
beta  = 8/3; 
rho   = 28;

f = @(t,a)[ ...
    sigma * (a(2) - a(1));
    rho * a(1) - a(2) - a(1) * a(3);
   -beta * a(3) + a(1) * a(2)
];

tspan = linspace(0, 40, N);
a0 = [1 1 1];
opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
[~, A] = ode45(f, tspan, a0, opts);

xr = A(:,1); 
yr = A(:,2); 
zr = A(:,3);

xr = xr - mean(xr);
yr = yr - mean(yr);
zr = zr - mean(zr);

ancho_x = 8.0;
alto_y  = 6.0;
alto_z  = 4.0;

rx = max(xr) - min(xr);
ry = max(yr) - min(yr);
rz = max(zr) - min(zr);

escala = min([ancho_x / rx, alto_y / ry, alto_z / rz]);

xr = xr * escala;
yr = yr * escala;
zr = zr * escala;

ds = sqrt(diff(xr).^2 + diff(yr).^2 + diff(zr).^2);
s  = [0; cumsum(ds)];
s_uniform = linspace(0, s(end), N)';

xr = interp1(s, xr, s_uniform, 'linear');
yr = interp1(s, yr, s_uniform, 'linear');
zr = interp1(s, zr, s_uniform, 'linear');

Px = x_c + xr;
Py = y_c + yr;
Pz = z_c + zr;

trya = [Px, Py, Pz];

%%%%%%%%%%%%%%%%%% FINAL %%%%%%%%%%%%%%%%%%%%%%%%%%%

cons = xd(1:9);
Q = zeros(size(trya,1), 6);


%%%% PARTE NUEVA: ABRIR EL PUERTO SERIAL CON ARDUINO %%%%

puerto = "COM3";   %%%%%%%  >>>>>>>> aqui es depende del puerto
baud   = 9600;

s = serialport(puerto, baud);
pause(2);   
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

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % NUEVO: CONVERTIR qk (rad) → grados → rango de servos
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ENVÍO SERIAL AL ARDUINO
    % Formato: "a1,a2,a3,a4,a5,a6\n" >>>>>variables del arduino
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    linea = sprintf("%d,%d,%d,%d,%d,%d\n", ...
        round(angles(1)), ...
        round(angles(2)), ...
        round(angles(3)), ...
        round(angles(4)), ...
        round(angles(5)), ...
        round(angles(6)));

    write(s, linea, "string");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GUARDAR CSV 
% En arduino no sirve pa nada, pero para que le muevo, sirve para hacer el
% csv
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
