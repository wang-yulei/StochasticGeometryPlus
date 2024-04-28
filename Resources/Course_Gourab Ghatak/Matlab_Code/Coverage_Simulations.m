clc; clear all;

P = 1; %Transmit power

lambda = 2e-6; % Intensity
K = 1e-4;
R = 5000;
realizations = 2000;


gamma_vec = logspace(-4,4,20);
CovProb = zeros(1,length(gamma_vec));

for i = 1:length(gamma_vec)

    for j = 1:realizations
        N_points = poissrnd(lambda*pi*R^2);

        
        dist_vec = R*sqrt(rand(1,N_points));

        Signal = exprnd(1)*(K*P*min(dist_vec)^(-4));
        Interference = ((K*P*(dist_vec(dist_vec ~= min(dist_vec))).^(-4))) .* exprnd(1,1,N_points -1);
        
        if Signal/(sum(Interference)) > gamma_vec(i)
            CovProb(i) = CovProb(i) + 1/realizations;
        end
    end
end
semilogx(gamma_vec, CovProb);
hold on

