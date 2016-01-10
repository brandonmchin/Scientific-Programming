%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 4
% Due: November 12, 2015
% Brandon Chin
%==========================================================================

% Problem 3
% Determine constants a, b, c, and d that will produce a quadrature formula
% 
%   f(x)dx = af(-1) + bf(1) + cf'(-1) + df'(1) from x = -1 to x = 1
%
% that has degree of precision 3.

syms a b c d;

% We want the formula to hold for polynomials
%   f(x) = x^0 --> 2        = a*1 + b*1 + c*0 + d*0
%   f(x) = x^1 --> 0        = a*-1 + b*1 + c*1 + d*1
%   f(x) = x^2 --> (2/3)    = a*1 + b*1 + c*-2 + d*2
%   f(x) = x^3 --> 0        = a*-1 + b*1 + c*3 + d*3
%
% Now we must solve the following matrix
%   +-             -+   +- -+   +-   -+
%   | 1   1   0   0 |   | a |   |  2  |
%   |-1   1   1   1 |   | b | = |  0  |
%   | 1   1  -2   2 |   | c |   | 2/3 |
%   |-1   1   3   3 |   | d |   |  0  |
%   +-             -+   +- -+   +-   -+

M = [1 1 0 0; -1 1 1 1; 1 1 -2 2; -1 1 3 3];
t = [a b c d]';
rs = [2 0 2/3 0]';
sol = solve(M * t == rs);

fprintf('a = %3.3f, b = %3.3f, c = %3.3f, d = %3.3f\n', double(sol.a), double(sol.b), double(sol.c), double(sol.d))