function heat_map_2d(psi, historicalValues, number, alpha, converge)

%     Author: Alex McInerny, Date: 07/12/2023
%     This function plots graphs of heatmaps to the approximate solutions to psi, 
%       as well as their convergance properties, and saves them as pngs. 
% 
%     Inputs:
%     * psi: a 2D array of the value of \psi up to N_iter iterations. 
%     * historical_values: a 2D array (N_iter x 3) of historical values of the iteration - 
%       one in the upper half, one in the middle, and one in the lower half. 
%     * number: figure number
%     * alpha: value of alpha for required plot
%     * converge: did the required plot converge?

    logicalString = {'false', 'true'};
    fprintf(['Figures %d for alpha = %.15g is saved as psi_heatmap_fig%d and ' ...
        'psi_historical_values_fig%d \n'], number, alpha, number, number);

    heatmap(psi); colormap default
    ax = gca; ax.FontSize = 14;
    title({sprintf('heatmap of psi for alpha = %.15g,', alpha), ...
        sprintf('convergance = %s', logicalString{converge + 1})})
    xlabel('x'); ylabel('y')
    savefig(sprintf('psi_heatmap_fig%d', number))
    saveas(gcf, sprintf('psi_heatmap_png_fig%d', number), 'png')

    bar(historicalValues, 'stacked'); ax = gca; ax.FontSize = 14;
    title({'bar chart of historical values of psi,',['sampled from ' ...
        'bottom left, middle, and top right']})
    legend({"bottom left", "middle", "top right"}, location = 'east')
    xlabel('iteration, i1'); ylabel('psi');
    savefig(sprintf('psi_historical_values_fig%d', number))
    saveas(gcf, sprintf('psi_historical_values_png_fig%d', number), 'png')