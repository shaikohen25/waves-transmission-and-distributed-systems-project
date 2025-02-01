

clear; close all; clc;

% Constants
epsilon_0 = 8.85e-12;
mu_0 = 4 * pi * 1e-7;
f = 10^10;
vp = 1.5e8;
l = 0.1;
ZL = 150; % Load impedance
Z0 = 75;  % Characteristic impedance
Rg = 50;  % Generator resistance
w = 2 * pi * f;
L = Z0 / vp;
C = 1 / (Z0 * vp);

% User Input
N = input('Enter number of discretization points: ');
dz = l / N;

% Initialize Matrices
A = zeros(2 * N + 2);
b = zeros(2 * N + 2, 1);

% Construct Matrix Equations for Transmission Line
for i = 1:N-1
    A(i, i) = 1;
    A(i, i+2) = -1;
    A(i, N+2+i) = -1j * 2 * w * dz * L;
    A(N-1 + i, i+1) = -1j * 2 * w * dz * C;
end

% Boundary Conditions
A(N, 1) = 1;  % Source connection
A(N, N+2) = -Rg;
A(2*N, N) = 1;
A(2*N, end) = -ZL;

% Solve System
x = A \ b;
V = x(1:N+1);
I = x(N+2:end);

% Plot Results
figure;
plot(linspace(0, l, N+1), abs(V));
title('Voltage Distribution');
xlabel('Position along the Transmission Line');
ylabel('|V|');

grid on;

figure;
plot(linspace(0, l, N+1), abs(I));
title('Current Distribution');
xlabel('Position along the Transmission Line');
ylabel('|I|');
grid on;

% Impedance Matching Analysis
f_range = linspace(0.88e10, 1.115e10, 100);
tan_f = tan((pi .* f_range .* l) / vp);
Zin = Z0 .* (ZL + 1j .* Z0 .* tan_f) ./ (Z0 + 1j .* ZL .* tan_f);
gamma_in = (Zin - Z0) ./ (Zin + Z0);

figure;
plot(f_range, abs(gamma_in));
title('Reflection Coefficient vs Frequency');
xlabel('Frequency (Hz)');
ylabel('|\Gamma_{in}|');
grid on;
