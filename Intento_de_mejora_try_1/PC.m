clear; clc;

% Variables simbólicas (reales para simplificaciones más limpias)
syms t1 t2 t3 t4 t5 t6 real
syms l1 l2 l3 l4 l5 l6 real

% Tabla DH (formato: [theta  d    a     alpha])
DH = [ t1        l1   l3    pi/2;
       t2+pi/2   0    l2+l4 0;
       t3        0    0     pi/2;
       t4        l5   0     pi/2;
       t5        0    0    -pi/2;
       t6        l6   0     0   ];

theta = DH(:,1);
d     = DH(:,2);
a     = DH(:,3);
alpha = DH(:,4);

% Contenedores
Ai   = cell(6,1);
Tall = sym(zeros(4,4,6));
T    = sym(eye(4));

% Bucle principal
for i = 1:6
    Ai{i} = [ cos(theta(i))  -sin(theta(i))*cos(alpha(i))   sin(theta(i))*sin(alpha(i))  a(i)*cos(theta(i));
              sin(theta(i))   cos(theta(i))*cos(alpha(i))  -cos(theta(i))*sin(alpha(i))  a(i)*sin(theta(i));
              0               sin(alpha(i))                 cos(alpha(i))                d(i);
              0               0                             0                            1 ];

    % Transformación acumulada T0_i (puedes subir/bajar 'Steps' según rendimiento)
    T = T * Ai{i};
    Tall(:,:,i) = simplify(T, 'Steps', 10);
end

% Mostrar resultados
for i = 1:6
    fprintf('\nMatriz A%d:\n', i);
    disp(simplify(Ai{i}, 'Steps', 5));
    fprintf('Transformación T0_%d:\n', i);
    disp(Tall(:,:,i));
end

% Transformación final
T06 = Tall(:,:,6);
R06 = T06(1:3,1:3);
p06 = T06(1:3,4);

disp('R06 (rotación):'); disp(R06);
disp('p06 (posición):'); disp(p06);

%%Evaluacion de cinematica directa
l1=13.89;
l2=8.521;
l3=1.001;
l4=1.026;
l5=11.526;
l6=5.133
t1=0*(pi/180)
t2=0*(pi/180)
t3=0*(pi/180)
t4=0*(pi/180)
t5=0*(pi/180)
t6=0*(pi/180)
eval(T)