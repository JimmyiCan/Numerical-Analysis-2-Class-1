function out = dydx(t, y)
  % This fcn returns the RHS system of equations for the catenary
  % system.

  global k

  y1 = y(1);  % y value
  y2 = y(2);  % y' value

  dy1dt = y2;
  dy2dt = -k.^2*y1;

  out = [dy1dt; dy2dt];
end
