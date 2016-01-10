%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 2
% Due: October 15, 2015
% Brandon Chin
%==========================================================================

% Problem 2.4.4
% Analogous to LinInterp2D, write a function
% CubicInterp2D(xc,yc,a,b,n,c,d,m,fA) that does cubic interpolation from a
% matrix of f(x,y) evaluations.  Start by figuring out "where" (xc,yc) is
% in the grid with respect to x = linspace(a,b,n) and y = linspace(c,d,m).

function z = CubicInterp2D(x,y,a,b,n,c,d,m,fA)
%
%  n,m:      integers >=2
%  x,a,b:    scalars that satisfy a<=x<\=b 
%  y,c,d:    scalars that satisfy c<=y<=d
%  fA:       an n-by-m matrix with the property that
%              fA(i,j) = f(a+(i-1)(b-a)/(n-1),c+(j-1)(d-c)/(m-1))
%              for some function f(.,.). 
% Post:
%    z:        cubically interpolated value for f(x,y).
%   
% Determine where in the grid the point is located.

hx = (b-a)/(n-1);
i  = max([1 ceil((x-a)/hx)]);
hy = (d-c)/(m-1);
j  = max([1 ceil((y-c)/hy)]); 
% Adjust for edge effects
if (1 < i)&&(i < n-1)
   % not on an edge
   ivals = (i-1):(i+2);
elseif 1==i
   % on left edge
   ivals = 1:4;
else
   % on right edge
   ivals = n-3:n;
end 
if (1 < j)&&(j < m-1)
   % not on an edge
   jvals = (j-1):(j+2);
elseif 1==j
   % on bottom edge
   jvals = 1:4;
else
   % on top edge
   jvals = m-3:m;
end

% Determine coordinates of the grid points.   
xvals = c + (ivals-1)*hx;  
yvals = c + (jvals-1)*hy;  

% call Small2D with the appropriate 4x4 subgrid:
z = Small2D(x,y,xvals',yvals',fA(ivals,jvals));