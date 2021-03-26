%% read data from files
clear;
clc;
close all;

folder = 'expdata\';
force = 'force data\';
str = {'speed1','speed2','speed3','speed1R'};

c = 0.305; %chord length in meter
s = 0.47; %span in meter

rho = 1.2; %kg/cm3
mu = 1.8e-5; %Pa*s
vel = [4.5, 5.5, 8.4, 4.5];
Re = rho.*vel*c./mu;

L = length(str);
presraw = cell(1,L); %contains raw data from pressure taps
% [aoa from gyro sensor, pressure tap1, pressure tap2, ..., pressure tap30], 31 data in the column. 
% Pressure taps 1 to 16 are on the top and 17-30 are on the bottom. 
% 5 measurements are taken each time aoa is changed manually
for i = 1: L
    pressmat = [folder,str{i},'.mat'];
    tmp = load(pressmat);
    presraw{i} = tmp.tmpdata; %1st column is aoa, 2nd-31th are pressure from 1 to 30
end

%read force data from txt files

angle = 0:1:60;
L2 = length(angle);
forcedata = cell(1,4);%contains averaged data from force sensor
%[lift mean, drag mean, lift std, drag std]
% average is taken for each txt file, which corresponds to an angle (aoa in
% the presraw above)
for i = 1:L
    [row,col] = size(presraw{i});
    len = row./5;
    tmprest =[];
    for j = 1:L2
        forcetxt = [folder,force,str{i},'\angle',num2str(angle(j)),'.txt'];
        if (exist(forcetxt)==0)
            continue
        else
            forcetmp = importdata(forcetxt);
            forcetmp = forcetmp.data;
            forcemean = mean(forcetmp(:,1:2),1); %average of each column, 1st is lift, 2nd is column
            forcestd = std(forcetmp(:,1:2),0,1); %std of each column
            tmprest = [tmprest; forcemean, forcestd]; %size: row/5, 2, 
        end
    end
    forcedata{i} = tmprest;
end
%the order in the last one has to be reversed
forcedata{L} = flip(forcedata{L});