clear
clc

for i=1:6
    eval(['t(i)=sym(''t',num2str(i),''')'])
end

syms l1 l2 l3 l4 l5 l6 

DH = [ t(1)       l1   l3    pi/2;
       t(2)+pi/2  0    l2    0;
       t(3)        0    0    pi/2;
       t(4)       l4    0    pi/2;
       t(5)+pi/2  0     l5   -pi/2;
       t(6)       l6    0      0 ]; % THETA d a ALPHA

theta=DH(:,1);
d=DH(:,2);
a=DH(:,3);
alp=DH(:,4);

T=eye(4);

for i=1:6
    % Crear matriz Ai
    eval(['A',num2str(i),'=[cos(theta(i)) -sin(theta(i))*cos(alp(i))  sin(theta(i))*sin(alp(i)) a(i)*cos(theta(i));' ...
         ' sin(theta(i))  cos(theta(i))*cos(alp(i)) -cos(theta(i))*sin(alp(i)) a(i)*sin(theta(i));' ...
         ' 0               sin(alp(i))                cos(alp(i))              d(i);' ...
         ' 0               0                          0                        1]'])

    % Mostrar matriz Ai
    fprintf('\nMatriz A%d:\n', i);
    eval(['disp(simplify(A',num2str(i),'))'])

    % Multiplicación acumulada
    eval(['T=T*A',num2str(i),';'])

    % Mostrar transformación acumulada
    fprintf('Transformación T0_%d:\n', i);
    disp(simplify(T))
end


%%Evaluacion de cinematica directa
l1=9.5;
l2=12;
l3=1.5;
l4=12.5;
l5=3.8;
l6=3.5;
t1=0*(pi/180)
t2=0*(pi/180)
t3=0*(pi/180)
t4=0*(pi/180)
t5=0*(pi/180)
t6=0*(pi/180)
eval(T)