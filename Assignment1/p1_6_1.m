%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 1
% Due: October 1, 2015
% Brandon Chin
%==========================================================================

% Problem 1.6.1 

error = zeros(100,1);

for i = 1:length(error)
    
    x = randn(5,1);
    y = randn(5,1);
    
    expected = x'*y;
    actual = Convert(dot3(x,y)); 
    
    error(i) = expected - actual;
end

ploterrhist(error);     % by default, it used 20 bins