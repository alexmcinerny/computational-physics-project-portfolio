<h1>Computational Physics Projects Portfolio</h1>

Basically I intend for this to be the repo where I leave a some projects I've been working on. Don't judge my code too harshly... I'm only doing this to get <i>better</i> at programming! 

<h2>Projects</h2>

<h3>2D Ising Model (Mar 2024)</h3> 

The 2D Ising model is numerically analysed in MATLAB to provide insight on how ferromagnetic atomic spins behaviour in conditions of changing temperature and external magnetic field. The metropolis-hastings algorithm is used, and periodic boundary conditions are employed to recreate conditions you’d find in a real-life material. An animation is produced to visualise in-time how the spins are changing. In the report, we confirm that at low temperatures, steady states are quickly reached, whereas at higher temperatures spins flip much more randomly, and at exceedingly high temperatures flipping is nearly random. We confirm experimentally that the critical temperature at which a phase shift occurs between the two states is at $J/k_BT_c \approx 0.44$ when no external magnetic field is applied. We also confirm that the presence of a magnetic field means spins are more likely to align in a particular direction, and that the critical temperature is increased in a way correlated with the strength of the field.

<h3>Solving Laplace's Equation (Dec 2023)</h3> 

We used the successive over-relaxation method in MATLAB to numerically approximate a 2D solution of Laplace’s equation (using finite differences) in a uniform, square grid with specified, distinct boundary conditions on each edge. For different over-relaxation parameters and given boundary conditions, we plotted heat maps of the approximation and analyse the nature with which the algorithm converges to the true (analytic) solution to a desired degree of accuracy. We verified that the optimal over relaxation parameter ($\alpha \approx 1.39$) provides fast convergence, and one that is not within the valid range (1 to 2) leads to an incorrect, divergent solution. Furthermore, we discuss how for small $\alpha$, convergence is monotonic, however oscillatory nature increases as $\alpha$ increases.
