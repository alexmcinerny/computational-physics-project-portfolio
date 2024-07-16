function plot_JkTList_vs_averageAbsM(N, BkT, numIterations, spins)
%     Author: Alex McInerny, Date: 05/05/2024
%     This function plots an animation of all the spins, to see how they're
%     changing. 
% 
%     Inputs:
%     * spins: initial matrix of spins. Contains all the historical values
%     for it aswel. 
%     * numIterations: Number of sweeps completed in main. 
%     * N: Size of the spin matrix. 
%     * BkT: constant

    %initialise constants
    numAverage = 20;
    numTemperatures = 30;
    JkTList = linspace(0,1,numTemperatures);
    
    for i3 = 1:numAverage %iterate over averaging procdure
        for i2 = 1:numTemperatures %iterate through the list of temperatures
            for i1 = 1:numIterations %same procedure as in main, but with more dim arrays
                spins(:,:,i1+1) = sweep(spins(:,:,i1), N, JkTList(i2), BkT);
                M(i1, i2, i3) = sum(spins(:,:,i1), "all");
                cumulativeM(i1, i2, i3) = sum(M, 'all');
            end
            averageAbsM(i2) = mean(abs(M(numIterations, i2, :)));
        end
    end
    
    %plot graphs!
    figure
    plot(JkTList, averageAbsM)
    title({'The average absolute magnitude of magnetisation vs ' ...
        sprintf('a list of values of J/kT for B/kT = %g', BkT)}, 'FontSize', 14)
end