% Sintoniza apenas em relação ao overshoot.
function [custo] = custo2(ts, overshoot)
    global erro ref overshoot_spec;
    custo = sum(min(erro+ref*overshoot_spec,0))^2 + exp(min(erro));
end