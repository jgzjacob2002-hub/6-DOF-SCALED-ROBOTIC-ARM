function Graf(l1,l2,l3,l4,l5,l6,t1,t2,t3,t4,t5,t6,Px,Py,Pz)
 cla;
 s=40;%Longitud de los ejes fijos
 line([0 s], [0 0], [0 0], 'color', 'r') %linea de referencia x, color rojo
 line([0 0], [0 s], [0 0], 'color', 'g') %linea de referencia y, color verde
 
 % Primer Articulacion
 x0=0;  %Calcula la Px del eslabon 1
 y0=0;  %Calcula la Py del eslabon 1
 z0=l1;
 line([0 x0], [0 y0], [0 z0], 'color', 'm','LineWidth', 4)
 x1=l3*cos(t1);  %Calcula la Px del eslabon 1
 y1=l3*sin(t1);  %Calcula la Py del eslabon 1
 z1=z0;
 line([x0 x1], [y0 y1], [z0 z1], 'color', 'm','LineWidth', 4)
 % Segunda Articulacion
 %Linea el eslabon 2,desde 0 a x2 en X, desde 0 hasta Y2 en Y, Ancho 4 y Color Magenta
 x2=cos(t1)*(l3 - l2*sin(t2));  %Calcula la Px del eslabon 1
 y2= sin(t1)*(l3 - l2*sin(t2));  %Calcula la Py del eslabon 1
 z2= l1 + l2*cos(t2);
 line([x1 x2], [y1 y2], [z1 z2], 'color', 'g','LineWidth', 4)
 % Tercera Articulacion
 %Linea el eslabon 2,desde 0 a x2 en X, desde 0 hasta Y2 en Y, Ancho 4 y Color Magenta
 x3=cos(t1)*(l3 - l2*sin(t2));  %Calcula la Px del eslabon 1
 y3= sin(t1)*(l3 - l2*sin(t2));  %Calcula la Py del eslabon 1
 z3=l1 + l2*cos(t2);
 line([x2 x3], [y2 y3], [z2 z3], 'color', 'g','LineWidth', 4)
 % Cuarta Articulacion
 %Linea el eslabon 2,desde 0 a x2 en X, desde 0 hasta Y2 en Y, Ancho 4 y Color Magenta
 x4=cos(t1)*(l3 + l4*cos(t2 + t3) - l2*sin(t2));  %Calcula la Px del eslabon 1
 y4= sin(t1)*(l3 + l4*cos(t2 + t3) - l2*sin(t2));  %Calcula la Py del eslabon 1
 z4=l1 + l4*sin(t2 + t3) + l2*cos(t2);
 line([x3 x4], [y3 y4], [z3 z4], 'color', 'b','LineWidth', 4)
 % Quinta Articulacion
 %Linea el eslabon 2,desde 0 a x2 en X, desde 0 hasta Y2 en Y, Ancho 4 y Color Magenta
 x5=l3*cos(t1) - l2*cos(t1)*sin(t2) + l4*cos(t1)*cos(t2)*cos(t3) - l4*cos(t1)*sin(t2)*sin(t3) - l5*sin(t1)*sin(t4)*sin(t5) + l5*cos(t1)*cos(t2)*cos(t3)*cos(t5) - l5*cos(t1)*cos(t5)*sin(t2)*sin(t3) + l5*cos(t1)*cos(t2)*cos(t4)*sin(t3)*sin(t5) + l5*cos(t1)*cos(t3)*cos(t4)*sin(t2)*sin(t5);  %Calcula la Px del eslabon 1
 y5=l3*sin(t1) - l2*sin(t1)*sin(t2) + l4*cos(t2)*cos(t3)*sin(t1) + l5*cos(t1)*sin(t4)*sin(t5) - l4*sin(t1)*sin(t2)*sin(t3) + l5*cos(t2)*cos(t3)*cos(t5)*sin(t1) - l5*cos(t5)*sin(t1)*sin(t2)*sin(t3) + l5*cos(t2)*cos(t4)*sin(t1)*sin(t3)*sin(t5) + l5*cos(t3)*cos(t4)*sin(t1)*sin(t2)*sin(t5);  %Calcula la Py del eslabon 1
 z5=l1 + l2*cos(t2) + l4*cos(t2)*sin(t3) + l4*cos(t3)*sin(t2) + l5*cos(t2)*cos(t5)*sin(t3) + l5*cos(t3)*cos(t5)*sin(t2) - l5*cos(t2)*cos(t3)*cos(t4)*sin(t5) + l5*cos(t4)*sin(t2)*sin(t3)*sin(t5);
 line([x4 x5], [y4 y5], [z4 z5], 'color', 'b','LineWidth', 4)
 % Sexta Articulacion
 %Linea el eslabon 2,desde 0 a x2 en X, desde 0 hasta Y2 en Y, Ancho 4 y Color Magenta
 x6=l3*cos(t1) - l2*cos(t1)*sin(t2) + l4*cos(t1)*cos(t2)*cos(t3) - l4*cos(t1)*sin(t2)*sin(t3) - l6*cos(t5)*sin(t1)*sin(t4) - l5*sin(t1)*sin(t4)*sin(t5) + l5*cos(t1)*cos(t2)*cos(t3)*cos(t5) - l6*cos(t1)*cos(t2)*cos(t3)*sin(t5) - l5*cos(t1)*cos(t5)*sin(t2)*sin(t3) + l6*cos(t1)*sin(t2)*sin(t3)*sin(t5) + l6*cos(t1)*cos(t2)*cos(t4)*cos(t5)*sin(t3) + l6*cos(t1)*cos(t3)*cos(t4)*cos(t5)*sin(t2) + l5*cos(t1)*cos(t2)*cos(t4)*sin(t3)*sin(t5) + l5*cos(t1)*cos(t3)*cos(t4)*sin(t2)*sin(t5);  %Calcula la Px del eslabon 1
 y6=l3*sin(t1) - l2*sin(t1)*sin(t2) + l4*cos(t2)*cos(t3)*sin(t1) + l6*cos(t1)*cos(t5)*sin(t4) + l5*cos(t1)*sin(t4)*sin(t5) - l4*sin(t1)*sin(t2)*sin(t3) + l5*cos(t2)*cos(t3)*cos(t5)*sin(t1) - l6*cos(t2)*cos(t3)*sin(t1)*sin(t5) - l5*cos(t5)*sin(t1)*sin(t2)*sin(t3) + l6*sin(t1)*sin(t2)*sin(t3)*sin(t5) + l6*cos(t2)*cos(t4)*cos(t5)*sin(t1)*sin(t3) + l6*cos(t3)*cos(t4)*cos(t5)*sin(t1)*sin(t2) + l5*cos(t2)*cos(t4)*sin(t1)*sin(t3)*sin(t5) + l5*cos(t3)*cos(t4)*sin(t1)*sin(t2)*sin(t5);  %Calcula la Py del eslabon 1
 z6=l1 + l2*cos(t2) + l4*cos(t2)*sin(t3) + l4*cos(t3)*sin(t2) + l5*cos(t2)*cos(t5)*sin(t3) + l5*cos(t3)*cos(t5)*sin(t2) - l6*cos(t2)*sin(t3)*sin(t5) - l6*cos(t3)*sin(t2)*sin(t5) - l6*cos(t2)*cos(t3)*cos(t4)*cos(t5) - l5*cos(t2)*cos(t3)*cos(t4)*sin(t5) + l6*cos(t4)*cos(t5)*sin(t2)*sin(t3) + l5*cos(t4)*sin(t2)*sin(t3)*sin(t5);
 line([x5 x6], [y5 y6], [z5 z6], 'color', 'k','LineWidth', 4)

 % Dibujar articulaciones
 %(px,py,color y simbolo, tamaño, color relleno)
 plot3(0, 0, 0, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Base
 plot3(x1, y1, z1, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Articulación 1
 plot3(x2, y2, z2, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Efector final
 plot3(x3, y3, z3, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Base
 plot3(x4, y4, z4, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Articulación 1
 plot3(x5, y5, z5, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Efector final
 plot3(x6, y6, z6, 'ko', 'MarkerSize', 5, 'MarkerFaceColor', 'r'); % Efector final
 plot3(Px,Py,Pz) %Grafica la trayectoria a seguir
grid on %Habilita el mallado
hold on %Mantiene en el grafico la figura actual
end