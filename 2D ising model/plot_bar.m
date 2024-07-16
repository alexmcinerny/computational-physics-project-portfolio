function plot_bar(M, cumulativeM, JkT, BkT)
%     Author: Alex McInerny, Date: 05/05/2024
%     This function plots bar graphs of the magnetic moment, and cumulative
%     magnetic moment of a spin matrix. 
% 
%     Inputs:
%     * M: vector containing the magnetic moments of a spin matrix for 
%       every iteration. 
%     * cumulativeM: matrix containing the sum of all the previous magnetic
%     moments, updated each iteration. 
%     * JkT, BkT: constants.

    figure; 
    tiledlayout(2,1, "TileSpacing","tight", "Padding","compact");

    nexttile
    h = bar(M);
    title({'Magnetic moment (MM), ' ...
        sprintf('J/kT = %g and B/kT = %g', JkT, BkT)},'FontSize', 10)
    axis square
    h.EdgeColor = 'none';

    nexttile
    h = bar(cumulativeM);
    title({'Cumulative MM, ' ...
        sprintf('J/kt = %g and B/kT = %g', JkT, BkT)},'FontSize', 10)
    axis square
    h.EdgeColor = 'none';

end