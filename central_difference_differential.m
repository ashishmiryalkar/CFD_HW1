%This Function calculates central difference differntial.
%Function function_value(x) gives value of the function at the point x
function y = central_difference_differential(x,h)
    y = (function_value(x+h)-function_value(x-h))/(2*h);
end