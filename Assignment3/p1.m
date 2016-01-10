%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 3
% Due: October 29, 2015
% Brandon Chin
%==========================================================================

% Problem 1
% A car travelling along a straight road is clocked at a number of points.
% The data from the observations are given in the following table, where
% the time is in seconds, the distance is in feet, and the speed is in feet
% per second.

% +----------+----+-----+-----+-----+-----+
% | Time     | 0  | 3   | 5   | 8   | 13  |
% +----------+----+-----+-----+-----+-----+
% | Distance | 0  | 225 | 383 | 623 | 993 |
% +----------+----+-----+-----+-----+-----+
% | Speed    | 75 | 77  | 80  | 74  | 72  |
% +----------+----+-----+-----+-----+-----+

%==========================================================================
% Part A
% Use cubic Hermite interpolation to predict the position of the car and
% its speed when t = 10s.

x = [0, 3, 5, 8, 13];
f = [0, 225, 383, 623, 993];
fp = [75, 77, 80, 74, 72];
[A,Q] = hermite(x, f, fp);

% Output
% Polynomial p(x) is:
% 0.000+75.000(x-0.000)+0.000(x-0.000)(x-0.000)+0.222(x-0.000)(x-0.000)
% (x-3.000)-0.031(x-0.000)(x-0.000)(x-3.000)(x-3.000)-0.006(x-0.000)
% (x-0.000)(x-3.000)(x-3.000)(x-5.000)+0.002(x-0.000)(x-0.000)(x-3.000)
% (x-3.000)(x-5.000)(x-5.000)-0.001(x-0.000)(x-0.000)(x-3.000)(x-3.000)
% (x-5.000)(x-5.000)(x-8.000)+0.000(x-0.000)(x-0.000)(x-3.000)(x-3.000)
% (x-5.000)(x-5.000)(x-8.000)(x-8.000)-0.000(x-0.000)(x-0.000)(x-3.000)
% (x-3.000)(x-5.000)(x-5.000)(x-8.000)(x-8.000)(x-13.000)
%
% Position of car at t = 10s is p(10) = 742.503 ft
% Speed of car at t = 10s is p'(10) = 48 ft/s

%==========================================================================
% Part B
% Use the derivative of the Hermite interpolant to determine whether the
% car ever exceeds a 55mi/h speed limit on the road.  If so, what is the
% first time the car exceeds this speed?

% ( See graph of p'(x) on other page )
%
% Converting mi/h to ft/s we get 55 mi/h = 80.67 ft/s
% Then, we can see on the graph that 80.67 ft/s is somewhere between t = 5
% and t = 6.  Using the bisection method, we get t = 5.645s.

%==========================================================================
% Part C
% What is the predicted maximum speed for the car?

% Again, using the graph, the maximum speed is somewhere between t = 12 and
% t = 13.
% Computing p''(x) and the bisection method, we get a maximum speed of
% 119.417 ft/s at t = 12.3737s.