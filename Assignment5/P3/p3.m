%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 5
% Due: December 3, 2015
% Brandon Chin
%==========================================================================

% Problem 3
%
% 7.1.1
% 
% Consider the problem: min ||[1;1;1]x - [b1;b2;b3]||p
% where p = 1,2,or INFINITY.  Suppose b1 >= b2 >= b3.  Show that 
%   p = 1           => xopt = b2
%   p = 2           => xopt = (b1 + b2 + b3)/3
%   p = INFINITY    => xopt (b1 + b3)/2

close all;
clear;
clc;

n = 100;
b = sort(rand(3,1));
b = b(3:-1:1);
A = [1;1;1];
x = linspace(-1,1,n);
p1   = zeros(n,1);
p2   = zeros(n,1);
pinf = zeros(n,1);

for i=1:n
   p1(i)   = norm(A*x(i)-b,1);
   p2(i)   = norm(A*x(i)-b,2);
   pinf(i) = norm(A*x(i)-b,'inf');
end

figure;
plot(x, p1, 'Color', 'blue'); hold on;
plot(x, p2, 'Color', 'green'); hold on;
plot(x, pinf, 'Color', 'red'); hold on;
plot([b(2),b(2)], [0,6], '--', 'Color', 'blue'); hold on;
plot([sum(b)/3, sum(b)/3], [0,6], '--', 'Color', 'green'); hold on;
plot([(b(1) + b(3))/2, (b(1) + b(3))/2], [0,6], '--', 'Color', 'red');

legend(sprintf('1-norm: minimum at %5.3f', b(2)), sprintf('2-norm: minimum at %5.3f', sum(b)/3), sprintf('inf-norm: minimum at %5.3f', (b(1)+b(3))/2), 'Location', 'Northwest');
title('Problem 7.1.1');
