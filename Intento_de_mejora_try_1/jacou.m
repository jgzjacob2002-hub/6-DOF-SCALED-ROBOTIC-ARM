clear;
clc;

% ====== CONFIGURAR PUERTO SERIAL ======
puerto = "COM3";   % <---- USANDO COM3 COMO ME PEDISTE
baud   = 115200;

s = serialport(puerto, baud);
pause(1);   % Esperar a que Arduino envíe "READY"

disp("Arduino listo en COM3.");


% ====== EJEMPLO DE MATRIZ DE TRAYECTORIA ======
% Si ya tienes Q_thonny generado por tu Jacobiano,
% SOLO reemplaza esta matriz.
%
% Q_thonny debe ser: [N x 6]
%
% TEMPORAL: valores para probar que Arduino recibe
Q_thonny = [
    90 90 90 90 90 90;
    45 80 60 90 90 90;
    10 60 30 90 90 90;
    150 20 10 90 90 90
];


% ====== ENVIAR TRAYECTORIA AL ARDUINO ======
num_puntos = size(Q_thonny, 1);

for i = 1:num_puntos
    
    a = Q_thonny(i, :);   % 6 ángulos de esta iteración

    % Crear mensaje FORMATO EXACTO: a1,a2,a3,a4,a5,a6\n
    msg = sprintf('%.1f,%.1f,%.1f,%.1f,%.1f,%.1f\n', ...
                  a(1), a(2), a(3), a(4), a(5), a(6));

    % Enviar al Arduino
    write(s, msg, "string");

    % (OPCIONAL) Leer respuesta del Arduino
    pause(0.02);
    if s.NumBytesAvailable > 0
        resp = readline(s);
        disp("Arduino dice: " + resp);
    end
    
    pause(0.05);   % Tiempo entre movimientos
end

disp("Trayectoria completada.");
