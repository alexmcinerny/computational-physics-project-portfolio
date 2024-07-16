function [psi, historicalValues, converge] = solve_laplace(psiInitial, alpha, maxIterations, p, q, accuracyCriterion, psiTrue)
    
%     Author: Alex McInerny, Date: 07/12/2023
%     This function solves Laplace's equation (\del^2 \psi = 0) using the 
%       over-relaxation method. 
% 
%     Inputs:
%     * psi_initial: a 2D array containing the intial \psi, including boundary values.
%     * alpha: the coefficient of over-relaxation. 
%     * N_iterations: maximum number of iternations performed. 
%     * p, q: number of grids in the box, in the x and y direction. 
%     * accuracyCriterion: required level of accuracy
%     * psiTrue: analytic solution for psi. 
% 
%     Outputs:
%     * psi: a 2D array of the value of \psi up to N_iter iterations. 
%     * historical_values: a 2D array (N_iter x 3) of historical values of the iteration - 
%       one in the upper half, one in the middle, and one in the lower half. 
%     * converge: boolean indecating whether the function converged. 
% 
%     Constraints:
%     * The boundaries of \psi are kept constant during the iterations.

    % initiates variables used throught
    R = ones(p-2,q-2);
    psi = psiInitial;
    historicalValues = zeros(1,3);

    % applies successive over-relaxation
    for i1 = 1:maxIterations
        for j = 1:q-2
            for i = 1:p-2
                R(j,p-i-1) = psi(j+2,p-i) + psi(j,p-i) + psi(j+1,p+1-i) + ...
                    psi(j+1,p-1-i) - 4 * psi(j+1,p-i);
                psi(j+1,p-i) = psi(j+1,p-i) + alpha / 4 * R(j, p-i-1);
            end
        end
        
        historicalValues(i1, 1) = psiTrue(q-2,2) - psi(q-2,2); % saves sample values of psi each iteration
        historicalValues(i1, 2) = psiTrue(floor(q/2),floor(p/2)) - psi(floor(q/2),floor(p/2));
        historicalValues(i1, 3) = psiTrue(2,p-2) - psi(2,p-2);

        % checks if solution has conveged to required level. 
        if all(abs(R) < accuracyCriterion) == true(p-2,q-2)
            fprintf(['This sequence (alpha = %.15g) converged (all R_ij < %.15g)' ...
                ' within %.15g iterations.\n'], alpha, accuracyCriterion, i1);
            converge = true;
            break
        elseif i1 == maxIterations
            fprintf(['This sequence (alpha = %.15g) did not converge (some R_ij > %.15g)' ...
                ' within %.15g iterations.\n'], alpha, accuracyCriterion, i1);
            converge = false;
        else
            continue
        end
    end