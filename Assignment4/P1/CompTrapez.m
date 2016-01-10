%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 4
% Due: November 12, 2015
% Brandon Chin
%==========================================================================

function [t_appx, t_exp, t_e, t_bound_flag, t_n, t_h] = CompTrapez(f, a, b, bound)
% Use Composite Trapezoidal Rule to determine
% the ideal number of intervals required
% to approximate input function f to within
% input bound, as well as the value of the 
% approximation and expected, and value of error.
%
% Parameters:
%      f:  sym
%        the function to approximate
%      a, b : num
%        the start and end point of the integration, respectively
%      bound : num
%        the numeric range of acceptance of the approximation
% Usage:
%     [t_appx, t_exp, t_e, t_bound_flag, t_n, t_h] =  CompTrapez(f, a, b, bound)

% first, find the second derivative of f and determine the f"(mu) in the 
% interval mu = [a, b]
f_2 = diff(diff(f));
f2_mu_a = subs(f_2, {'x'}, {a});
f2_mu_b = subs(f_2, {'x'}, {b});
f2_mu_mid = subs(f_2, {'x'}, {(a+b)/2});
f2_mu = max( double( [f2_mu_a, f2_mu_mid, f2_mu_b] ));

% next, find the step length h
% recall E_tpz is |((b-a) f"(mu) h^2 / 12)| <= acceptance bound after 
% algebraic --> h^2 = (bound * 12) / ((b-a)*f"(mu))
top = bound * 12;
bottom = (b-a) * f2_mu;
t_h = sqrt(top / bottom);

% finally, t_n is t_h = (b-a)/t_n
t_n = (b-a)/t_h;
t_n = ceil(t_n);

% now find the value of the approximation
num_pts = t_n + 1;
xs = [a:t_h:b];
xs(num_pts) = b;  % we need to include the end point.
fxk(1:num_pts) = subs(f, {'x'}, {xs(1:num_pts)});
t_appx = double(trapz(xs, fxk)); % approximation

t_exp = double(int(f, a, b));  % expected value
t_e = double(abs(t_exp - t_appx)); % error 
t_bound_flag = t_e <= bound;