%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 3
% Due: October 29, 2015
% Brandon Chin
%==========================================================================

% Problem 2
% P3.3.10, p.133
%
% In computerized typography the problem arises of finding an interpolant
% to points that lie on a path in the plane ( e.g., a printed capital S ).
% Such a shape cannot be represented as a function of x because it is not
% single valued.  One approach is to number the points (x1,y1),...,(xn,yn)
% as we traverse the curve.  Let di be the straight-line distance between
% (xi,yi) and (xi+1,yi+1), i = 1:n-1.  Set ti = d1 + ... + di-1, i = 1:n.
% Suppose Sx(t) is a spline interpolant of (t1,x1),...,(tn,xn) and that
% Sy(t) is a spline interpolant of (t1,y1),...,(tn,yn).
% 
% It follows that the curve A = {(Sx(t),Sy(t)):t1 <= t <= tn} is smooth and
% passes through the n points.  Write a function [xi,yi] =
% SplineInPlane(x,y,m) that returns in xi(1:m) and yi(1:m) the x-y
% coordinates of m points on the curve A.  Use the Spine function to
% determine the splines Sx(t) and Sy(t).  
%
% To test SplineInPlane write a script that solicits an arbitrary number of
% points from the plot window using ginput.  It should echo your 
% mouseclicks by placing an asterisk at each point.  After all the points
% are acquired it should compute the splines Sx and Sy defined above and
% then plot the curve A.  Use hold on so that the asterisks are also
% displayed.  
% 
% Submit listings and sample output showing a personally designed letter
% "S".  The number of input points used is up to you. 

close all
theta = linspace(0,2*pi)';
xvals = 5*cos(theta);
yvals = 3*sin(theta);

for n = 5:4:13
   theta = linspace(0,2*pi,n)';
   x = 5*cos(theta);
   y = 3*sin(theta);
   [xi,yi] = SplineInPlane(x,y,100);
   figure
   plot(xvals,yvals,xi,yi,x,y,'o')
   axis('equal')
   pause
end