clc; clear all; close all;

lambda= 1e-6;
realizations = 5000;
R = 1000;

range= linspace(0,R,20);
dist_distribution = zeros(1,length(range));

for j = 1:length(range)
    d_index = range(j);
    for i = 1:realizations
        N_points = poissrnd(lambda*pi*R^2);
        dist_vec = R*sqrt(rand(1,N_points));

        if min(dist_vec) < d_index
            dist_distribution(j) = dist_distribution(j) + 1/realizations;
        end
    end
end

plot(range, dist_distribution, '*');
hold on
plot(range, 1 - exp(-lambda * pi * range.^2 ))

xlabel('Distance of the Nearest Point')
ylabel('CDF')
legend('Simulations','Analytical')

