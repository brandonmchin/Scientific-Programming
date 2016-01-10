%==========================================================================
% CSc301 Scientific Computing, Homework Assignment 5
% Due: December 3, 2015
% Brandon Chin
%==========================================================================

% Problem 1
%
% An experiment to measure the intensity of light as a function of the
% distance from the source of the light produced the following data:
%
%  d |  30  |  35  |  40  |  45  |  50  |  55  |  60  |  65  |  70  |  75
% ---+------+------+------+------+------+------+------+------+------+------
%  i | 0.85 | 0.67 | 0.52 | 0.42 | 0.34 | 0.28 | 0.24 | 0.21 | 0.18 | 0.15

clear all;
close all;
clc;

d = [30, 35, 40, 45, 50, 55, 60, 65, 70, 75];
i = [0.85, 0.67, 0.52, 0.42, 0.34, 0.28, 0.24, 0.21, 0.18, 0.15];
length = length(d);

% Part A
% Find the best fit quadratic function.

coeff = polyfit(d, i, 2);   % finds the coefficients of degree 2 polynomial
i_fit1 = polyval(coeff, d); % finds a fitted i value for each d value
                            % i_fit1 = ax^2 + bx + c
                            % i_fit1 = (0.0004)d^2 - (0.0543)d + 2.1118

% Part B
% Find the best fit exponential function.

i_fit2 = fit(d',i','exp1');     % i_fit2 = a*exp(b*x)
                                % i_fit2 = (2.9078)*exp(-0.0419*d)

% Part C
% Find the interpolating polynomial.

format shortEng

% Given n points, the interpolating polynomial will be of at most order 
% n - 1.
%
% Since we have 10 data points, our polynomial p(d) will be of order 9.
%
% p(d) = 155.203e-015d^9 - 78.095e-012d^8 + 17.318e-009d^7 - 2.220e006d^6 + 
%   181.071e-006d^5 - 9.740e-003d^4 + 345.119e-003d^3 - 7.761d^2 + 
%   100.336d - 566.330

A = zeros(length,length);
for count1 = 1:length
    for count2 = 1:length
        A(count1,count2) = d(count1)^(length-count2);
    end
end

B = i';

poly_d_coeff = linsolve(A,B);
poly_d = polyval(poly_d_coeff, d);

format      % return to default format

% Part D
% Find the interpolating cubic spline.

%%%[a,b,c,d] = CubicSpline(d,i,1,1,1);

% Part E
% Plot these on the same graph.  Explain the difference, if any.

figure;

plot(d,i,'o', 'Color', 'black'); hold on;       % original data points
plot(d, i_fit1, '--', 'Color', 'red'); hold on; % best fit quadratic
plot(i_fit2, ':'); hold on;                     % best fit exponential 
plot(d, poly_d, 'Color', 'green');              % polynomial interpolation

xlabel('Distance'); ylabel('Intensity'); grid on;
legend('Original', 'Fitted Quadratic', 'Fitted Exponential', 'Polynomial Interpolation', 'Location', 'Northeast');
title('Light Intensity Interpolation');

% It appears that the polynomial interpolation seems to be the most acurate
% since it passes through every data point exactly.  It is also a
% polynomial of order 9, the highest of the three plots.
% Both the quadratic and the exponential best fit functions tend to miss a
% few points along the set but nonetheless still sufficiently represent the
% trend of the data set.  