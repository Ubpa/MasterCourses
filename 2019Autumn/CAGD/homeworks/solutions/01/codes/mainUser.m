close all;
clear variables;
clc;

%data
data = drawpolyline('InteractionsAllowed', 'none');
X = data.Position(:, 1);
Y = data.Position(:, 2);
close all;

Fit(X, Y);
