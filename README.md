# Steepest Descent with Projection in a Two-Variable Function

This project was created as part of a course assignment for the **Optimization techniques** class at **ECE, AUTH University**.

This project explores optimization techniques using the **Steepest Descent Method**, both with and without **projection constraints**. The function being minimized is:

$$ f(x_1, x_2) = \frac{1}{3} x_1^2 + 3 x_2^2 $$

However, the function can be modified to suit different test cases.

## Optimization Methods

1. **Steepest Descent**
   - Performed with a **specified step size**, **epsilon**, and **starting point**.

2. **Steepest Descent with Projection**
   - Constraints:
     - $x_1 \in [-10, 5]$
     - $x_2 \in [-8, 12]$
   - Runs with different **step sizes** ($s_k$), **learning rates** ($\gamma_k$), and **starting points** to compare results.
This implementation evaluates the effect of varying parameters on the function's minimization using steepest descent with projection technique.

## Files

- **assignment3.m** – Main script executing all optimization methods.
- **steepestdecentmethod3.m** – Implementation of the **Steepest Descent Method**.
- **steepestdecentmethodwprojection.m** – Implementation of the **Steepest Descent Method with Projection**.

## Usage

Run the script assignment3.m in MATLAB. This will execute all optimization procedures and attempt to find a local minimum (if convergence is achieved).

## Future Work

- Extending to higher-dimensional functions.
- Testing different types of constraints (e.g., nonlinear constraints).
