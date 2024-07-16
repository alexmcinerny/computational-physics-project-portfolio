function plot_heatmap(spins, numGraphs, JkT, BkT)
%     Author: Alex McInerny, Date: 05/05/2024
%     This function plots an animation of all the spins, to see how they're
%     changing. 
% 
%     Inputs:
%     * spins: initial matrix of spins. Contains all the historical values
%     for it aswel. 
%     * numGraphs: The number of graphs you'd like in the tyled layout
%     (i.e., how many frames to be viewed)
%     * JkT, BkT: constants

    tiledlayout("flow","TileSpacing","compact", "Padding","compact")
    
    cmap = [[0,0,0]; [1,1,1]]; % white [1,1,1] is spin up


    for i1 = floor(linspace(1,length(spins), numGraphs)) %iterate through number of 
            %graphs wanted, and plot that specfic frame. done in tiled layout. 
        nexttile
        h = heatmap(spins(:,:,i1), 'Colormap', cmap ,'CellLabelColor','none');
        h.XDisplayLabels = nan(size(h.XDisplayData)); h.YDisplayLabels = nan(size(h.YDisplayData));
        title({sprintf('spins at frame %g', i1), sprintf('J/kT = %g, B/kT = %g', JkT, BkT)})
        clim([-1 1]);
        colorbar('off')
        grid off;
        h.FontSize = 14;
        drawnow;
    end

end