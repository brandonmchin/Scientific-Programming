%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 1
% Due: October 1, 2015
% Brandon Chin
%==========================================================================

% Problem 1.3.2
% What is the probability that the quadratic function f(x) = ax^2 + bx + c
% has complex roots given that the three coefficients a, b, and c are
% random variables with uniform(0,1) distribution?
% What if they have normal(0,1) distribution?

disp('  n       (Uniform Coeff)     (Normal Coeff) ')
disp('--------------------------------------------------')
for n = 100:100:800
   
   % Uniformly distributed coefficients:
   a = rand(n,3);
   % The ith quadratic is a(i,1)x^2 + a(i,2)x + a(i,3). It has complex
   % roots if the discriminant a(i,2)^2 - 4*a(i,1)*a(i,3)<0
   prob_U = sum(a(:,2).^2 < 4*a(:,1).*a(:,3))/n;
   
   % Normally distributed coefficients:
   a = randn(n,3);
   % The ith quadratic is a(i,1)x^2 + a(i,2)x + a(i,3). It has complex
   % roots if the discriminant a(i,2)^2 - 4*a(i,1)*a(i,3)<0
   prob_N = sum(a(:,2).^2 < 4*a(:,1).*a(:,3))/n;
   
   disp(sprintf('%5d        %6.4f              %6.4f ',n,prob_U,prob_N));
end