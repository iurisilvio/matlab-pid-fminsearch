% Não sintoniza corretamente.
function [custo] = custo1(ts, overshoot)
    global erro ts_spec overshoot_spec;
    % Várias constantes foram testadas, nenhuma funcionou.
    k1 = 100;
    k2 = 1;
    custo = k1 * (ts - ts_spec)^2 + k2 * (overshoot - overshoot_spec)^2;
end