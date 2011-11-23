clear all
close all
warning off

global ref P I D % Variaveis compartilhadas com a simulação
global ts_spec overshoot_spec step max_ts custo % Variaveis compartilhadas com o callback

step = 0.001; % Passo da simulação
max_ts = 4; % Tempo de simulação
ref = 3; % Referencia
ts_spec = 1.2; % Tempo de subida especificado
overshoot_spec = .2; % Overshoot especificado

K = [1.5 1 1]; % [P I D] inicial

custo = @custo4; % Escolhe a função para cálculo do custo

options = optimset('PlotFcns', @optimplotfval, 'MaxFunEvals', 100, 'Display', 'iter');
[Kmin, fval] = fminsearch('fminsearch_callback', K, options)