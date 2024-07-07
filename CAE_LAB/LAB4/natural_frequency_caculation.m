clc; clear all; close all;

% fixed - free
l = 0.625;
beta1 = 1.875104/l;
beta2 = 4.694091/l;
beta3 = 7.854757/l;
beta4 = 10.995541/l;
d = 2770;
area = 0.019*0.0032;
E = 71e9;
I = (0.019*(0.0032^3))/12;


N_freq1 = sqrt((beta1^4)*E*I/(area*d))/(2*pi)
N_freq2 = sqrt((beta2^4)*E*I/(area*d))/(2*pi)
N_freq3 = sqrt((beta3^4)*E*I/(area*d))/(2*pi)
N_freq4 = sqrt((beta4^4)*E*I/(area*d))/(2*pi)


% fixed - fixed
% l = 0.6;
% beta1 = 4.730041/l;
% beta2 = 7.853205/l;
% beta3 = 10.995608/l;
% beta4 = 14.137165/l;
% 
% d = 7850;
% area = 0.019*0.0032;
% E = 200e9;
% I = (0.019*(0.0032^3))/12;
% 
% 
% N_freq1 = sqrt((beta1^4)*E*I/(area*d))/(2*pi)
% N_freq1 = sqrt((beta2^4)*E*I/(area*d))/(2*pi)
% N_freq1 = sqrt((beta3^4)*E*I/(area*d))/(2*pi)
% N_freq1 = sqrt((beta4^4)*E*I/(area*d))/(2*pi)