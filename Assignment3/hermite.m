%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 3
% Due: October 29, 2015
% Brandon Chin
%==========================================================================

function [A,Q] = hermite(x,f,fp)
    n = length(x);
    z = zeros(2*n,1);
    Q = zeros(2*n,2*n);
    for i=1:n
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1,1) = f(i);
        Q(2*i,1) = f(i);
        Q(2*i,2) = fp(i);
        if i ~= 1
            Q(2*i-1,2) = ( Q(2*i-1,1)-Q(2*i-2,1) )/( z(2*i-1)-z(2*i-2) );
        end
    end
    
    for i=3:2*n
        for j=3:i
            Q(i,j) = ( Q(i,j-1)-Q(i-1,j-1) )/( z(i)-z(i-j+1) );
        end
    end
    A = diag(Q);
    fprintf('Polynomial is:\n');
    fprintf('%.3f',A(1));
    for i=2:2*n

fprintf('%+.3f',A(i));
        for j=1:(i-1)
            fprintf('(x%+.3f)',-z(j));
        end
    end
    fprintf('\n');
end