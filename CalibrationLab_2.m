close,clc,clear all
data21 = xlsread('CalibrationLab.xlsx','Set 1','B25:P231');
data22 = xlsread('CalibrationLab.xlsx','Set 2','B27:P69');
data23 = xlsread('CalibrationLab.xlsx','Set 3','B23:P73');
data24 = xlsread('CalibrationLab.xlsx','Set 4','B25:P74');
data25 = xlsread('CalibrationLab.xlsx','Set 5','B25:P75');
data26 = xlsread('CalibrationLab.xlsx','Set 6','B25:P43');


t30_1 = data21(:,1); t30_2 = data22(:,1); %time
t30_3 = data23(:,1); t30_4 = data24(:,1); %seconds
t30_5 = data25(:,1); t30_6 = data26(:,1); 

T30_1 = data21(:,2); T30_2 = data22(1:42,2); %Temperature
T30_3 = data23(:,2); T30_4 = data24(1:37,2); %C
T30_5 = data25(:,2); T30_6 = data26(:,2); 

%T30s=[T30_1 T30_2 T30_3 T30_4 T30_5 T30_6];

 Ti30_2 = data22(1:42,4); %Temperature
 Ti30_4 = data24(1:37,4); %C
 Ti30_5 = data25(:,4); 

c30_1 = data21(:,6); c30_2 = data22(1:42,6); %Conductivity
c30_3 = data23(:,6); c30_4 = data24(1:37,6); %mS
c30_5 = data25(:,6); c30_6 = data26(:,6); 

T40_1 = data21(1:161,10); T40_2 = data22(:,10); %Temperature
T40_3 = data23(:,10); T40_4 = data24(:,10); %C
T40_5 = data25(:,10); T40_6 = data26(:,10); 
%T40s=[T40_1 T40_2 T40_3 T40_4 T40_5 T40_6];

 Ti40_2 = data22(:,12); %Temperature
 Ti40_4 = data24(:,12); %C
 Ti40_5 = data25(:,12); 

c40_1 = data21(1:161,14); c40_2 = data22(:,14); %Conductivity
c40_3 = data23(:,14); c40_4 = data24(:,14); %mS
c40_5 = data25(:,14); c40_6 = data26(:,14); 

stdT=mean([0.2 0.2 0.1 0.05]);
stdTi=mean([0.2 0.3 0.1 0.05]);
stdc=mean([0.005 0.005 0.01 0.02]);
%% Fitting independent temps 40C
[p q] = size(Ti30_2);
[p1 q1] = size(c30_2);
xa30_2 = sum(Ti30_2(:,1))/p;
ya30_2 = sum(c30_2(:,1))/p1;
ni30_2 = (Ti30_2(:,1)-xa30_2).*(c30_2(:,1)-ya30_2);
eni30_2=sqrt((stdTi)^2+(stdTi)^2+(stdc)^2+(stdc)^2);
di30_2= (Ti30_2(:,1)-xa30_2).^2;
edi30_2=sqrt((2.*(Ti30_2(:,1)-xa30_2)).^2.*(stdTi).^2+(2.*(Ti30_2(:,1)-xa30_2)).^2.*(stdTi).^2);
mi30_2 = sum(ni30_2)/sum(di30_2);
emi30_2 = sqrt((1./sum(di30_2)).^2.*(sum(eni30_2)).^2+(sum(ni30_2)./(sum(di30_2).^2)).^2.*(edi30_2).^2);
bi30_2= ya30_2 - mi30_2*xa30_2;

[p4 q4] = size(Ti30_4);
[p41 q41] = size(c30_4);
xa30_4 = sum(Ti30_4(:,1))/p4;
ya30_4 = sum(c30_4(:,1))/p41;
ni30_4 = (Ti30_4(:,1)-xa30_4).*(c30_4(:,1)-ya30_4);
eni30_4=sqrt((stdTi)^2+(stdTi)^2+(stdc)^2+(stdc)^2);
di30_4= (Ti30_4(:,1)-xa30_4).^2;
edi30_4=sqrt((2.*(Ti30_4(:,1)-xa30_4)).^2.*(stdTi).^2+(2.*(Ti30_4(:,1)-xa30_4)).^2.*(stdTi).^2);
mi30_4 = sum(ni30_4)/sum(di30_4);
emi30_4 = sqrt((1./sum(di30_4)).^2.*(sum(eni30_4)).^2+(sum(ni30_4)./(sum(di30_4).^2)).^2.*(edi30_4).^2);
bi30_4= ya30_4 - mi30_4*xa30_4;

[p5 l5] = size(Ti30_5);
[p51 l51] = size(Ti30_5);
xa30_5 = sum(Ti30_5(:,1))/p5;
ya30_5 = sum(c30_5(:,1))/p51;
ni30_5 = (Ti30_5(:,1)-xa30_5).*(c30_5(:,1)-ya30_5);
di30_5= (Ti30_5(:,1)-xa30_5).^2;
mi30_5 = sum(ni30_5)/sum(di30_5);
bi30_5= ya30_5 - mi30_5*xa30_5;

eni30_5=sqrt((stdTi)^2+(stdTi)^2+(stdc)^2+(stdc)^2);
edi30_5=sqrt((2.*(Ti30_5(:,1)-xa30_5)).^2.*(stdTi).^2+(2.*(Ti30_5(:,1)-xa30_5)).^2.*(stdTi).^2);
emi30_5 = sqrt((1./sum(di30_5)).^2.*(sum(eni30_5)).^2+(sum(ni30_5)./(sum(di30_5).^2)).^2.*(edi30_5).^2);

emi30s=[mean(emi30_2) mean(emi30_4) mean(emi30_5)]; 
emi30=mean(emi30s);

mi30s=[mi30_2 mi30_4 mi30_5]; mi30=mean(mi30s);
bi30s=[bi30_2 bi30_4 bi30_5]; bi30=mean(bi30s);

xi=linspace(18,32,20);
yi = mi30*xi + bi30; 

%% Fitting independent temps 40C
[w l] = size(Ti40_2);
[w1 l1] = size(Ti40_2);
xa40_2 = sum(Ti40_2(:,1))/w;
ya40_2 = sum(c40_2(:,1))/w1;
ni40_2 = (Ti40_2(:,1)-xa40_2).*(c40_2(:,1)-ya40_2);
di40_2= (Ti40_2(:,1)-xa40_2).^2;
mi40_2 = sum(ni40_2)/sum(di40_2);
bi40_2= ya40_2 - mi40_2*xa40_2;

[w4 l4] = size(Ti40_4);
[w41 l41] = size(Ti40_4);
xa40_4 = sum(Ti40_4(:,1))/w4;
ya40_4 = sum(c40_4(:,1))/w41;
ni40_4 = (Ti40_4(:,1)-xa40_4).*(c40_4(:,1)-ya40_4);
di40_4= (Ti40_4(:,1)-xa40_4).^2;
mi40_4 = sum(ni40_4)/sum(di40_4);
bi40_4= ya40_4 - mi40_4*xa40_4;

[w5 l5] = size(Ti40_5);
[w51 l51] = size(Ti40_5);
xa40_5 = sum(Ti40_5(:,1))/w5;
ya40_5 = sum(c40_5(:,1))/w51;
ni40_5 = (Ti40_5(:,1)-xa40_5).*(c40_5(:,1)-ya40_5);
di40_5= (Ti40_5(:,1)-xa40_5).^2;
mi40_5 = sum(ni40_5)/sum(di40_5);
bi40_5= ya40_5 - mi40_5*xa40_5;

mi40s=[mi40_2 mi40_4 mi40_5]; mi40=mean(mi40s);
bi40s=[bi40_2 bi40_4 bi40_5]; bi40=mean(bi40s);

eni40_2=sqrt((stdTi)^2+(stdTi)^2+(stdc)^2+(stdc)^2);
edi40_2=sqrt((2.*(Ti40_2(:,1)-xa40_2)).^2.*(stdTi).^2+(2.*(Ti40_2(:,1)-xa40_2)).^2.*(stdTi).^2);
emi40_2 = sqrt((1./sum(di40_2)).^2.*(sum(eni40_2)).^2+(sum(ni40_2)./(sum(di40_2).^2)).^2.*(edi40_2).^2);

eni40_4=sqrt((stdTi)^2+(stdTi)^2+(stdc)^2+(stdc)^2);
edi40_4=sqrt((2.*(Ti40_4(:,1)-xa40_4)).^2.*(stdTi).^2+(2.*(Ti40_4(:,1)-xa40_4)).^2.*(stdTi).^2);
emi40_4 = sqrt((1./sum(di40_4)).^2.*(sum(eni40_4)).^2+(sum(ni40_4)./(sum(di40_4).^2)).^2.*(edi40_4).^2);

eni40_5=sqrt((stdTi)^2+(stdTi)^2+(stdc)^2+(stdc)^2);
edi40_5=sqrt((2.*(Ti40_5(:,1)-xa40_5)).^2.*(stdTi).^2+(2.*(Ti40_5(:,1)-xa40_5)).^2.*(stdTi).^2);
emi40_5 = sqrt((1./sum(di40_5)).^2.*(sum(eni40_5)).^2+(sum(ni40_5)./(sum(di40_5).^2)).^2.*(edi40_5).^2);

emi40s=[mean(emi40_2) mean(emi40_4) mean(emi40_5)]; 
emi40=mean(emi40s);

x1i=linspace(28,42,20);
y1i = mi40*x1i + bi40; 

%% Fitting data 30C
%Coefficients:
x=linspace(18,32,20);
  
  p11 = 0.071424;
  p21 = 2.0179;
  
  p12 = 0.074884;
  p22 = 1.9177;
  
  p13 = -0.04335;
  p23 = 5.3609;
  
  p14 = 0.067005;
  p24 = 2.1577;
  
  p15 = 0.074585;
  p25 = 2.0666;
  
  p16 = 0.073315;
  p26 = 2.0306;
  
  p1s=[p11 p12 p14 p15 p16]; p1=mean(p1s); %mS/C
  stdp1= std(p1s);
  p2s=[p21 p22 p24 p25 p26]; p2=mean(p2s);
  
  y = p1*x + p2; 
  

figure(1)
hold on
plot(T30_1,c30_1)
plot(T30_2,c30_2)
plot(T30_3,c30_3)
plot(T30_4,c30_4)
plot(T30_5,c30_5)
plot(T30_6,c30_6)
plot(x,y,'-')
xlim([18 32])
ylim([3.2 4.4])
xlabel('Temperature (\circC)')
ylabel('Conductivity (mS)')
title('Temperature v.s. conductivity with set-point temperature of 30\circC') 
legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','Best fit' ,'location','east')
hold off

xerr=stdT*ones(1,20);
yerr=sqrt((p1^2).*(stdT.^2)+(x.^2).*(stdp1.^2));
xerri=stdTi*ones(1,20);
yerri=sqrt((mi30^2).*(stdTi.^2)+(xi.^2).*(emi30.^2));
% xerri=0.5.*ones(1,20);
% yerri=0.5.*ones(1,20);


figure(2)
hold on
errorbar(x,y,yerr,yerr,xerr,xerr)
errorbar(xi,yi,yerri,yerri,xerri,xerri)
% plot(xi,yi,'-')
% errorbar(xi,yi,yerri,yerri,xerri,xerri)
xlim([18 32])
ylim([3.2 4.4])
xlabel('Temperature (\circC)')
ylabel('Conductivity (mS)')
title('Temperature v.s. conductivity with set-point temperature of 30\circC') 
legend('Best fit experimental data','best fit independant temperature source' ,'location','east')
hold off


%% Fitting data 40C
x2=linspace(28,42,20);
  
  p31 = 0.069874;
  p41 = 2.0608;
  
  p32 = 0.077672;
  p42 = 1.8363;
  
  p33 = -0.023724;
  p43 = 5.7798;
  
  p34 = 0.076746;
  p44 = 1.8981;
  
  p35 =0.072015;
  p45 = 2.1548;
  
  p36 = 0.072479;
  p46 = 2.0595;
  
  p3s=[p31 p32 p34 p35 p36]; p3=mean(p3s); %mS/C
  stdp3= std(p3s);
  p4s=[p41 p42 p44 p45 p46]; p4=mean(p4s);
  y2 = p3*x2 + p4; 
  
%Data-set3 excluded as range was too narrow
figure(3)
hold on
plot(T40_1,c40_1)
plot(T40_2,c40_2)
plot(T40_3,c40_3)
plot(T40_4,c40_4)
plot(T40_5,c40_5)
plot(T40_6,c40_6)
plot(x2,y2,'-')
xlabel('Temperature (\circC)')
ylabel('Conductivity (mS)')
title('Temperature v.s. conductivity with set-point temperature of 40\circC') 
legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','Best fit' ,'location','east')
hold off

x1err=stdT*ones(1,20);
y1err=sqrt((p3.^2).*(stdT.^2)+(x2.^2).*(stdp3.^2));
x1erri=stdTi*ones(1,20);
y1erri=sqrt((mi40.^2).*(stdTi.^2)+(x1i.^2).*(emi40.^2));

figure(4)
hold on
errorbar(x2,y2,y1err,y1err,x1err,x1err)
errorbar(x1i,y1i,y1erri,y1erri,x1erri,x1erri)
xlim([28 42])
% ylim([3.2 4.4])
xlabel('Temperature (\circC)')
ylabel('Conductivity (mS)')
title('Temperature v.s. conductivity with set-point temperature of 30\circC') 
legend('Best fit experimental data','best fit independant temperature source' ,'location','east')
hold off

%% Temperature coeffs


Theta30_1=abs(((c30_1(1,1)-c30_1(end,1))*100)/((T30_1(end,1)-T30_1(1,1))*c30_1(1,1)));
Theta30_2=abs(((c30_2(1,1)-c30_2(end,1))*100)/((T30_2(end,1)-T30_2(1,1))*c30_2(1,1)));
%Theta30_3=abs(((c30_3(1,1)-c30_3(end,1))*100)/((T30_3(end,1)-T30_3(1,1))*c30_3(1,1)));
Theta30_4=abs(((c30_4(1,1)-c30_4(end,1))*100)/((T30_4(end,1)-T30_4(1,1))*c30_4(1,1)));
Theta30_5=abs(((c30_5(1,1)-c30_5(end,1))*100)/((T30_5(end,1)-T30_5(1,1))*c30_5(1,1)));
Theta30_6=abs(((c30_6(1,1)-c30_6(end,1))*100)/((T30_6(end,1)-T30_6(1,1))*c30_6(1,1)));
Theta30s=[Theta30_1 Theta30_2 Theta30_4 Theta30_5 Theta30_6];
Theta30=mean(Theta30s);
stdTheta30=std(Theta30s);

Theta40_1=abs(((c40_1(1,1)-c40_1(end,1))*100)/((T40_1(end,1)-T40_1(1,1))*c40_1(1,1)));
Theta40_2=abs(((c40_2(1,1)-c40_2(end,1))*100)/((T40_2(end,1)-T40_2(1,1))*c40_2(1,1)));
%Theta40_3=abs(((c40_3(1,1)-c40_3(end,1))*100)/((T40_3(end,1)-T40_3(1,1))*c40_3(1,1)));
Theta40_4=abs(((c40_4(1,1)-c40_4(end,1))*100)/((T40_4(end,1)-T40_4(1,1))*c40_4(1,1)));
Theta40_5=abs(((c40_5(1,1)-c40_5(end,1))*100)/((T40_5(end,1)-T40_5(1,1))*c40_5(1,1)));
Theta40_6=abs(((c40_6(1,1)-c40_6(end,1))*100)/((T40_6(end,1)-T40_6(1,1))*c40_6(1,1)));
Theta40s=[Theta40_1 Theta40_2 Theta40_4 Theta40_5 Theta40_6];
Theta40=mean(Theta40s);
stdTheta40=std(Theta40s);

%Thetai30_1=abs(((c30_1(1,1)-c30_1(end,1))*100)/((Ti30_1(end,1)-Ti30_1(1,1))*c30_1(1,1)));
Thetai30_2=abs(((c30_2(1,1)-c30_2(end,1))*100)/((Ti30_2(end,1)-Ti30_2(1,1))*c30_2(1,1)));
%Theta30_3=abs(((c30_3(1,1)-c30_3(end,1))*100)/((T30_3(end,1)-T30_3(1,1))*c30_3(1,1)));
Thetai30_4=abs(((c30_4(1,1)-c30_4(end,1))*100)/((Ti30_4(end,1)-Ti30_4(1,1))*c30_4(1,1)));
Thetai30_5=abs(((c30_5(1,1)-c30_5(end,1))*100)/((Ti30_5(end,1)-Ti30_5(1,1))*c30_5(1,1)));
%Theta30_6=abs(((c30_6(1,1)-c30_6(end,1))*100)/((T30_6(end,1)-T30_6(1,1))*c30_6(1,1)));
Thetai30s=[Thetai30_2 Thetai30_4 Thetai30_5];
Thetai30=mean(Thetai30s);
stdThetai30=std(Thetai30s);

%Theta40_1=abs(((c40_1(1,1)-c40_1(end,1))*100)/((T40_1(end,1)-T40_1(1,1))*c40_1(1,1)));
Thetai40_2=abs(((c40_2(1,1)-c40_2(end,1))*100)/((Ti40_2(end,1)-Ti40_2(1,1))*c40_2(1,1)));
%Theta40_3=abs(((c40_3(1,1)-c40_3(end,1))*100)/((T40_3(end,1)-T40_3(1,1))*c40_3(1,1)));
Thetai40_4=abs(((c40_4(1,1)-c40_4(end,1))*100)/((Ti40_4(end,1)-Ti40_4(1,1))*c40_4(1,1)));
Thetai40_5=abs(((c40_5(1,1)-c40_5(end,1))*100)/((Ti40_5(end,1)-Ti40_5(1,1))*c40_5(1,1)));
%Theta40_6=abs(((c40_6(1,1)-c40_6(end,1))*100)/((T40_6(end,1)-T40_6(1,1))*c40_6(1,1)));
Thetai40s=[Thetai40_2 Thetai40_4 Thetai40_5];
Thetai40=mean(Thetai40s);
stdThetai40=std(Thetai40s);





%% Main Results

fprintf('The temperature rate of change from data at 30 celcius is : %.4f mS/C', p1);
fprintf('with error : %.4f mS/C', stdp1);
disp(' ')

fprintf('The temperature rate of change from data at 40 celcius is : %.4f', p3);
fprintf('with error : %.4f mS/C', stdp3);
disp(' ')

fprintf('The temperature rate of change from independant source at 30 celcius is : %.4f', mi30);
fprintf('with error : %.4f mS/C', emi30);
disp(' ')

fprintf('The temperature rate of change from independant source at 40 celcius is : %.4f', mi40);
fprintf('with error : %.4f mS/C', emi40);
disp(' ')

fprintf('The temperature coefficient from data at 30 celcius is : %.4f percent/C', Theta30);
fprintf('with error : %.4f percent/C', stdTheta30);
disp(' ')

fprintf('The temperature coefficient from data at 40 celcius is : %.4f percent/C', Theta40);
fprintf('with error : %.4f percent/C', stdTheta40);
disp(' ')

fprintf('The temperature coefficient from independant source at 30 celcius is : %.4f percent/C',Thetai30);
fprintf('with error : %.4f percent/C', stdThetai30);
disp(' ')

fprintf('The temperature coefficient from independant source at 40 celcius is : %.4f percent/C', Thetai40);
fprintf('with error : %.4f percent/C', stdThetai40);
disp(' ')

ap=mean([p1 p3 mi30 mi40]);
astdp=mean([stdp1 stdp3 emi30 emi40]);
fprintf('The average temperature rate of change is : %.4f mS/C', ap);
disp(' ')
fprintf('with error : %.4f mS/C', astdp);
disp(' ')

aTheta=mean([Theta30 Theta40 Thetai30 Thetai40]);
astdTheta=mean([stdTheta30 stdTheta40 stdThetai30 stdThetai40]);
fprintf('The average temperature coefficient is : %.4f percent/C', aTheta);
disp(' ')
fprintf('with error : %.4f percent/C', astdTheta);
disp(' ')




