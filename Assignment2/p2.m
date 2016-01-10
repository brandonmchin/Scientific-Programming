%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 2
% Due: October 15, 2015
% Brandon Chin
%==========================================================================

% Problem 2a
% Show that the polynomials
%               P(x) = 3 - 2(x+1) + 0(X+1)(x) + (x+1)(x)(x-1)
% and
%             Q(x) = -1 + 4(x+2) - 3(x+2)(x+1) + (x+2)(x+1)(x)
% both interpolate the data
%   x   | -2 | -1 | 0 |  1 | 2
%   --------------------------
%   f(x)| -1 |  3 | 1 | -1 | 3

% Given a set of n data points, there is always a unique polynomial of
% degree n-1 which interpolates the set of points.  Uniqueness means there
% are no two polynomials of degree less than or equal to n-1 which
% interpolate the set of n points.

% In this case, both P(x) and Q(x) are actually equal and both
% satisfy the condition that for all i = 1:n, p(xi) = yi in each data set.

% P(x) = 3 - 2(x+1) + 0(x+1)(x) + (x+1)(x)(x-1)
%      = 3 - 2x - 2 + 0 + x^3 - x
%      = x^3 - 3x + 1

% Q(x) = -1 + 4(x+2) - 3(x+2)(x+1) + (x+2)(x+1)(x)
%      = -1 + 4x + 8 - 3(x^2+3x+2) + (x+2)(x^2+x)
%      = -1 + 4x + 8 - 3x^2 - 9x - 6 + x^3 + 3x^2 + 2x
%      = 1 - 5x + x^3 + 2x
%      = x^3 - 3x + 1

% f(-2) = (-2)^3 - 3(-2) + 1 = -1
% f(-1) = (-1)^3 - 3(-1) + 1 =  3
% f(0)  = (0)^3 - 3(0) + 1   =  1
% f(1)  = (1)^3 - 3(1) + 1   = -1
% f(2)  = (2)^3 - 3(2) + 1   =  3

%==========================================================================

% Problem 2b
% Why does part(a) not violate the uniquness property of interpolating
% polynomials?

% This does not violate the uniqueness property of interpolating
% polynomials for the reason stated above -- polynomials P(x) and Q(x) are
% both the same polynomial.