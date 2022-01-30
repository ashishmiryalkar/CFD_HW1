%This Function calculates mixed third order differntial.
%Function function_value(x) gives value of the function at the point x
function y = mixed_third_order_finite_difference(x,h)
    y = (-function_value(x+2*h)+6*function_value(x+h)-3*function_value(x)-2*function_value(x-h))/(6*h);
end