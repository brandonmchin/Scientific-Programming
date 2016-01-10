%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 2
% Due: October 15, 2015
% Brandon Chin
%==========================================================================

% Problem 1
% Let f(x) = e^x, for 0 <= x <= 2

%==========================================================================

% Problem 1a
% Approximate f(0.25) using linear interpolating with x0 = 0 and x1 = 0.5.

% From this, we can derive the (x,y) points to be (x0,y0) = (0,1) and
% (x1,y1) = (0.5,e^1/2).

% Then we can use the equation for a value y along a straight line between
% two points 
%                   y = y0 + (y1 - y0)(x - x0)/(x1 - x0)
%
% Plugging in our values we get y = (0.5e^(0.5)) + 0.5 which is
% approximately 1.32436

%==========================================================================

% Problem 1b
% Approximate f(0.75) using linear interpolating with x0 = 0.5 and x1 = 1.

% Similar to the problem above, we can derive the points (x0,y0) =
% (0.5,e^(0.5)) and (x1,y1) = (1,e).

% Then we can plug in our values to the equation and get 
% y = e^(0.5) + (e - e^(0.5))(0.5) which is about 2.1835

%==========================================================================

% Problem 1c
% Approximate f(0.25) and f(0.75) by using the second degree interpolating
% polynomial with x0 = 0, x1 = 1, and x2 = 2.

% Data points (x0,y0) = (0,1)
%             (x1,y1) = (1,c)
%             (x2,y2) = (2,e^2)

% Generally, our interpolant function will be 
%
%              p(x) = c1 + c2(x - x0) + c3(x - x0)(x - x1)
% 
% where, c1 = y0
%        c2 = (y1 - c1)/(x1 - x0)
%        c3 = (y2 - (c1 + c2(x2 - x0)))/((x2 - x0)(x2 - x1))

% Solving for c values,
% c1 = 1
% c2 = (e - 1)/(1 - 0) = e - 1
% c3 = (e^2 - (1 + (e - 1)(2 - 0)))/((2 - 0)(2 - 1)) = (e^2 - 2e + 1)/2

% Evaluating p(x)
% p(0.25) = 1 + (e - 1)(0.25 - 0) + ((e^2-2e+1)/2)(0.25 - 0)(0.25 - 1)
%         approximately 1.24504
%
% p(0.75) = 1 + (e - 1)(0.75) + ((e^2-2e+1)/2)(0.75)(0.75 - 1)
%         approximately 2.01192

%==========================================================================

% Problem 1d
% Which approximations are better and why?

% The second degree polynomial interpolation in problem 1c produced a more
% accurate approximation than the linear interpolation in problem 1a and
% 1b.  This is because with polynomial interpolation we are generating a
% fitted curve function that passes through the target points. In 
% comparison to the linear interpolation, we are only evaluating a point on
% a straight line between to points on the curve, which can lead to greater
% margins of error.