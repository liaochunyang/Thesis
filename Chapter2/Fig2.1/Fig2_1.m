% This file is used to produce Fig 2.1 in my thesis
clear all;clc;
rng(4)            % Fix random seed. Comment out this line if you want. 
%% Generate data sets
m = 8;                  % number of observations
x = linspace(-1,3,m);   % x-axis
y = 2*rand(1,m)-1;      % randomly generated function values

%% Fit by polynomial
coef_poly = polyfit(x,y,m-1);     

%% Fit by Trig function
A = [ones(m,1),sin(x'),sin(2*x'),sin(3*x'),sin(4*x'),sin(5*x'),sin(6*x'),sin(7*x'),sin(8*x')];
coef_trig = A\y';

%% Make plot
xx = linspace(-1,3,1000);       % equispaced points over interval [-1,3]
y_poly = polyval(coef_poly,xx); % function values produced by polynomials
y_trig = [ones(1000,1),sin(xx'),sin(2*xx'),sin(3*xx'),sin(4*xx'),sin(5*xx'),sin(6*xx'),sin(7*xx'),sin(8*xx')] * coef_trig;
plot(x,y,'ko',x,y,'k--',xx,y_poly,'r-',xx,y_trig,'b-.','Linewidth',1.5)
legend('Datapoints','piecewise-linear','polynomial','Trig function','fontsize',10,'Location','best')


