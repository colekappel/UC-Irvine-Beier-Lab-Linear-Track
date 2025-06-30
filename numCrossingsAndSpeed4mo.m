clear 

%5xFAD+
%% cohort 1: 0 (cohort ID)
mouse5507=load('Mouse Data/Data_5507EndBinsRemoved.mat');
%mouse5394=load('Mouse Data/Data_5394EndBinsRemoved.mat');
mouse5511=load('Mouse Data/Data_5511EndBinsRemoved.mat');

%% cohort 2: 1
mouse6025=load('Mouse Data/Data_6025EndBinsRemoved.mat');
mouse6026=load('Mouse Data/Data_6026EndBinsRemoved.mat');
mouse6027=load('Mouse Data/Data_6027EndBinsRemoved.mat');
mouse6028=load('Mouse Data/Data_6028EndBinsRemoved.mat');
mouse6029=load('Mouse Data/Data_6029EndBinsRemoved.mat');

%5xFAD-
%% cohort 1: 0
mouse5508=load('Mouse Data/Data_5508EndBinsRemoved.mat');
mouse5391=load('Mouse Data/Data_5391EndBinsRemoved.mat');
mouse5399=load('Mouse Data/Data_5399EndBinsRemoved.mat');
mouse5455=load('Mouse Data/Data_5455EndBinsRemoved.mat');

%% cohort 2: 1
mouse6039=load('Mouse Data/Data_6039EndBinsRemoved.mat');
mouse6041=load('Mouse Data/Data_6041EndBinsRemoved.mat');

mouse6412 = load('Mouse Data/Data_6412EndBinsRemoved.mat');
mouse6416 = load('Mouse Data/Data_6416EndBinsRemoved.mat');
mouse6431 = load('Mouse Data/Data_6431EndBinsRemoved.mat');


%% time per crossing LME Model
%concatenate the LME tables into one table 
LMETableTimePerCrossing = [mouse5507.LMETableTimePerCrossing; mouse5511.LMETableTimePerCrossing;...
    mouse6025.LMETableTimePerCrossing; mouse6026.LMETableTimePerCrossing; mouse6027.LMETableTimePerCrossing; mouse6028.LMETableTimePerCrossing;... 
    mouse6029.LMETableTimePerCrossing; mouse6039.LMETableTimePerCrossing; mouse6041.LMETableTimePerCrossing;... 
    mouse5508.LMETableTimePerCrossing; mouse5391.LMETableTimePerCrossing;mouse5399.LMETableTimePerCrossing;mouse5455.LMETableTimePerCrossing;...
    mouse6412.LMETableTimePerCrossing; mouse6416.LMETableTimePerCrossing; mouse6431.LMETableTimePerCrossing];
%LMETable.FadPlusorMinus=string(LMETable{:,2});
%
%formulaTPC = strcat('timePerCrossing',lmeFormula);

%lmeTPC = fitlme(LMETableTimePerCrossing,formulaTPC);

allTimePerCrossingPlus = [mouse5507.timePerCrossing;mouse5511.timePerCrossing; mouse6025.timePerCrossing;...
    mouse6026.timePerCrossing;mouse6027.timePerCrossing;mouse6028.timePerCrossing; mouse6029.timePerCrossing];
allTimePerCrossingMinus = [mouse5508.timePerCrossing;mouse5391.timePerCrossing;mouse5399.timePerCrossing;mouse5455.timePerCrossing;...
    mouse6039.timePerCrossing; mouse6041.timePerCrossing;mouse6412.timePerCrossing;...
    mouse6416.timePerCrossing;mouse6431.timePerCrossing];
[hTPCKs,pTPCKs] = kstest2(allTimePerCrossingPlus,allTimePerCrossingMinus);
[hTPCTt,pTPCTt] = ttest2(allTimePerCrossingPlus,allTimePerCrossingMinus);


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

writetable(LMETableTimePerCrossing,'/Users/colekappel/Desktop/TimePerCrossing.csv')