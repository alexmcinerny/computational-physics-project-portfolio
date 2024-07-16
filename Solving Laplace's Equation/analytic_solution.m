function [psiTrue] = analytic_solution(p, q)
    
%     Author: Alex McInerny, Date: 07/12/2023
%     This function plots and retuerns the analytic solution to laplace's equation. 
% 
%     Inputs:
%     * p, q: related to the number of descrete points inside the domain. 

    x = linspace(0,1,p); y = linspace(0,1,q); psiTrue = zeros(p,q);
    
    for j = 1:length(y)
        for i = 1:length(x)
            psiTrue(q+1-j,i) = sin(x(i)) * sinh(y(j));
        end
    end
    
    heatmap(psiTrue); colormap default; ax = gca; ax.FontSize = 14;
    title('heatmap of analytic solution to psi'); xlabel('x'); ylabel('y'); 
    saveas(gcf, 'psi_analytic_solution_heatmap', 'png')