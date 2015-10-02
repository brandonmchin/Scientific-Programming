%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 1
% Due: October 1, 2015
% Brandon Chin
%==========================================================================

% Problem 1.5.1

function [d,err] = Derivative(fname,a,delta,M2,M3)
    % [d,err] = Derivative(fname,a,delta,M2);
    % fname a string that names a function f(x) whose derivative
    % at x = a is sought. delta is the absolute error associated with
    % an f-evaluation and M2 is an estimate of the second derivative
    % magnitude near a. d is an approximation to f’(a) and err is an 
    % estimate of its absolute error.

    hopt = 2*sqrt(delta/M2);
    d = (feval(fname,a+hopt) - feval(fname,a))/hopt;
    err = 2*sqrt(delta*M2);

    hopt2 = (6 * delta / M3).^(1/3);
    c = (feval(fname, a+hopt2) - feval(fname, a-hopt2))/(2*hopt2);
    cerr = (M3/6) *((6*delta)/M3)^(2/3) + (M3/3) * (6*delta/M3)^(1/3);
     
    if err > cerr
        d = c;
        err = cerr;
    end
end