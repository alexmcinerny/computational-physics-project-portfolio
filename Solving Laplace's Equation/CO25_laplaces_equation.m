clc
clear variables
format long

% declare dimensions of domain and relevant variables. 
p = 7;
q = 7;
length_x = 1;
length_y = 1;
delta_x = length_x / (p - 1);
delta_y = length_y / (q - 1);

%initialise psi, specify boundary conditions.
psiInitial = zeros(p, q);

for i1 = 1:p
    psiInitial(1, i1) = sin((i1 - 1) * delta_x) * sinh(1); %top
    psiInitial(q, i1) = 0; %bottom
end
for i2 = 1:q
    psiInitial(q-i2+1, 1) = 0; %left
    psiInitial(q-i2+1, p) = sin(1) * sinh((i2 - 1) * delta_y); %right
end

psiTrue = analytic_solution(p, q);

% maximum number of iterations and accuracy criterion
maxIterations = 30;
accuracyCriterion = 0.01;

% specify alpha (or calculate it) (from hereout, working under constraint p = q)
alpha_chosen = 1.35;
alpha_optimal = 2 / (1 + sin(pi / p));
alpha = alpha_optimal;

% initialiselists and cell arrays
psiList = {};
historicalValuesCellArray = {};
convergeList = {};

% iterate thorugh desired alpha values, call solve_laplace, plot and display data. 
alphaList = [alpha, 1.1, 1.25, 1.45, 2.1];

% apply function for each alpha, and call plotting function. 
for i3 = 1:length(alphaList)
    [psiList{i3}, historicalValuesCellArray{i3}, convergeList{i3}] = ...
        solve_laplace(psiInitial, alphaList(i3), maxIterations, p, q, accuracyCriterion, psiTrue);
    heat_map_2d(psiList{1, i3}, historicalValuesCellArray{1, i3}, i3, alphaList(i3), convergeList{1, i3});
    disp('The final calculated scalar field \psi was: ');
    disp(psiList{1, i3});
    disp('And the historical values for \psi in the; bottom left, middle, top left, are: ');
    disp(historicalValuesCellArray{1, i3});
end