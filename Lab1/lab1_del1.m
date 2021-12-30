
clear all, close all
clc

A = [1,2,3,0;
    0,4,5,6;
    1,1,-1,0;
    1,1,1,1;];
b = (7:-1:4)';

x = A\b;

r = b - A*x;

disp(x)
disp(r)


