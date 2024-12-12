% Zadanie 2
clc; clear; close all;

% Funkcja
f1 = @(x) 2 * exp(-x) .* sin(2 * x);

% Parametry
a = 0;
b = 2 * pi;
N_values = 4:2:20;
x_plot = linspace(a, b, 200);

% Przygotowanie wykresów
figure;
hold on;
plot(x_plot, f1(x_plot), 'k', 'LineWidth', 1.5);

errors_chebyshev = zeros(size(N_values));

for k = 1:length(N_values)
    N = N_values(k);
    
    % Węzły Czebyszewa
    x_nodes = 0.5 * (a + b) + 0.5 * (b - a) * cos((2*(1:N)-1) * pi / (2*N));
    y_nodes = f1(x_nodes);
    
    % Interpolacja
    p = polyfit(x_nodes, y_nodes, N-1);
    y_interp = polyval(p, x_plot);
    
    % Obliczenie błędu
    errors_chebyshev(k) = max(abs(f1(x_plot) - y_interp));
    
    % Wykres
    plot(x_nodes, y_nodes, 'o');
    plot(x_plot, y_interp, '--');
end

xlabel('x');
ylabel('f(x)');
title('Interpolacja wielomianowa z węzłami Czebyszewa');
legend('Funkcja rzeczywista', 'Interpolacja', 'Węzły');

% Błąd interpolacji
figure;
plot(N_values, errors_chebyshev, '-o');
xlabel('Liczba węzłów');
ylabel('Maksymalny błąd');
title('Błąd interpolacji dla węzłów Czebyszewa');
