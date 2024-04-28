clc; clear all;

P = 1; %Transmit power

lambda = 2e-6; % Intensity
K = 1e-4;
R = 2000;
range_near = linspace(eps,R,50000);

gamma_vec = logspace(-4,3,20);
Cov_Analytical = zeros(1,length(gamma_vec));

for i = 1:length(gamma_vec)
    dist_near = 2*pi*lambda*range_near.*exp(-pi*lambda*range_near.^2);
    A = (gamma_vec(i)*range_near.^4);
    Integral_term = 0.5*sqrt(A).*(pi/2 - atan((range_near.^2)./sqrt(A)));
    Interference_term = exp(-2*pi*lambda*Integral_term);        
    Cov_Analytical(i) = trapz(range_near, Interference_term.*dist_near);
end
semilogx((gamma_vec), Cov_Analytical, '-o');
hold on

