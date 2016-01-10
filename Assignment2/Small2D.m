function z = Small2D(x,y,xvals,yvals,fvals)
%
% x and y are scalars representing the point at which to interpolate f
% xvals and yvals are column 4-vectors with
%     xvals(1) < xvals(2) < xvals(3) < xvals(4)
%     yvals(1) < yvals(2) < yvals(3) &ly yvals(4)
% fvals is a 4x4 matrix of evaluations of f at the xvals,yvals coords.
%
% Let p1 be the cubic interpolant of (xvals(q),fvals(q,1)), q=1:4.
% Let p2 be the cubic interpolant of (xvals(q),fvals(q,2)), q=1:4.
% Let p3 be the cubic interpolant of (xvals(q),fvals(q,3)), q=1:4.
% Let p4 be the cubic interpolant of (xvals(q),fvals(q,4)), q=1:4.
%
% Let p be the cubic interpolant of the four points
%                    (yvals(1),p1(x))
%                    (yvals(2),p2(x))
%                    (yvals(3),p3(x))
%                    (yvals(4),p4(x))
%
%      z = p(y).

fy = zeros(4,1);
for k=1:4
   c = InterpN(xvals,fvals(:,k));  % interpolate horizontally
   fy(k) = HornerN(c,xvals,x);     % evaluate interpolants at x
end

c = InterpN(yvals,fy);   % interpolate vertically 
z = HornerN(c,yvals,y);  % evaluate interpolant at y