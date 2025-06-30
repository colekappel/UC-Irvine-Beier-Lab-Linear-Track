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

errorbar(1,mean(amp4moPlus{:,'avAmplitudeForEachCell'}),...
    std(amp4moPlus{:,'avAmplitudeForEachCell'})/sqrt(height(amp4moPlus)))

errorbar(2,mean(amp8moPlus{:,'avAmplitudeForEachCell'}),...
    std(amp8moPlus{:,'avAmplitudeForEachCell'})/sqrt(height(amp8moPlus)))

ylabel('Average Amplitude')
title('5x+ Amplitude 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusAmplitudeBar.svg')

%% 5x+ event rate bar plot
figure;

b = bar([1,2],[mean(er4moPlus{:,'eventRatePerCell'}),mean(er8moPlus{:,'eventRatePerCell'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(er4moPlus{:,'eventRatePerCell'}),...
    std(er4moPlus{:,'eventRatePerCell'})/sqrt(height(er4moPlus)))

errorbar(2,mean(er8moPlus{:,'eventRatePerCell'}),...
    std(er8moPlus{:,'eventRatePerCell'})/sqrt(height(er8moPlus)))

ylabel('Event Rate')
title('5x+ Event Rate 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusErBar.svg')

%% 5x+ info score bar plot
figure;

b = bar([1,2],[mean(info4moPlus{:,'theInfoScore'}),mean(info8moPlus{:,'theInfoScore'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(info4moPlus{:,'theInfoScore'}),...
    std(info4moPlus{:,'theInfoScore'})/sqrt(height(info4moPlus)))

errorbar(2,mean(info8moPlus{:,'theInfoScore'}),...
    std(info8moPlus{:,'theInfoScore'})/sqrt(height(info8moPlus)))


ylabel('Information Score')
title('5x+ Information Score 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusInfoBar.svg')

%% 5x+ sparsity 4 v 8 mo bar
figure;

b = bar([1,2],[mean(sparsity4moPlus{:,'sparsity'}),mean(sparsity8moPlus{:,'sparsity'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(sparsity4moPlus{:,'sparsity'}),...
    std(sparsity4moPlus{:,'sparsity'})/sqrt(height(sparsity4moPlus)))

errorbar(2,mean(sparsity8moPlus{:,'sparsity'}),...
    std(sparsity8moPlus{:,'sparsity'})/sqrt(height(sparsity8moPlus)))

ylabel('Sparsity')
title('5x+ Sparsity 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusSparsityBar.svg')

%% 5x+ stability 1v2 4 v 8 mo bar
figure;

b = bar([1,2],[mean(stab1v24moPlus{:,'stability1v2'}),mean(stab1v28moPlus{:,'stability1v2'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(stab1v24moPlus{:,'stability1v2'}),...
    std(stab1v24moPlus{:,'stability1v2'})/sqrt(height(stab1v24moPlus)))

errorbar(2,mean(stab1v28moPlus{:,'stability1v2'}),...
    std(stab1v28moPlus{:,'stability1v2'})/sqrt(height(stab1v28moPlus)))

ylabel('Stability 1v2')
title('5x+ Stability 1v2 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusStab1v2Bar.svg')

%% 5x+ Stability Average 4 v 8 mo bar plot
figure;

b = bar([1,2],[mean(stabAv4moPlus{:,'stabilityAverage'}),mean(stabAv8moPlus{:,'stabilityAverage'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(stabAv4moPlus{:,'stabilityAverage'}),...
    std(stabAv4moPlus{:,'stabilityAverage'})/sqrt(height(stabAv4moPlus)))

errorbar(2,mean(stabAv8moPlus{:,'stabilityAverage'}),...
    std(stabAv8moPlus{:,'stabilityAverage'})/sqrt(height(stabAv8moPlus)))

ylabel('Stability Average')
title('5x+ Stability Average 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusStabAvBar.svg')

%% 5x+ Stability OE 4 v 8 mo bar plot
figure;

b = bar([1,2],[mean(stabOE4moPlus{:,'stabilityOddEven'}),mean(stabOE8moPlus{:,'stabilityOddEven'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(stabOE4moPlus{:,'stabilityOddEven'}),...
    std(stabOE4moPlus{:,'stabilityOddEven'})/sqrt(height(stabOE4moPlus)))

errorbar(2,mean(stabOE8moPlus{:,'stabilityOddEven'}),...
    std(stabOE8moPlus{:,'stabilityOddEven'})/sqrt(height(stabOE8moPlus)))

ylabel('Stability OE')
title('5x+ Stability OE 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/plusStabOEBar.svg')

%% Now for 5x- plots
%% amplitude bar plot
figure;
b = bar([1,2],[mean(amp4moMinus{:,'avAmplitudeForEachCell'}),mean(amp8moMinus{:,'avAmplitudeForEachCell'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];

hold on 

errorbar(1,mean(amp4moMinus{:,'avAmplitudeForEachCell'}),...
    std(amp4moMinus{:,'avAmplitudeForEachCell'})/sqrt(height(amp4moMinus)))

errorbar(2,mean(amp8moMinus{:,'avAmplitudeForEachCell'}),...
    std(amp8moMinus{:,'avAmplitudeForEachCell'})/sqrt(height(amp8moMinus)))

ylabel('Average Amplitude')
title('5x- Amplitude 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusAmplitudeBar.svg')

%% 5x- event rate bar plot
figure;

b = bar([1,2],[mean(er4moMinus{:,'eventRatePerCell'}),mean(er8moMinus{:,'eventRatePerCell'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(er4moMinus{:,'eventRatePerCell'}),...
    std(er4moMinus{:,'eventRatePerCell'})/sqrt(height(er4moMinus)))

errorbar(2,mean(er8moMinus{:,'eventRatePerCell'}),...
    std(er8moMinus{:,'eventRatePerCell'})/sqrt(height(er8moMinus)))

ylabel('Event Rate')
title('5x- Event Rate 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusErBar.svg')

%% 5x- info score bar plot
figure;

b = bar([1,2],[mean(info4moMinus{:,'theInfoScore'}),mean(info8moMinus{:,'theInfoScore'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(info4moMinus{:,'theInfoScore'}),...
    std(info4moMinus{:,'theInfoScore'})/sqrt(height(info4moMinus)))

errorbar(2,mean(info8moMinus{:,'theInfoScore'}),...
    std(info8moMinus{:,'theInfoScore'})/sqrt(height(info8moMinus)))

ylabel('Information Score')
title('5x- Information Score 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusInfoBar.svg')

%% 5x- sparsity 4 v 8 mo bar
figure;

b = bar([1,2],[mean(sparsity4moMinus{:,'sparsity'}),mean(sparsity8moMinus{:,'sparsity'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(sparsity4moMinus{:,'sparsity'}),...
    std(sparsity4moMinus{:,'sparsity'})/sqrt(height(sparsity4moMinus)))

errorbar(2,mean(sparsity8moMinus{:,'sparsity'}),...
    std(sparsity8moMinus{:,'sparsity'})/sqrt(height(sparsity8moMinus)))

ylabel('Sparsity')
title('5x- Sparsity 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusSparsityBar.svg')

%% 5x- stability 1v2 4 v 8 mo bar
figure;

b = bar([1,2],[mean(stab1v24moMinus{:,'stability1v2'}),mean(stab1v28moMinus{:,'stability1v2'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(stab1v24moMinus{:,'stability1v2'}),...
    std(stab1v24moMinus{:,'stability1v2'})/sqrt(height(stab1v24moMinus)))

errorbar(2,mean(stab1v28moMinus{:,'stability1v2'}),...
    std(stab1v28moMinus{:,'stability1v2'})/sqrt(height(stab1v28moMinus)))

ylabel('Stability 1v2')
title('5x- Stability 1v2 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusStab1v2Bar.svg')

%% 5x- Stability Average 4 v 8 mo bar plot
figure;

b = bar([1,2],[mean(stabAv4moMinus{:,'stabilityAverage'}),mean(stabAv8moMinus{:,'stabilityAverage'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(stabAv4moMinus{:,'stabilityAverage'}),...
    std(stabAv4moMinus{:,'stabilityAverage'})/sqrt(height(stabAv4moMinus)))

errorbar(2,mean(stabAv8moMinus{:,'stabilityAverage'}),...
    std(stabAv8moMinus{:,'stabilityAverage'})/sqrt(height(stabAv8moMinus)))

ylabel('Stability Average')
title('5x- Stability Average 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off
saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusStabAvBar.svg')


%% 5x- Stability OE 4 v 8 mo bar plot
figure;

b = bar([1,2],[mean(stabOE4moMinus{:,'stabilityOddEven'}),mean(stabOE8moMinus{:,'stabilityOddEven'})],'FaceColor','flat');
b.CData(2,:) = [1 0 0];
hold on 

errorbar(1,mean(stabOE4moMinus{:,'stabilityOddEven'}),...
    std(stabOE4moMinus{:,'stabilityOddEven'})/sqrt(height(stabOE4moMinus)))

errorbar(2,mean(stabOE8moMinus{:,'stabilityOddEven'}),...
    std(stabOE8moMinus{:,'stabilityOddEven'})/sqrt(height(stabOE8moMinus)))

ylabel('Stability OE')
title('5x- Stability OE 4 vs 8 Month Comparison')
legend('4 month','std 4 mo', 'std 8 mo')
hold off

saveas(gcf,'/Users/colekappel/Desktop/Place Cells 4 v 8 Mo Plots/minusStabOEBar.svg')


% lme formulas
lmeFormulaAmp = 'avAmplitudeForEachCell~age+(1|MouseID)';
lmeFormulaER = 'eventRatePerCell~age+(1|MouseID)';
lmeFormulaInfo = 'theInfoScore~age+(1|MouseID)';
lmeFormulaSparsity = 'sparsity~age+(1|MouseID)';
lmeFormulaStab1v2 = 'stability1v2~age+(1|MouseID)';
lmeFormulaStabAv = 'stabilityAverage~age+(1|MouseID)';
lmeFormulaStabOE = 'stabilityOddEven~age+(1|MouseID)';

%lme models
ampLMEPlus = fitlme(ampTablePlus,lmeFormulaAmp);
erLMEPlus = fitlme(erTablePlus,lmeFormulaER);
infoLMEPlus = fitlme(infoTablePlus,lmeFormulaInfo);
sparsityLMEPlus = fitlme(sparsityTablePlus,lmeFormulaSparsity);
stab1v2LMEPlus = fitlme(stab1v2TablePlus,lmeFormulaStab1v2);
stabAvLMEPlus = fitlme(stabAvTablePlus,lmeFormulaStabAv);
stabOELMEPlus = fitlme(stabOETablePlus,lmeFormulaStabOE);

ampLMEMinus = fitlme(ampTableMinus,lmeFormulaAmp);
erLMEMinus = fitlme(erTableMinus,lmeFormulaER);
infoLMEMinus = fitlme(infoTableMinus,lmeFormulaInfo);
sparsityLMEMinus = fitlme(sparsityTableMinus,lmeFormulaSparsity);
stab1v2LMEMinus = fitlme(stab1v2TableMinus,lmeFormulaStab1v2);
stabAvLMEMinus = fitlme(stabAvTableMinus,lmeFormulaStabAv);
stabOELMEMinus = fitlme(stabOETableMinus,lmeFormulaStabOE);

