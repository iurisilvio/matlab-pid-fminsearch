clear all
close all
warning off

global A B % Matrizes do espaço de estados
global ref P I D % Variaveis compartilhadas com a simulação
global ts_spec overshoot_spec step t_max % Variaveis compartilhadas com o callback

A = [0 -1 0; -81 0 0; 1 0 0];
B = [0; 3000; 0];

step = 0.1; % Passo da simulação
t_max = 6; % Tempo de simulação
ref = 1; % Referencia
ts_spec = 1; % Tempo de subida especificado
overshoot_spec = .1; % Overshoot especificado

K = [1.76 1 1]; % [P I D] inicial

% Q = [a(1) a(2) a(3); a(2) a(4) a(5); a(3) a(5) a(6)]; R = a(7);
% Q simétrica
a = [1 0 0 1 0 1 1];

options = optimset('PlotFcns', @optimplotfval);
Kmin = fminsearch('fminsearch_callback', a, options) % É possível alterar 'a' para 'K'
