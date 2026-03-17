
clear
clc
%valores de solucion aproximada
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

qk=[t1;t2;t3;t4;t5;t6]

xd=[1;0;0;
    0;-1;0;
    0;0;-1;
   17.8;0;18];

% SIMULADO
% xd=[0;0;1;             Rango MAX
%     0;-1;0;
%     1;0;0;
%    30.7026;19.889;35.7060];

% % xd=[0;0;1;             Rango MIN
%     0;-1;0;
%     1;0;0;
%    -11.0529;-19.8883;-5.9583];

eps=0.001
alp=0.5;

for j=1:50

[fq]=fq_original(t1,t2,t3,t4,t5,t6,l1,l2,l3,l4,l5,l6)
J=jacobo(l1,l2,l3,l4,l5,l6,t1,t2,t3,t4,t5,t6)
q=qk+alp*pinv(J)*(xd-fq);

    if (abs(sum(xd-fq))<eps)
        q=q;j
        
        break
    end
    qk=q;
end

