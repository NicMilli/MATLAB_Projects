close,clc,clear all
data41 = xlsread('CalibrationLab.xlsx','Set 1','B2051:H2074');
data42 = xlsread('CalibrationLab.xlsx','Set 2','B277:H300');
data43 = xlsread('CalibrationLab.xlsx','Set 3','B486:H509');
data44 = xlsread('CalibrationLab.xlsx','Set 4','B291:H314');
data45 = xlsread('CalibrationLab.xlsx','Set 5','B501:H524');
data46 = xlsread('CalibrationLab.xlsx','Set 6','B2070:H2093');

%% Volume difference:
Vs1=data41(1,2); Vs2=data42(1,2); Vs3=data43(1,2);
Vs4=data44(1,2); Vs5=data45(1,2); Vs6=data46(1,2);

eVs1=data41(1,4); eVs2=data42(1,4); %eVs3=data43(1,4);
eVs4=data44(1,4); eVs5=data45(1,4); eVs6=data46(1,4);

Vo1=data41(2,2); Vo2=data42(2,2); Vo3=data43(2,2);
Vo4=data44(2,2); Vo5=data45(2,2); Vo6=data46(2,2);

eVo1=data41(2,4); eVo2=data42(2,4); %eVo3=data43(2,4);
eVo4=data44(2,4); eVo5=data45(2,4); eVo6=data46(2,4);

diff1= Vs1-Vo1;diff2= Vs2-Vo2;diff3= Vs3-Vo3;
diff4= Vs4-Vo4;diff5= Vs5-Vo5;diff6= Vs6-Vo6;
diffs=[diff1 diff2 diff3 diff4 diff5 diff6];
diff=mean(diffs)

ediff1= sqrt((eVs1)^2+(eVo1)^2);ediff2=sqrt((eVs2)^2+(eVo2)^2);
%ediff3= sqrt((eVs3)^2+(eVo3)^2);
ediff4= sqrt((eVs4)^2+(eVo4)^2);
ediff5= sqrt((eVs5)^2+(eVo5)^2);ediff6= sqrt((eVs6)^2+(eVo6)^2);
ediffs=[ediff1 ediff2 ediff4 ediff5 ediff6];
ediff=mean(ediffs)

%% Volumetric flow rates (Left side)
rateL1_20=(mean(data41(10:12,3))/mean(data41(10:12,2)))*60;
rateL1_40=(mean(data41(13:15,3))/mean(data41(13:15,2)))*60;
rateL1_60=(mean(data41(16:18,3))/mean(data41(16:18,2)))*60;
rateL1_80=(mean(data41(19:21,3))/mean(data41(19:21,2)))*60;
rateL1_100=(mean(data41(22:24,3))/mean(data41(22:24,2)))*60;

rateL2_20=(mean(data42(10:12,3))/mean(data42(10:12,2)))*60;
rateL2_40=(mean(data42(13:15,3))/mean(data42(13:15,2)))*60;
rateL2_60=(mean(data42(16:18,3))/mean(data42(16:18,2)))*60;
rateL2_80=(mean(data42(19:21,3))/mean(data42(19:21,2)))*60;
rateL2_100=(mean(data42(22:24,3))/mean(data42(22:24,2)))*60;

rateL3_20=(mean(data43(10:12,3))/mean(data43(10:12,2)))*60;
rateL3_40=(mean(data43(13:15,3))/mean(data43(13:15,2)))*60;
rateL3_60=(mean(data43(16:18,3))/mean(data43(16:18,2)))*60;
rateL3_80=(mean(data43(19:21,3))/mean(data43(19:21,2)))*60;
rateL3_100=(mean(data43(22:24,3))/mean(data43(22:24,2)))*60;

rateL4_20=(mean(data44(10:12,3))/mean(data44(10:12,2)))*60;
rateL4_40=(mean(data44(13:15,3))/mean(data44(13:15,2)))*60;
rateL4_60=(mean(data44(16:18,3))/mean(data44(16:18,2)))*60;
rateL4_80=(mean(data44(19:21,3))/mean(data44(19:21,2)))*60;
rateL4_100=(mean(data44(22:24,3))/mean(data44(22:24,2)))*60;

rateL5_20=(mean(data45(10:12,3))/mean(data45(10:12,2)))*60;
rateL5_40=(mean(data45(13:15,3))/mean(data45(13:15,2)))*60;
rateL5_60=(mean(data45(16:18,3))/mean(data45(16:18,2)))*60;
rateL5_80=(mean(data45(19:21,3))/mean(data45(19:21,2)))*60;
rateL5_100=(mean(data45(22:24,3))/mean(data45(22:24,2)))*60;

rateL6_20=(mean(data46(10:12,3))/mean(data46(10:12,2)))*60;
rateL6_40=(mean(data46(13:15,3))/mean(data46(13:15,2)))*60;
rateL6_60=(mean(data46(16:18,3))/mean(data46(16:18,2)))*60;
rateL6_80=(mean(data46(19:21,3))/mean(data46(19:21,2)))*60;
rateL6_100=(mean(data46(22:24,3))/mean(data46(22:24,2)))*60;

rateLs_20=[rateL1_20 rateL2_20 rateL3_20 rateL4_20 rateL5_20 rateL6_20];
rateLs_40=[rateL1_40 rateL2_40 rateL3_40 rateL4_40 rateL5_40 rateL6_40];
rateLs_60=[rateL1_60 rateL2_60 rateL3_60 rateL4_60 rateL5_60 rateL6_60];
rateLs_80=[rateL1_80 rateL2_80 rateL3_80 rateL4_80 rateL5_80 rateL6_80];
rateLs_100=[rateL1_100 rateL2_100 rateL3_100 rateL4_100 rateL5_100 rateL6_100];
rateL_20=mean(rateLs_20); 
rateL_40=mean(rateLs_40);
rateL_60=mean(rateLs_60);
rateL_80=mean(rateLs_80);
rateL_100=mean(rateLs_100);

ratesL=[rateL_20 rateL_40 rateL_60 rateL_80 rateL_100];

e_time=0.5;e_vol=1;
erateL1_20=sqrt((e_time/mean(data41(10:12,2)))^2+(std(data41(10:12,3))/mean(data41(10:12,3)))).*rateL1_20;
erateL1_40=sqrt((e_time/mean(data41(13:15,2)))^2+(std(data41(13:15,3))/mean(data41(13:15,3)))).*rateL1_40;
erateL1_60=sqrt((e_time/mean(data41(16:18,2)))^2+(std(data41(16:18,3))/mean(data41(16:18,3)))).*rateL1_60;
erateL1_80=sqrt((e_time/mean(data41(19:21,2)))^2+(std(data41(19:21,3))/mean(data41(19:21,3)))).*rateL1_80;
erateL1_100=sqrt((e_time/mean(data41(22:24,2)))^2+(std(data41(22:24,3))/mean(data41(22:24,3)))).*rateL1_100;

erateL2_20=sqrt((e_time/mean(data42(10:12,2)))^2+(std(data42(10:12,3))/mean(data42(10:12,3)))).*rateL2_20;
erateL2_40=sqrt((e_time/mean(data42(13:15,2)))^2+(std(data42(13:15,3))/mean(data42(13:15,3)))).*rateL2_40;
erateL2_60=sqrt((e_time/mean(data42(16:18,2)))^2+(std(data42(16:18,3))/mean(data42(16:18,3)))).*rateL2_60;
erateL2_80=sqrt((e_time/mean(data42(19:21,2)))^2+(std(data42(19:21,3))/mean(data42(19:21,3)))).*rateL2_80;
erateL2_100=sqrt((e_time/mean(data42(22:24,2)))^2+(std(data42(22:24,3))/mean(data42(22:24,3)))).*rateL2_100;

erateL3_20=sqrt((e_time/mean(data43(10:12,2)))^2+(std(data43(10:12,3))/mean(data43(10:12,3)))).*rateL3_20;
erateL3_40=sqrt((e_time/mean(data43(13:15,2)))^2+(std(data43(13:15,3))/mean(data43(13:15,3)))).*rateL3_40;
erateL3_60=sqrt((e_time/mean(data43(16:18,2)))^2+(std(data43(16:18,3))/mean(data43(16:18,3)))).*rateL3_60;
erateL3_80=sqrt((e_time/mean(data43(19:21,2)))^2+(std(data43(19:21,3))/mean(data43(19:21,3)))).*rateL3_80;
erateL3_100=sqrt((e_time/mean(data43(22:24,2)))^2+(std(data43(22:24,3))/mean(data43(22:24,3)))).*rateL3_100;

erateL4_20=sqrt((e_time/mean(data44(10:12,2)))^2+(std(data44(10:12,3))/mean(data44(10:12,3)))).*rateL4_20;
erateL4_40=sqrt((e_time/mean(data44(13:15,2)))^2+(std(data44(13:15,3))/mean(data44(13:15,3)))).*rateL4_40;
erateL4_60=sqrt((e_time/mean(data44(16:18,2)))^2+(std(data44(16:18,3))/mean(data44(16:18,3)))).*rateL4_60;
erateL4_80=sqrt((e_time/mean(data44(19:21,2)))^2+(std(data44(19:21,3))/mean(data44(19:21,3)))).*rateL4_80;
erateL4_100=sqrt((e_time/mean(data44(22:24,2)))^2+(std(data44(22:24,3))/mean(data44(22:24,3)))).*rateL4_100;

erateL5_20=sqrt((e_time/mean(data45(10:12,2)))^2+(std(data45(10:12,3))/mean(data45(10:12,3)))).*rateL5_20;
erateL5_40=sqrt((e_time/mean(data45(13:15,2)))^2+(std(data45(13:15,3))/mean(data45(13:15,3)))).*rateL5_40;
erateL5_60=sqrt((e_time/mean(data45(16:18,2)))^2+(std(data45(16:18,3))/mean(data45(16:18,3)))).*rateL5_60;
erateL5_80=sqrt((e_time/mean(data45(19:21,2)))^2+(std(data45(19:21,3))/mean(data45(19:21,3)))).*rateL5_80;
erateL5_100=sqrt((e_time/mean(data45(22:24,2)))^2+(std(data45(22:24,3))/mean(data45(22:24,3)))).*rateL5_100;

erateL6_20=sqrt((e_time/mean(data46(10:12,2)))^2+(std(data46(10:12,3))/mean(data46(10:12,3)))).*rateL5_20;
erateL6_40=sqrt((e_time/mean(data46(13:15,2)))^2+(std(data46(13:15,3))/mean(data46(13:15,3)))).*rateL5_40;
erateL6_60=sqrt((e_time/mean(data46(16:18,2)))^2+(std(data46(16:18,3))/mean(data46(16:18,3)))).*rateL5_60;
erateL6_80=sqrt((e_time/mean(data46(19:21,2)))^2+(std(data46(19:21,3))/mean(data46(19:21,3)))).*rateL5_80;
erateL6_100=sqrt((e_time/mean(data46(22:24,2)))^2+(std(data46(22:24,3))/mean(data46(22:24,3)))).*rateL6_100;

erateLs_20=[erateL1_20 erateL2_20 erateL3_20 erateL4_20 erateL5_20 erateL6_20];
erateLs_40=[erateL1_40 erateL2_40 erateL3_40 erateL4_40 erateL5_40 erateL6_40];
erateLs_60=[erateL1_60 erateL2_60 erateL3_60 erateL4_60 erateL5_60 erateL6_60];
erateLs_80=[erateL1_80 erateL2_80 erateL3_80 erateL4_80 erateL5_80 erateL6_80];
erateLs_100=[erateL1_100 erateL2_100 erateL3_100 erateL4_100 erateL5_100 erateL6_100];
erateL_20=mean(erateLs_20); 
erateL_40=mean(erateLs_40);
erateL_60=mean(erateLs_60);
erateL_80=mean(erateLs_80);
erateL_100=mean(erateLs_100);

eratesL=[erateL_20 erateL_40 erateL_60 erateL_80 erateL_100];

%% Volumetric flow rates (Riht side)
rateR1_20=(mean(data41(10:12,7))/mean(data41(10:12,6)))*60;
rateR1_40=(mean(data41(13:15,7))/mean(data41(13:15,6)))*60;
rateR1_60=(mean(data41(16:18,7))/mean(data41(16:18,6)))*60;
rateR1_80=(mean(data41(19:21,7))/mean(data41(19:21,6)))*60;
rateR1_100=(mean(data41(22:24,7))/mean(data41(22:24,6)))*60;

rateR2_20=(mean(data42(10:12,7))/mean(data42(10:12,6)))*60;
rateR2_40=(mean(data42(13:15,7))/mean(data42(13:15,6)))*60;
rateR2_60=(mean(data42(16:18,7))/mean(data42(16:18,6)))*60;
rateR2_80=(mean(data42(19:21,7))/mean(data42(19:21,6)))*60;
rateR2_100=(mean(data42(22:24,7))/mean(data42(22:24,6)))*60;

rateR3_20=(mean(data43(10:12,7))/mean(data43(10:12,6)))*60;
rateR3_40=(mean(data43(13:15,7))/mean(data43(13:15,6)))*60;
rateR3_60=(mean(data43(16:18,7))/mean(data43(16:18,6)))*60;
rateR3_80=(mean(data43(19:21,7))/mean(data43(19:21,6)))*60;
rateR3_100=(mean(data43(22:24,7))/mean(data43(22:24,6)))*60;

rateR4_20=(mean(data44(10:12,7))/mean(data44(10:12,6)))*60;
rateR4_40=(mean(data44(13:15,7))/mean(data44(13:15,6)))*60;
rateR4_60=(mean(data44(16:18,7))/mean(data44(16:18,6)))*60;
rateR4_80=(mean(data44(19:21,7))/mean(data44(19:21,6)))*60;
rateR4_100=(mean(data44(22:24,7))/mean(data44(22:24,6)))*60;

rateR5_20=(mean(data45(10:12,7))/mean(data45(10:12,6)))*60;
rateR5_40=(mean(data45(13:15,7))/mean(data45(13:15,6)))*60;
rateR5_60=(mean(data45(16:18,7))/mean(data45(16:18,6)))*60;
rateR5_80=(mean(data45(19:21,7))/mean(data45(19:21,6)))*60;
rateR5_100=(mean(data45(22:24,7))/mean(data45(22:24,6)))*60;

rateR6_20=(mean(data46(10:12,7))/mean(data46(10:12,6)))*60;
rateR6_40=(mean(data46(13:15,7))/mean(data46(13:15,6)))*60;
rateR6_60=(mean(data46(16:18,7))/mean(data46(16:18,6)))*60;
rateR6_80=(mean(data46(19:21,7))/mean(data46(19:21,6)))*60;
rateR6_100=(mean(data46(22:24,7))/mean(data46(22:24,6)))*60;

rateRs_20=[rateR1_20 rateR2_20 rateR3_20 rateR4_20 rateR5_20 rateR6_20];
rateRs_40=[rateR1_40 rateR2_40 rateR3_40 rateR4_40 rateR5_40 rateR6_40];
rateRs_60=[rateR1_60 rateR2_60 rateR3_60 rateR4_60 rateR5_60 rateR6_60];
rateRs_80=[rateR1_80 rateR2_80 rateR3_80 rateR4_80 rateR5_80 rateR6_80];
rateRs_100=[rateR1_100 rateR2_100 rateR3_100 rateR4_100 rateR5_100 rateR6_100];
rateR_20=mean(rateRs_20);
rateR_40=mean(rateRs_40);
rateR_60=mean(rateRs_60);
rateR_80=mean(rateRs_80);
rateR_100=mean(rateRs_100);

ratesR=[rateR_20 rateR_40 rateR_60 rateR_80 rateR_100];

e_time=0.5;e_vol=1;
erateR1_20=sqrt((e_time/mean(data41(10:12,6)))^2+(std(data41(10:12,7))/mean(data41(10:12,7)))).*rateR1_20;
erateR1_40=sqrt((e_time/mean(data41(13:15,6)))^2+(std(data41(13:15,7))/mean(data41(13:15,7)))).*rateR1_40;
erateR1_60=sqrt((e_time/mean(data41(16:18,6)))^2+(std(data41(16:18,7))/mean(data41(16:18,7)))).*rateR1_60;
erateR1_80=sqrt((e_time/mean(data41(19:21,6)))^2+(std(data41(19:21,7))/mean(data41(19:21,7)))).*rateR1_80;
erateR1_100=sqrt((e_time/mean(data41(22:24,6)))^2+(std(data41(22:24,7))/mean(data41(22:24,7)))).*rateR1_100;

erateR2_20=sqrt((e_time/mean(data42(10:12,6)))^2+(std(data42(10:12,7))/mean(data42(10:12,7)))).*rateR2_20;
erateR2_40=sqrt((e_time/mean(data42(13:15,6)))^2+(std(data42(13:15,7))/mean(data42(13:15,7)))).*rateR2_40;
erateR2_60=sqrt((e_time/mean(data42(16:18,6)))^2+(std(data42(16:18,7))/mean(data42(16:18,7)))).*rateR2_60;
erateR2_80=sqrt((e_time/mean(data42(19:21,6)))^2+(std(data42(19:21,7))/mean(data42(19:21,7)))).*rateR2_80;
erateR2_100=sqrt((e_time/mean(data42(22:24,6)))^2+(std(data42(22:24,7))/mean(data42(22:24,7)))).*rateR2_100;

erateR3_20=sqrt((e_time/mean(data43(10:12,6)))^2+(std(data43(10:12,7))/mean(data43(10:12,7)))).*rateR3_20;
erateR3_40=sqrt((e_time/mean(data43(13:15,6)))^2+(std(data43(13:15,7))/mean(data43(13:15,7)))).*rateR3_40;
erateR3_60=sqrt((e_time/mean(data43(16:18,6)))^2+(std(data43(16:18,7))/mean(data43(16:18,7)))).*rateR3_60;
erateR3_80=sqrt((e_time/mean(data43(19:21,6)))^2+(std(data43(19:21,7))/mean(data43(19:21,7)))).*rateR3_80;
erateR3_100=sqrt((e_time/mean(data43(22:24,6)))^2+(std(data43(22:24,7))/mean(data43(22:24,7)))).*rateR3_100;

erateR4_20=sqrt((e_time/mean(data44(10:12,6)))^2+(std(data44(10:12,7))/mean(data44(10:12,7)))).*rateR4_20;
erateR4_40=sqrt((e_time/mean(data44(13:15,6)))^2+(std(data44(13:15,7))/mean(data44(13:15,7)))).*rateR4_40;
erateR4_60=sqrt((e_time/mean(data44(16:18,6)))^2+(std(data44(16:18,7))/mean(data44(16:18,7)))).*rateR4_60;
erateR4_80=sqrt((e_time/mean(data44(19:21,6)))^2+(std(data44(19:21,7))/mean(data44(19:21,7)))).*rateR4_80;
erateR4_100=sqrt((e_time/mean(data44(22:24,6)))^2+(std(data44(22:24,7))/mean(data44(22:24,7)))).*rateR4_100;

erateR5_20=sqrt((e_time/mean(data45(10:12,6)))^2+(std(data45(10:12,7))/mean(data45(10:12,7)))).*rateR5_20;
erateR5_40=sqrt((e_time/mean(data45(13:15,6)))^2+(std(data45(13:15,7))/mean(data45(13:15,7)))).*rateR5_40;
erateR5_60=sqrt((e_time/mean(data45(16:18,6)))^2+(std(data45(16:18,7))/mean(data45(16:18,7)))).*rateR5_60;
erateR5_80=sqrt((e_time/mean(data45(19:21,6)))^2+(std(data45(19:21,7))/mean(data45(19:21,7)))).*rateR5_80;
erateR5_100=sqrt((e_time/mean(data45(22:24,6)))^2+(std(data45(22:24,7))/mean(data45(22:24,7)))).*rateR5_100;

erateR6_20=sqrt((e_time/mean(data46(10:12,6)))^2+(std(data46(10:12,7))/mean(data46(10:12,7)))).*rateR6_20;
erateR6_40=sqrt((e_time/mean(data46(13:15,6)))^2+(std(data46(13:15,7))/mean(data46(13:15,7)))).*rateR6_40;
erateR6_60=sqrt((e_time/mean(data46(16:18,6)))^2+(std(data46(16:18,7))/mean(data46(16:18,7)))).*rateR6_60;
erateR6_80=sqrt((e_time/mean(data46(19:21,6)))^2+(std(data46(19:21,7))/mean(data46(19:21,7)))).*rateR6_80;
erateR6_100=sqrt((e_time/mean(data46(22:24,6)))^2+(std(data46(22:24,7))/mean(data46(22:24,7)))).*rateR6_100;

erateRs_20=[erateR1_20 erateR2_20 erateR3_20 erateR4_20 erateR5_20 erateR6_20];
erateRs_40=[erateR1_40 erateR2_40 erateR3_40 erateR4_40 erateR5_40 erateR6_40];
erateRs_60=[erateR1_60 erateR2_60 erateR3_60 erateR4_60 erateR5_60 erateR6_60];
erateRs_80=[erateR1_80 erateR2_80 erateR3_80 erateR4_80 erateR5_80 erateR6_80];
erateRs_100=[erateR1_100 erateR2_100 erateR3_100 erateR4_100 erateR5_100 erateR6_100];
erateR_20=mean(erateRs_20); 
erateR_40=mean(erateRs_40);
erateR_60=mean(erateRs_60);
erateR_80=mean(erateRs_80);
erateR_100=mean(erateRs_100);

eratesR=[erateR_20 erateR_40 erateR_60 erateR_80 erateR_100];

%% Plot
set_points=[20 40 60 80 100];

figure(1)
hold on
errorbar(set_points,ratesL,eratesL,eratesL,'b')
errorbar(set_points,ratesR,eratesR,eratesR,'r')
xlabel('Set-point flowrate (ml/s)')
ylabel('Measured flowrate (ml/s)')
title('Measured flow rate versus set-point flow rate for the right and left motors') % at 25 \circC
legend('Left motor', 'Right motor', 'location','east')
hold off

%% Main Results:
fprintf('The average volume change was : %.4f mL',diff);
disp(' ')
fprintf('with error : %.4f mL', ediff);
disp(' ')





