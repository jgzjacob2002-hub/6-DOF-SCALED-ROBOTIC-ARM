

syms l1 l2 l3 l4 l5 l6  t1 t2 t3 t4 t5 t6
qk=[t1;t2;t3;t4;t5;t6]


fq = [  sin(t6)*(cos(t4)*sin(t1) + sin(t4)*(cos(t1)*sin(t3)*sin(t2 + pi/2) - cos(t1)*cos(t3)*cos(t2 + pi/2))) + cos(t6)*(cos(t5 + pi/2)*(sin(t1)*sin(t4) - cos(t4)*(cos(t1)*sin(t3)*sin(t2 + pi/2) - cos(t1)*cos(t3)*cos(t2 + pi/2))) + sin(t5 + pi/2)*(cos(t1)*cos(t3)*sin(t2 + pi/2) + cos(t1)*cos(t2 + pi/2)*sin(t3)));
        -sin(t6)*(cos(t1)*cos(t4) + sin(t4)*(cos(t3)*cos(t2 + pi/2)*sin(t1) - sin(t1)*sin(t3)*sin(t2 + pi/2))) - cos(t6)*(cos(t5 + pi/2)*(cos(t1)*sin(t4) - cos(t4)*(cos(t3)*cos(t2 + pi/2)*sin(t1) - sin(t1)*sin(t3)*sin(t2 + pi/2))) - sin(t5 + pi/2)*(cos(t3)*sin(t1)*sin(t2 + pi/2) + cos(t2 + pi/2)*sin(t1)*sin(t3)));
                                                                                                                                                            cos(t6)*(cos(t2)*cos(t5)*sin(t3) + cos(t3)*cos(t5)*sin(t2) - cos(t2)*cos(t3)*cos(t4)*sin(t5) + cos(t4)*sin(t2)*sin(t3)*sin(t5)) - cos(t2 + t3)*sin(t4)*sin(t6);
         cos(t6)*(cos(t4)*sin(t1) + sin(t4)*(cos(t1)*sin(t3)*sin(t2 + pi/2) - cos(t1)*cos(t3)*cos(t2 + pi/2))) - sin(t6)*(cos(t5 + pi/2)*(sin(t1)*sin(t4) - cos(t4)*(cos(t1)*sin(t3)*sin(t2 + pi/2) - cos(t1)*cos(t3)*cos(t2 + pi/2))) + sin(t5 + pi/2)*(cos(t1)*cos(t3)*sin(t2 + pi/2) + cos(t1)*cos(t2 + pi/2)*sin(t3)));
         sin(t6)*(cos(t5 + pi/2)*(cos(t1)*sin(t4) - cos(t4)*(cos(t3)*cos(t2 + pi/2)*sin(t1) - sin(t1)*sin(t3)*sin(t2 + pi/2))) - sin(t5 + pi/2)*(cos(t3)*sin(t1)*sin(t2 + pi/2) + cos(t2 + pi/2)*sin(t1)*sin(t3))) - cos(t6)*(cos(t1)*cos(t4) + sin(t4)*(cos(t3)*cos(t2 + pi/2)*sin(t1) - sin(t1)*sin(t3)*sin(t2 + pi/2)));
- sin(t6)*(cos(t2)*cos(t5)*sin(t3) + cos(t3)*cos(t5)*sin(t2) - cos(t2)*cos(t3)*cos(t4)*sin(t5) + cos(t4)*sin(t2)*sin(t3)*sin(t5)) - cos(t2 + t3)*cos(t6)*sin(t4)- sin(t6)*(cos(t2)*cos(t5)*sin(t3) + cos(t3)*cos(t5)*sin(t2) - cos(t2)*cos(t3)*cos(t4)*sin(t5) + cos(t4)*sin(t2)*sin(t3)*sin(t5)) - cos(t2 + t3)*cos(t6)*sin(t4);
cos(t1)*sin(t2)*sin(t3)*sin(t5) - cos(t1)*cos(t2)*cos(t3)*sin(t5) - cos(t5)*sin(t1)*sin(t4) + cos(t1)*cos(t2)*cos(t4)*cos(t5)*sin(t3) + cos(t1)*cos(t3)*cos(t4)*cos(t5)*sin(t2);
cos(t1)*cos(t5)*sin(t4) - cos(t2)*cos(t3)*sin(t1)*sin(t5) + sin(t1)*sin(t2)*sin(t3)*sin(t5) + cos(t2)*cos(t4)*cos(t5)*sin(t1)*sin(t3) + cos(t3)*cos(t4)*cos(t5)*sin(t1)*sin(t2);
cos(t4)*cos(t5)*sin(t2)*sin(t3) - cos(t3)*sin(t2)*sin(t5) - cos(t2)*cos(t3)*cos(t4)*cos(t5) - cos(t2)*sin(t3)*sin(t5);
l3*cos(t1) - l2*cos(t1)*sin(t2) + l4*cos(t1)*cos(t2)*cos(t3) - l4*cos(t1)*sin(t2)*sin(t3) - l6*cos(t5)*sin(t1)*sin(t4) - l5*sin(t1)*sin(t4)*sin(t5) + l5*cos(t1)*cos(t2)*cos(t3)*cos(t5) - l6*cos(t1)*cos(t2)*cos(t3)*sin(t5) - l5*cos(t1)*cos(t5)*sin(t2)*sin(t3) + l6*cos(t1)*sin(t2)*sin(t3)*sin(t5) + l6*cos(t1)*cos(t2)*cos(t4)*cos(t5)*sin(t3) + l6*cos(t1)*cos(t3)*cos(t4)*cos(t5)*sin(t2) + l5*cos(t1)*cos(t2)*cos(t4)*sin(t3)*sin(t5) + l5*cos(t1)*cos(t3)*cos(t4)*sin(t2)*sin(t5);
l3*sin(t1) - l2*sin(t1)*sin(t2) + l4*cos(t2)*cos(t3)*sin(t1) + l6*cos(t1)*cos(t5)*sin(t4) + l5*cos(t1)*sin(t4)*sin(t5) - l4*sin(t1)*sin(t2)*sin(t3) + l5*cos(t2)*cos(t3)*cos(t5)*sin(t1) - l6*cos(t2)*cos(t3)*sin(t1)*sin(t5) - l5*cos(t5)*sin(t1)*sin(t2)*sin(t3) + l6*sin(t1)*sin(t2)*sin(t3)*sin(t5) + l6*cos(t2)*cos(t4)*cos(t5)*sin(t1)*sin(t3) + l6*cos(t3)*cos(t4)*cos(t5)*sin(t1)*sin(t2) + l5*cos(t2)*cos(t4)*sin(t1)*sin(t3)*sin(t5) + l5*cos(t3)*cos(t4)*sin(t1)*sin(t2)*sin(t5);
l1 + l2*cos(t2) + l4*cos(t2)*sin(t3) + l4*cos(t3)*sin(t2) + l5*cos(t2)*cos(t5)*sin(t3) + l5*cos(t3)*cos(t5)*sin(t2) - l6*cos(t2)*sin(t3)*sin(t5) - l6*cos(t3)*sin(t2)*sin(t5) - l6*cos(t2)*cos(t3)*cos(t4)*cos(t5) - l5*cos(t2)*cos(t3)*cos(t4)*sin(t5) + l6*cos(t4)*cos(t5)*sin(t2)*sin(t3) + l5*cos(t4)*sin(t2)*sin(t3)*sin(t5);
];
J=jacobian(fq,qk)