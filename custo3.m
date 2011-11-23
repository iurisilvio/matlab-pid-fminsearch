% Esse custo tenta sintonizar apenas em relação ao tempo de subida.
% Não funciona.
function [custo] = custo3(ts, overshoot)
    global ts_spec;
    custo = exp(ts - ts_spec);
end