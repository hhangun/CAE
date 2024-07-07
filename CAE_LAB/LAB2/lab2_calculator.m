clear;

% addpath('./functions');

L  = 150e-3;                 % [m]
b  = 40e-3;                  % [m]
h  = 6e-3;                   % [m]

E = 5.0;
G = 1500;
R = 120;
GF = 2.13;

I = b*h^3/12;

m     = [1.0, 2.0, 3.0];        % [kg]
P     = m.*9.81;

mom   = P.* 0.15;               % [Nm] : 150 mm arm

def   = [2.67, 5.31, 8.40];     def = def.*1e-3;        % [m]
eout  = [0.34, 0.69, 1.08];

E1_nom = zeros(4,1);    E1_denom = zeros(4,1);
E2_nom = zeros(4,1);    E2_denom = zeros(4,1);
delta_R = zeros(3,1);   eps = zeros(3,1);   sig = zeros(3,1);

% why E1_nom = [0 E1_nom] doesn't work ?
for Idx = 2 : 4

    delta_R(Idx-1)  = 4*R*eout(Idx-1)/(E*G);
    eps(Idx-1)      = delta_R(Idx-1)/(R*GF);
    sig(Idx-1)      = mom(Idx-1) * (h/2) / I;

    E1_nom(Idx)   = P(Idx-1) * L^3;
    E1_denom(Idx) = 3 * def(Idx-1) * I;
    E2_nom(Idx)   = sig(Idx-1);
    E2_denom(Idx) = eps(Idx-1);
    
end

deg = 1;

E1_coef = polyfit(E1_denom, E1_nom, deg);
fitted_E1 = E1_coef(1) * E1_denom + E1_coef(2);
E2_coef = polyfit(E2_denom, E2_nom, deg);
fitted_E2 = E2_coef(1) * E2_denom + E2_coef(2);

figure;
plot(E1_denom, E1_nom, 'bo', lineWidth = 0.5);
hold on;
plot(E1_denom, fitted_E1, 'r-', lineWidth = 1.0);
grid minor;     legend('data point', 'fitted line', fontSize = 12);
title("E estimation");    xlabel("3\deltaI");     ylabel("PL^3");

figure;
plot(E2_denom, E2_nom, 'bo', lineWidth = 0.5);
hold on;
plot(E2_denom, fitted_E2, 'r-', lineWidth = 1.0);
grid minor;     legend('data point', 'fitted line', fontSize = 12);
title("E estimation");    xlabel("\epsilon");     ylabel("\sigma");


