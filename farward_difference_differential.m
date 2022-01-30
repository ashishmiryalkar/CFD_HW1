%This Function calculates farward difference differntial.
%Function function_value(x) gives value of the function at the point x
function y = farward_differnce_differential(x,h)
    y = (function_value(x+h)-function_value(x))/(h);
end