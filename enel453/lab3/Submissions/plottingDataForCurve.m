%From Datasheet Characteristics Chart
%distance = [3.5,   4,    5,   6,    7,    8,   9,   10,   12,   14,   16,   18,   20,   25,   30,   35,   40];
%voltage  = [  3, 2.7, 2.35, 2.2, 1.75, 1.57, 1.4, 1.26, 1.07, 0.93, 0.81, 0.72, 0.67, 0.52, 0.43, 0.38, 0.33];

distance = [0.00, 0.50, 1.00, 1.50, 2.50, 3.00];
voltage =  [0.03, 1.38, 1.88, 2.22, 2.75, 3.03];

d_10minus4m = distance .* 100;
voltage_mV = voltage .*1000;

plot(voltage_mV,d_10minus4m);