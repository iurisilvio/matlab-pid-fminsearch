function [fval] = fminsearch_callback(x)
    global A B
    global P I D ref Yout % Variaveis compartilhadas com a simulação
    global ts_spec overshoot_spec % Variaveis compartilhadas com o callback

    [rows columns] = size(x);
    
    % Para funcionar a sintonização também com x=[P I D]
    if columns == 3
        K = x;
        P = K(1);
        I = K(2);
        D = K(3);
    elseif columns == 7
        Q = [x(1) x(2) x(3);
             x(2) x(4) x(5);
             x(3) x(5) x(6)];
        R = x(7);
        K = lqr(A, B, Q, R);
        P = -K(1);
        I = K(2);
        D = -K(3);
    else
        disp('Valor não previsto para "x" na função fminsearch_callback.');
    end
    
    sim('simulacao'); % Realiza a simulação
    y = Yout.signals.values;
    t = Yout.time;
    overshoot = (max(y) - ref) / ref;
    ts_index = find(y > ref, 1);
    if isempty(ts_index)
        ts = ts_spec;
    else
        ts = t(ts_index);
    end
    fval = abs(overshoot - overshoot_spec) / overshoot_spec + abs(ts - ts_spec) / ts_spec;
    util = [fval overshoot ts]; % Imprime alguns valores úteis
end
