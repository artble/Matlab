% Zadanie 1
clc; clear; close all;

% Definicja funkcji
f1 = @(x) 2 * exp(-x) .* sin(2 * x);

% Parametry
a = 0;
b = 2 * pi;
N_values = 4:2:20; % Liczba węzłów od 4 do 20
x_plot = linspace(a, b, 200); % 200 punktów do oceny błędu

% Przygotowanie wykresów
figure;
hold on;
plot(x_plot, f1(x_plot), 'k', 'LineWidth', 1.5); % Funkcja rzeczywista

errors = zeros(size(N_values));

for k = 1:length(N_values)
    N = N_values(k);
    
    % Równomierne węzły
    x_nodes = linspace(a, b, N);
    y_nodes = f1(x_nodes);
    
    % Interpolacja
    p = polyfit(x_nodes, y_nodes, N-1);
    y_interp = polyval(p, x_plot);
    
    % Obliczenie błędu
    errors(k) = max(abs(f1(x_plot) - y_interp));
    
    % Wykres
    plot(x_nodes, y_nodes, 'o');
    plot(x_plot, y_interp, '--');
end

xlabel('x');
ylabel('f(x)');
title('Interpolacja wielomianowa z węzłami równomiernymi');
legend('Funkcja rzeczywista', 'Interpolacja', 'Węzły');

% Błąd interpolacji
figure;
plot(N_values, errors, '-o');
xlabel('Liczba węzłów');
ylabel('Maksymalny błąd');
title('Błąd interpolacji dla węzłów równomiernych');
