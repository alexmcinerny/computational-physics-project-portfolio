function [spin] = sweep(spin, N, JkT, BkT)
%     Author: Alex McInerny, Date: 05/05/2024
%     This function randomly sweeps through the spins array, calculates the
%     change of energy for each point, and flips the spin if it reaches the
%     dresired condition. After sweeping the entire grid (visiting each
%     point in a random order one time), it returns the swept matrix. 
% 
%     Inputs:
%     * spin: initial matrix of spins. 
%     * N: Size of the spin matrix. 
%     * JkT, BkT: constants.
% 
%     Returns:
%     * spin: matrix containing the spins after a full sweep. 

    for i1 = randperm(N*N)%start iterating through the random list of numbers

        [i,j] = ind2sub(size(spin), i1);%convert number to inxed. 

        DeltaEkT = 2 * spin(i,j) * ( JkT * ( ... %calcualte change in energy
            spin(mod(i-2,N)+1, j) + ... above
            spin(mod(i,N)+1, j) + ... below
            spin(i, mod(j-2,N)+1) + ... left
            spin(i, mod(j,N)+1) ) - ... right
            BkT );
        %work out if spin should be flipped, and do it if required. 
        if or( DeltaEkT <= 0, rand() <= exp( - DeltaEkT) )
            spin(i,j) = - spin(i,j);

        end

    end
    
end