%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 4
% Due: November 12, 2015
% Brandon Chin
%==========================================================================

function ans = CompositeSimpson(func,a,b,n)
% Perform simple composite Simpson's Rule.
%
% Parameters:
%      func:  sym
%        the function to approximate
%      a, b : num
%        the start and end point of the integration, respectively
%      n : num
%        number of intervals
%      plotf : bool
%        1 to plot, 0 otherwise
% Usage:
%     ans = CompositeSimpson(func,a,b,n, plotf)

if mod(n, 2) == 1
    n = 2 * n;
end

h = (b - a) / n;
fa = func(a); % S is continuing sum

for i = 1 : 2 : n %all odd steps
    x(i) = a + h .* i;
    y(i) = 4 * func(x(i));
end

for i = 2 : 2 : n-1 %all even
    x(i) = a + h .* i;
    y(i) = 2 * func(x(i));
end

fb = func(b);
%S = S + func(b);
ans = h * (fa+fb+sum(y)) / 3;

end