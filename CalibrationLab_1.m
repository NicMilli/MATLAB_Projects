close,clc,clear all
data4(7,:)=ones(1,5);
data1 = xlsread('CalibrationLab.xlsx','Set 1','B7:F13');
data2 = xlsread('CalibrationLab.xlsx','Set 2','B7:F13');
data3 = xlsread('CalibrationLab.xlsx','Set 3','B7:F13');
data4(1:6,:) = xlsread('CalibrationLab.xlsx','Set 4','B7:F13');
data4(7,:)=ones(1,5);
data5 = xlsread('CalibrationLab.xlsx','Set 5','B7:F13');
data6 = xlsread('CalibrationLab.xlsx','Set 6','B7:F13');

Conc1 = data1(1:7,2); Conc2 = data2(1:7,2); %NaOH concentrations
Conc3 = data3(1:7,2); Conc4 = data4(1:7,2); %Molar
Conc5 = data5(1:7,2); Conc6 = data6(1:7,2); 
conc=[Conc1 Conc2 Conc3 Conc4 Conc5 Conc6]'; NaClconc=mean(conc);
concfix=[Conc1(7,1) Conc2(7,1) Conc3(7,1) Conc5(7,1) Conc6(7,1)]'; NaClconcfix=mean(concfix);
NaClconc(1,7)=mean(concfix);

stdConc1 = data1(1:7,3); stdConc2 = data2(1:7,3); %Standard Deviation NaOH concentrations
stdConc3 = data3(1:7,3); stdConc4 = data4(1:7,3); %Molar
stdConc5 = data5(1:7,3); stdConc6 = data6(1:7,3); 
stdconc=[stdConc1 stdConc2 stdConc3 stdConc4 stdConc5 stdConc6]'; stdNaClconc=mean(stdconc);
stdconcfix=[stdConc1(7,1) stdConc2(7,1) stdConc3(7,1) stdConc5(7,1) stdConc6(7,1)]'; stdNaClconcfix=mean(stdconcfix);
stdNaClconc(1,7)=mean(stdconcfix);

Cond1 = data1(1:7,4); Cond2 = data2(1:7,4); %Conductivity
Cond3 = data3(1:7,4); Cond4 = data4(1:7,4); %mS
Cond5 = data5(1:7,4); Cond6 = data6(1:7,4);
cond=[Cond1 Cond2 Cond3 Cond4 Cond5 Cond6]'; NaClcond=mean(cond);
condfix=[Cond1(7,1) Cond2(7,1) Cond3(7,1) Cond5(7,1) Cond6(7,1)]'; NaClcondfix=mean(condfix);
NaClcond(1,7)=mean(condfix);

stdCond1 = data1(1:7,5); stdCond2 = data2(1:7,5); %Standard Deviation Conductivity
stdCond3 = data3(1:7,5); stdCond4 = data4(1:7,5); %mS
stdCond5 = data5(1:7,5); stdCond6 = data6(1:7,5); 
stdcond=[stdCond1 stdCond2 stdCond3 stdCond4 stdCond5 stdCond6]'; stdNaClcond=mean(stdcond);
stdcondfix=[stdCond1(7,1) stdCond2(7,1) stdCond3(7,1) stdCond5(7,1) stdCond6(7,1)]'; stdNaClcondfix=mean(stdcondfix);
stdNaClcond(1,7)=mean(stdcondfix);

%% Calculate expected concentration:

mcondNa=50.1; mcondCl=76.22;
cond_calc = NaClconc .* (mcondNa + mcondCl);
stdcond_calc=sqrt(((mcondNa + mcondCl).^2 .* (stdNaClconc).^2)+0);
%% Fit line for measured data:
x=linspace(0,0.4,10);
p1 = 51.71;
p2 = 1.5035;
y = p1*x + p2; 

%% Comparitive plot
figure(1)
hold on
errorbar(NaClconc,NaClcond,stdNaClcond,stdNaClcond,stdNaClconc,stdNaClconc)
errorbar(NaClconc,cond_calc,stdcond_calc,stdcond_calc,stdNaClconc,stdNaClconc)
plot(x,y,'k')
xlim([0 0.35])
ylim([0 45])
xlabel('NaCl concentration (molar)')
ylabel('Conductivity (mS)')
title('Conductivity vs. molar concentration of NaCl') % at 25 \circC
legend('Measured conductivity', 'Calculated conductivity','Best fit line for measured data', 'location','southeast')
hold off
