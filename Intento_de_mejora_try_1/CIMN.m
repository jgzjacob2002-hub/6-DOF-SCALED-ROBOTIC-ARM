function qk = CIMN(qk, xd, t1, t2, t3, t4, t5, t6, l1, l2, l3, l4, l5, l6)

    % LÍMITES DE LOS ÁNGULOS EN RADIANES
    LIM_INF = [-pi/2, -pi/2, -0.6108, -pi/2, -pi/2, -pi/2];
    LIM_SUP = [+pi/2, +pi/2, +2.53073, +pi/2, +pi/2, +pi/2];

    for j = 1:50
        fq = fq_original(t1, t2, t3, t4, t5, t6, l1, l2, l3, l4, l5, l6);
        J = jacobo(l1, l2, l3, l4, l5, l6, t1, t2, t3, t4, t5, t6);
        q = qk + pinv(J) * (xd - fq);

        % Aplicar límites (saturación) a los ángulos
        for k = 1:6
            q(k) = max(LIM_INF(k), min(LIM_SUP(k), q(k)));
        end

        % Actualizar ángulos actuales para la siguiente iteración
        t1 = q(1); t2 = q(2); t3 = q(3); t4 = q(4); t5 = q(5); t6 = q(6);

        % Criterio de parada
        if abs(sum(xd - fq)) < 1e-3
            break
        end

        qk = q;
    end
end
