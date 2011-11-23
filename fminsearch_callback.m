function [fval] = fminsearch_callback(x)
    global P I D erro ref % Variaveis compartilhadas com a simulação
    global step max_ts custo % Variaveis compartilhadas com o callback

    % Valores padrão para ts e overshoot
    overshoot = Inf;
    ts = Inf;
    
    P = x(1);
    I = x(2);
    D = x(3);
    
    if numel(erro) > 0
        overshoot = -min(erro) / ref;
        positive_indexes = find(erro<0);
        if numel(positive_indexes)
            ts = (positive_indexes(1)) * step;
        end
    end
    
    sim('trabalho1', 0:step:max_ts); % Realiza a simulação

    fval = custo(ts, overshoot);
    util = [fval overshoot ts P I D]; % Imprime alguns valores úteis
end
