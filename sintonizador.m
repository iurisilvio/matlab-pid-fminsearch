clear all
close all
warning off

global ref P I D % Variaveis compartilhadas com a simulação
global step t_max custo % Variaveis compartilhadas com o callback

step = 0.01; % Passo da simulação
t_max = 6; % Tempo de simulação
ref = 1; % Referencia
ts_spec = 1; % Tempo de subida especificado
overshoot_spec = .1; % Overshoot especificado

K = [1.76 1 1]; % [P I D] inicial

custo = @(ts, overshoot) abs(overshoot-overshoot_spec)+abs(ts-ts_spec);

options = optimset('PlotFcns', @optimplotfval);
Kmin = fminsearch('fminsearch_callback', K, options)