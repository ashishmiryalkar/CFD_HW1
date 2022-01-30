%using long format for the output
format long g
% creating an array of size 3*33 of zeros for storing points information
points = zeros(3,33);    
% x is the point of evaluation for the differential
x = 2;
% for a given point x, and the interval distance(h) between points
% farward_difference_differential calculates farward difference differential,
% central_difference_differential calculates central difference differential,
% mixed_third_order_finite_difference calculates given third order differential
% and stores them into the points array
for each_k = -2:1:30
    h = 2^(-each_k);
    points(1,each_k+3) = farward_difference_differential(x,h);
    points(2,each_k+3) = central_difference_differential(x,h);
    points(3,each_k+3) = mixed_third_order_finite_difference(x,h);
end
% calculating differential value, expression is derived by hand.
diff_val = ((x^4)*(sin(x)+cos(x))-4*(x^3)*cos(x)-3)/exp(x);
% errors stores absolute differences between differential value and
% numerical calculated value.
% errors_log stores the log values for errors array.
errors = zeros(3,33);
errors_log = zeros(3,33);
for each_row = 1:1:3
    for each_col = 1:1:33
        errors(each_row,each_col) = abs(diff_val-points(each_row,each_col));
        errors_log(each_row,each_col) = log(errors(each_row,each_col));
    end
end
% h_vals stores all the values of h for k=-2,33
% log_h stores log values of hvals
h_vals = zeros(1,33);
log_h = zeros(1,33);
for each_k = -2:1:30
    h_vals(each_k+3) = 2^(-each_k);
    log_h(each_k+3) = -(each_k)*log(2);
end
%log log plot for the values
for each_figure=1:1:3
    loglog(h_vals,errors(each_figure,:));
    hold on
    loglog(h_vals,errors(each_figure,:),'s');
    hold on
end
title("log|e| vs log(h) values graph");
xlabel('log(h)');
ylabel('log|e|');
grid on;
legend("curve of farward difference differential","points for farward differnce differential","curve of central difference differential","points for central differnce differential","curve of mixed third order finite difference","points for mixed third order finite difference")
% identified nearby asymtotic region values from graph.this is done by
% visual inspection.
graph_asymtotic_values = [10^-8 1; 3e-6 4; 10^-4 0.5];
for each_graph=1:1:3
    %filtering out asymptotic region values
    start_index = -1;
    end_index = -1;
    for each_point=1:1:33
        if start_index==-1 && h_vals(each_point)<graph_asymtotic_values(each_graph,2)
            start_index = each_point;
        end
        if end_index==-1 && h_vals(each_point)<graph_asymtotic_values(each_graph,1)
            end_index = each_point-1;
        end
    end
    %calculating line regression for the asymptotic region values
    [a,e] = myLinReg(log_h(start_index:end_index),errors_log(each_graph,start_index:end_index));
    names = ["farward difference differential","central difference differential","mixed third order finite difference"];
    fprintf("%s has order %f \n",names(each_graph),a(2));
end