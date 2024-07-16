%     Author: Alex McInerny, Date: 
%     The main function of my ferromagnetism project; it is designed to
%     initialise all vairables, iterate a certain number of times, applying
%     the sweep function, storing required information, then call of the 
%     required graphing funcitons.
clc
clear variables

%initialise constants
N = 30;
BkT = 0.01;
JkT = 5;
numSweeps = 100;

%initialise spin array. 
spins(:,:,1) = (-1).^randi(2,N,N);
% spinInitial = ones(N,N);

%% 
%iterate through for the required number of sweeps. Calculate the new spin
%matrix and also M and cumulativeM, and store them in vectors. 
for i0 = 1:numSweeps
    spins(:,:,i0+1) = sweep(spins(:,:,i0), N, JkT, BkT);
    M(i0) = sum(spins(:,:,i0), "all");
    cumulativeM(i0) = sum(M, 'all');
end

%required plots. 
plot_animation(spins)
numGraphs = 9;
plot_heatmap(spins, numGraphs, JkT, BkT)
plot_bar(M, cumulativeM, JkT, BkT)
%%

%plot of averageAbsM against JkT. In it's own section so it can be ran
%separately (as it may take time).
plot_JkTList_vs_averageAbsM(N, BkT, numSweeps, spins(:,:,1))