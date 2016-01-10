%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 4
% Due: November 12, 2015
% Brandon Chin
%==========================================================================

% Problem 2
% Plot f(x) = sin(1/x) and g(x) = cos(1/x) on [0,1,2].  Use Adaptive
% quadrature to approximate the integral of these functions from x = 0.1 to 
% x = 2 to within 10^-3.

sym x;
f = sym('sin(1.0/x)');
g = sym('cos(1.0/x)');
a = 0.1;
b = 2.0;
bound = 10^-3;
n = 2;
m = 3;

[f_n, f_appx] = AdaptQuad(f, a, b, 2*n, m, bound, 0, 0); 

[g_n, g_appx] = AdaptQuad(g, a, b, 2*n, m, bound, 0, 0);
f_exp = double(int(f, a, b));
g_exp = double(int(g, a, b));

f_e = abs(f_appx - f_exp);
g_e = abs(g_appx - g_exp);

% tabular prints
fprintf('========================================================\n')
fprintf('   func         appx         expect         error\n')
fprintf('--------------------------------------------------------\n')
fprintf('  %s   %2.8f     %2.8f     %2.8f\n', 'sin(1/x)', f_appx, f_exp, f_e)
fprintf('--------------------------------------------------------\n')
fprintf('  %s   %2.8f     %2.8f     %2.8f\n', 'cos(1/x)', g_appx, g_exp, g_e)
fprintf('========================================================\n')

% plot f(x) and g(x)
figure 
ezplot(f, [0.1, 2])
figure 
ezplot(g, [0.1, 2])