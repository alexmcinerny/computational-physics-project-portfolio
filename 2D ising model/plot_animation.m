function plot_animation(spins)
%     Author: Alex McInerny, Date: 05/05/2024
%     This function plots an animation of all the spins, to see how they're
%     changing. 
% 
%     Inputs:
%     * spins: initial matrix of spins. Contains all the historical values
%     for it aswel. 
    
    %initialise constants
    N = size(spins, 3);
    frame_dist = 10;

    F(N) = struct('cdata',[],'colormap',[]); %create structure. 

    cmap = [[0,0,0]; [1,1,1]]; % white [1,1,1] is spin up
    for j = 1:floor(N/frame_dist) %iterate through the required frames and plot them. 
        h = heatmap(spins(:,:,j*frame_dist), 'Colormap', cmap ,'CellLabelColor','none');
        h.XDisplayLabels = nan(size(h.XDisplayData)); h.YDisplayLabels = nan(size(h.YDisplayData));
        set(gcf, 'Position',  [100, 100, 750, 750]);
        clim([-1 1]);
        colorbar('off')
        grid off;
        drawnow;
        F(j) = getframe(gcf);
    end
    
    %print gif. 
    fig = figure;
    set(gcf, 'Position',  [100, 100, 750, 750]);
    movie(fig,F,1)
end