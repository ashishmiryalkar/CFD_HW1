function [ a,E ] = myLinReg( x,y )
%myLinReg calculates the linear least squares regression to the
%         data given in x,y
% Input:
%   x: vector of measured x data to fit
%   y: vector of measured y data to fit
% Ouput:
%   a: vector of coefficients for linear fit y=a(1)+a(2)*x
%   E: error of fit (sum of residual squares)
% check that length of x and y vector are equal 
if length(x) ~= length(y)
    disp('Error: length of data vectors x and y must be the same')
    return
end
% calculate and store the sum terms
Sx = sum(x);
Sy = sum(y);
Sxx = sum(x.*x);
Sxy = sum(x.*y);
n = length(x);
% calculate linear equation coefficients
a(1) = (Sxx*Sy-Sxy*Sx)/(n*Sxx-Sx*Sx);
a(2) = (n*Sxy-Sx*Sy)/(n*Sxx-Sx*Sx);
% calculate error
E = sum((y-(a(2)*x+a(1))).^2);
end