function [x, y] = bvp(y10, y11)
  % This fcn performs shooting method to solve the catenary BVP over the
  % interval x = [0, 1].  The inputs are the initial y value y1(0) and
  % final y value y1(1).  The BVP equation is defined in the file
  % dydx.m.  The returns are [x, y] where x is a vector of the x values
  % and y is a vector of the chain heights.

  global a;
  global b;
  a = 2;
  b = 0.1;

  % Parameters for shooting method
  tol = 1e-3;
  Ntrials = 50;

  % Parameters for ode solver
  opts = odeset('RelTol',1e-4);  % Solution tolerance.

  % Use binary search to find appropriate value for deriv y2(0).  These
  % are min and max starting guesses.
  y20max = 0;
  y20min = -20;

  % Iterate for Ntrials.  Don't use a "while" loop because it can iterate forever,
  % causing apparent system hang due to infinite loop.
  for idx = 1:Ntrials
    % Calculate initial guess for slope as midpoint of min and max.
    y20 = (y20max + y20min)/2;

    % Compute solution to IVP using ode45
    s = ode45 (@dydx, [0 100], [y10, y20], opts);

    % Get computed value at right hand end of chain.
    y11trial = s.y(1, end);  % computed end value y(1)
    fprintf('y20max = %f, y20min = %f, y20 = %f, y11trial = %f\n', y20max, y20min, y20, y11trial)

    % Check if we're done
    if (abs(y11trial - y11) < tol)
      % Close enough.  We're done.  Return computed function.
      x = s.x;
      y = s.y(1, :);
      return
    end

    % Must try again.  Narrow search limits and iterate.
    if (y11trial > y11)
      % Must decrease initial guess
      y20max = y20;
    else
      % Must increase initial guess
      y20min = y20;
    end
    
  end
  % If we get here it's because we did not converge.
  error('Did not converge!')

end
