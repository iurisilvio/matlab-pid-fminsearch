function [fval] = fminsearch_callback(x)
    global P I D ref % Variaveis compartilhadas com a simulação
    global step t_max custo % Variaveis compartilhadas com o callback

    % Valores padrão para ts e overshoot
    P = x(1);
    I = x(2);
    D = x(3);
    
    [t, state] = sim('simulacao', 0:step:t_max); % Realiza a simulação
    y = state(:, 5);
    
    overshoot = (max(y) - ref) / ref;
    ts_index = find(y > ref, 1);
    if isempty(ts_index)
        ts = ts_spec;
    else
        ts = t(ts_index);
    end
    fval = custo(ts, overshoot);
    util = [fval overshoot ts] % Imprime alguns valores úteis
end
