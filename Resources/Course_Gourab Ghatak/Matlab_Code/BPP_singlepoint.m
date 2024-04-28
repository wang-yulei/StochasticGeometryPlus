clc; clear all;

P = 0.1;
R = 10;
N0 = 4e-13;
gamma_vec = logspace(-3.5,-1,30);
total = 2000;

Cov_sim = zeros(1,length(gamma_vec));

for i = 1:length(gamma_vec)
    for iter = 1:total
        r = R*sqrt(rand);
        Pow = P*r^(-2);
        if Pow > gamma_vec(i)
            Cov_sim(i) = Cov_sim(i) + 1/total;
        end
    end
end
Cov_ana = (1/R^2)*(P./(gamma_vec));

plot(pow2db(gamma_vec), Cov_sim, '*')
hold on
plot(pow2db(gamma_vec), min(1, Cov_ana))