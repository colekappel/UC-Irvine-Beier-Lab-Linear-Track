clear 

%% 5xFAD+
mouse6025=load('Mouse Data/Data_6025EndBinsRemoved.mat');
mouse6026=load('Mouse Data/Data_6026EndBinsRemoved.mat');
mouse6027=load('Mouse Data/Data_6027EndBinsRemoved.mat');
mouse6028=load('Mouse Data/Data_6028EndBinsRemoved.mat');
mouse6029=load('Mouse Data/Data_6029EndBinsRemoved.mat');

%% 5xFAD-
mouse6039=load('Mouse Data/Data_6039EndBinsRemoved.mat');
mouse6041=load('Mouse Data/Data_6041EndBinsRemoved.mat');

mouse6412 = load('Mouse Data/Data_6412EndBinsRemoved.mat');
mouse6416 = load('Mouse Data/Data_6416EndBinsRemoved.mat');
mouse6431 = load('Mouse Data/Data_6431EndBinsRemoved.mat');

%% recalculate speeds just use distance as 1m and divide by time

aveSpeed6025 = mean(1./mouse6025.timePerCrossing);
aveSpeed6026 = mean(1./mouse6026.timePerCrossing);
aveSpeed6027 = mean(1./mouse6027.timePerCrossing);
aveSpeed6028 = mean(1./mouse6028.timePerCrossing);
aveSpeed6029 = mean(1./mouse6029.timePerCrossing);
aveSpeed6039 = mean(1./mouse6039.timePerCrossing);
aveSpeed6041 = mean(1./mouse6041.timePerCrossing);
aveSpeed6412 = mean(1./mouse6412.timePerCrossing);
aveSpeed6416 = mean(1./mouse6416.timePerCrossing);
aveSpeed6431 = mean(1./mouse6431.timePerCrossing);