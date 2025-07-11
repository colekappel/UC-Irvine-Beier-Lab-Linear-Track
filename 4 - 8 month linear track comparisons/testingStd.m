clear 

% formula like %'timePerCrossing~FadPlusorMinus+(1|MouseID)'

% but now instead of FadPlusorMinus make it age

amp4mo = readtable('Raw Data for 4 mo LT Place Cells/AmplitudeData.csv');
er4mo = readtable('Raw Data for 4 mo LT Place Cells/EventRateData.csv');
info4mo = readtable('Raw Data for 4 mo LT Place Cells/InfoScoreData.csv');
sparsity4mo = readtable('Raw Data for 4 mo LT Place Cells/SparsityData.csv');
stab1v24mo = readtable('Raw Data for 4 mo LT Place Cells/Stability1v2Data.csv');
stabAv4mo = readtable('Raw Data for 4 mo LT Place Cells/StabilityAvData.csv');
stabOE4mo = readtable('Raw Data for 4 mo LT Place Cells/StabilityOE.csv');

% 1 is plus and -1 is minus
rowsPlus4mo = find(amp4mo{:,'FadPlusorMinus'}==1);
rowsMinus4mo = find(amp4mo{:,'FadPlusorMinus'}==-1);

% add age
amp4mo.age = -1*ones(height(amp4mo),1);
er4mo.age = -1*ones(height(er4mo),1);
info4mo.age = -1*ones(height(info4mo),1);
sparsity4mo.age = -1*ones(height(sparsity4mo),1);
stab1v24mo.age = -1*ones(height(stab1v24mo),1);
stabAv4mo.age = -1*ones(height(stabAv4mo),1);
stabOE4mo.age = -1*ones(height(stabOE4mo),1);

amp4moPlus = amp4mo(rowsPlus4mo,:);
er4moPlus = er4mo(rowsPlus4mo,:);
info4moPlus = info4mo(rowsPlus4mo,:);
sparsity4moPlus = sparsity4mo(rowsPlus4mo,:);
stab1v24moPlus = stab1v24mo(rowsPlus4mo,:);
stabAv4moPlus = stabAv4mo(rowsPlus4mo,:);
stabOE4moPlus = stabOE4mo(rowsPlus4mo,:);

amp4moMinus = amp4mo(rowsMinus4mo,:);
er4moMinus = er4mo(rowsMinus4mo,:);
info4moMinus = info4mo(rowsMinus4mo,:);
sparsity4moMinus = sparsity4mo(rowsMinus4mo,:);
stab1v24moMinus = stab1v24mo(rowsMinus4mo,:);
stabAv4moMinus = stabAv4mo(rowsMinus4mo,:);
stabOE4moMinus = stabOE4mo(rowsMinus4mo,:);


amp8mo = readtable('Raw Data for 8 mo LT Place Cells/AmplitudeData.csv');
er8mo = readtable('Raw Data for 8 mo LT Place Cells/EventRateData.csv');
info8mo = readtable('Raw Data for 8 mo LT Place Cells/InfoScoreData.csv');
sparsity8mo = readtable('Raw Data for 8 mo LT Place Cells/SparsityData.csv');
stab1v28mo = readtable('Raw Data for 8 mo LT Place Cells/Stability1v2Data.csv');
stabAv8mo = readtable('Raw Data for 8 mo LT Place Cells/StabilityAvData.csv');
stabOE8mo = readtable('Raw Data for 8 mo LT Place Cells/StabilityOE.csv');

rowsPlus8mo = find(amp8mo{:,'FadPlusorMinus'}==1);
rowsMinus8mo = find(amp8mo{:,'FadPlusorMinus'}==-1);

amp8mo.age = ones(height(amp8mo),1);
er8mo.age = ones(height(er8mo),1);
info8mo.age = ones(height(info8mo),1);
sparsity8mo.age = ones(height(sparsity8mo),1);
stab1v28mo.age = ones(height(stab1v28mo),1);
stabAv8mo.age = ones(height(stabAv8mo),1);
stabOE8mo.age = ones(height(stabOE8mo),1);

amp8moPlus = amp8mo(rowsPlus8mo,:);
er8moPlus = er8mo(rowsPlus8mo,:);
info8moPlus = info8mo(rowsPlus8mo,:);
sparsity8moPlus = sparsity8mo(rowsPlus8mo,:);
stab1v28moPlus = stab1v28mo(rowsPlus8mo,:);
stabAv8moPlus = stabAv8mo(rowsPlus8mo,:);
stabOE8moPlus = stabOE8mo(rowsPlus8mo,:);

amp8moMinus = amp8mo(rowsMinus8mo,:);
er8moMinus = er8mo(rowsMinus8mo,:);
info8moMinus = info8mo(rowsMinus8mo,:);
sparsity8moMinus = sparsity8mo(rowsMinus8mo,:);
stab1v28moMinus = stab1v28mo(rowsMinus8mo,:);
stabAv8moMinus = stabAv8mo(rowsMinus8mo,:);
stabOE8moMinus = stabOE8mo(rowsMinus8mo,:);

% concatenate tables
ampTablePlus = [amp4moPlus;amp8moPlus];
erTablePlus = [er4moPlus;er8moPlus];
infoTablePlus = [info4moPlus;info8moPlus];
sparsityTablePlus = [sparsity4moPlus;sparsity8moPlus];
stab1v2TablePlus = [stab1v24moPlus;stab1v28moPlus];
stabAvTablePlus = [stabAv4moPlus;stabAv8moPlus];
stabOETablePlus = [stabOE4moPlus;stabOE8moPlus];

ampTableMinus = [amp4moMinus;amp8moMinus];
erTableMinus = [er4moMinus;er8moMinus];
infoTableMinus = [info4moMinus;info8moMinus];
sparsityTableMinus = [sparsity4moMinus;sparsity8moMinus];
stab1v2TableMinus = [stab1v24moMinus;stab1v28moMinus];
stabAvTableMinus = [stabAv4moMinus;stabAv8moMinus];
stabOETableMinus = [stabOE4moMinus;stabOE8moMinus];

%% bar charts: 5x+ 4 v 8 month and WT 4 v 8 month

%% first 5x+ plots
%% amplitude bar plot
b = bar([1,2],[mean(amp4moPlus{:,'avAmplitudeForEachCell'}),mean(amp8moPlus{:,'avAmplitudeForEachCell'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];

hold on 
%{
errorbar([1,2],[mean(amp4moPlus{:,'avAmplitudeForEachCell'}),mean(amp8moPlus{:,'avAmplitudeForEachCell'})],...
    std(amp4moPlus{:,'avAmplitudeForEachCell'})/sqrt(height(amp4moPlus)),...
    std(amp8moPlus{:,'avAmplitudeForEachCell'})/sqrt(height(amp8moPlus)))
%}
%
errorbar([1],mean(amp4moPlus{:,'avAmplitudeForEachCell'}),...
    std(amp4moPlus{:,'avAmplitudeForEachCell'})/sqrt(height(amp4moPlus)))

errorbar([2],mean(amp8moPlus{:,'avAmplitudeForEachCell'}),...
    std(amp8moPlus{:,'avAmplitudeForEachCell'})/sqrt(height(amp8moPlus)))
%}
ylabel('Average Amplitude')
title('5x+ Amplitude 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off