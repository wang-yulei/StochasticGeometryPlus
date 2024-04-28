clc; clear all;

gamma_vec = logspace(-8,-2,30);
R = 100;
P = 0.1;
Cov = zeros(1,length(gamma_vec));
nb = 1;
experiments = 2000;

for i = 1:length(gamma_vec)
    gamma0 = gamma_vec(i);
    for iter = 1:experiments
        d_vec = R*sqrt(rand(1,nb));
        dmin = min(d_vec);
        Rec_pow = P*min(dmin)^(-2);
        if Rec_pow > gamma0
            Cov(i) = Cov(i) + 1;
        end
    end
    Cov(i) = Cov(i)/experiments;
end

plot(pow2db(gamma_vec),Cov);
hold on
plot(pow2db(gamma_vec), min(1,(1/R^2)*(P./gamma_vec)),'*');