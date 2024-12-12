% Zadanie 3
clc; clear; close all;

% Funkcja
f1 = @(x) 2 * exp(-x) .* sin(2 * x);

% Parametry
a = 0;
b = 2 * pi;
N = 10; % Liczba węzłów
x_plot = linspace(a, b, 200);

% Równomierne węzły
x_nodes = linspace(a, b, N);
y_nodes = f1(x_nodes);

% Funkcja sklejana
spline_interp = spline(x_nodes, y_nodes, x_plot);

% Wykres
figure;
plot(x_plot, f1(x_plot), 'k', 'LineWidth', 1.5); % Funkcja rzeczywista
hold on;
plot(x_nodes, y_nodes, 'o'); % Węzły
plot(x_plot, spline_interp, '--'); % Interpolacja

xlabel('x');
ylabel('f(x)');
title('Interpolacja funkcjami sklejanymi');
legend('Funkcja rzeczywista', 'Węzły', 'Interpolacja sklejana');
