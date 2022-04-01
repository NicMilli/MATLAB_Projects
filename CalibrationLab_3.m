close,clc,clear all
data31 = xlsread('CalibrationLab.xlsx','Set 1','B242:D2016');
data32 = xlsread('CalibrationLab.xlsx','Set 2','B79:D272');
data33 = xlsread('CalibrationLab.xlsx','Set 3','B83:C481');
data34 = xlsread('CalibrationLab.xlsx','Set 4','B85:D278');
data35 = xlsread('CalibrationLab.xlsx','Set 5','B85:C495');
data36 = xlsread('CalibrationLab.xlsx','Set 6','B85:D2067');

F_sp2=xlsread('CalibrationLab.xlsx','Set 2','c77');F2=F_sp2/(1000*60);
F_sp3=xlsread('CalibrationLab.xlsx','Set 3','c81');F3=F_sp3/(1000*60);
F_sp4=xlsread('CalibrationLab.xlsx','Set 4','c83');F4=F_sp4/(1000*60);
F_sp5=xlsread('CalibrationLab.xlsx','Set 5','c83');F5=F_sp5/(1000*60);
F_sp6=xlsread('CalibrationLab.xlsx','Set 6','c83');F6=F_sp6/(1000*60);

t1=data31(:,1); t2=data32(:,1); t3=data33(:,1); %time(s)
t4=data34(:,1); t5=data35(:,1); t6=data36(:,1);

c1=data31(:,2);c2=data32(:,2); c3=data33(:,2); %conductivity(mS)
c4=data34(:,2); c5=data35(:,2); c6=data36(:,2);

stdc1=mean(data31(:,3));stdc2=mean(data32(:,3)); %stdc3=data33(:,3); %standard dev in conductivity(mS)
stdc4=mean(data34(:,3));stdc6=mean(data36(:,3)); %stdc5=data35(:,3);


%%
mic_Na=50.1; mic_OH=198.6; mic_H3O=349.8; mic_HOac=40.9+349.8;mic_CH3COO=40.9;
mic_soln= mic_Na+mic_OH+mic_H3O+mic_HOac;
%% assuming 
etime=0.005;
etime6=etime.*ones(size(c6));

Naconc6=c6./mic_Na;
eNaconc6=sqrt((1/mic_Na)^2*(stdc6)^2).*ones(size(c6));

OHconc6=c6./mic_OH;
eOHconc6=sqrt((1/mic_OH)^2*(stdc6)^2).*ones(size(c6));

conc6=(1./(c6.*mic_HOac));
econc6=sqrt(((1/(mic_HOac*c6.^2)).^2.*(stdc6).^2));
econc6=[econc6]';

 H3Oconc6=(1./(c6.*mic_H3O));
 eH3Oconc6=sqrt(((1/(mic_H3O*c6.^2)).^2.*(stdc6).^2));
 eH3Oconc6=[eH3Oconc6]';
 
 CH3COOconc6=(1./(c6.*mic_CH3COO));
 eCH3COOconc6=sqrt(((1/(mic_CH3COO*c6.^2)).^2.*(stdc6).^2));
 eCH3COOconc6=[eCH3COOconc6]';
 
 pH=-log10(H3Oconc6);
 epH=sqrt((-1./H3Oconc6).^2.*(eH3Oconc6).^2);
 
 figure(1)
 hold on
 errorbar(t6,conc6,econc6,econc6,etime6,etime6)
title('HOac') 
hold off

 figure(2)
 hold on
 errorbar(t6,Naconc6,eNaconc6,eNaconc6,etime6,etime6)
title('Na') 
hold off

 figure(3)
hold on
 errorbar(t6,OHconc6,eOHconc6,eOHconc6,etime6,etime6)
 title('OH')
 hold off
 
 figure(4)
 hold on
 errorbar(t6,H3Oconc6,eH3Oconc6,eH3Oconc6,etime6,etime6)
 title('H3O')
 hold off
 
 figure(5)
 hold on
 errorbar(t6,CH3COOconc6,eCH3COOconc6,eCH3COOconc6,etime6,etime6)
 title('CH3COO')
 
 figure(6)
hold on
 errorbar(t6,pH,epH,epH,etime6,etime6)
 title('pH')
 hold off
 %Naconc2=1/(c2./1000)./mic_Na; 
% Naconc4=c4./mic_Na; Naconc5=c5./mic_Na; Naconc6=c6./mic_Na;
% 
% OHconc1=c1./mic_OH; OHconc2=c2./mic_OH; OHconc3=c3./mic_OH;
% OHconc4=c4./mic_OH; OHconc5=c5./mic_OH; OHconc6=c6./mic_OH;
% 
% H3Oconc1=c1./mic_H3O; H3Oconc2=c2./mic_H3O; H3Oconc3=c3./mic_H3O;
% H3Oconc4=c4./mic_H3O; H3Oconc5=c5./mic_H3O; H3Oconc6=c6./mic_H3O;
% 
% HOacconc1=c1./mic_HOac; HOacconc2=c2./mic_HOac; HOacconc3=c3./mic_HOac;
% HOacconc4=c4./mic_HOac; HOacconc5=c5./mic_HOac; HOacconc6=c6./mic_HOac;
% 
% HOacconc1=c1./mic_HOac; HOacconc2=c2./mic_HOac; HOacconc3=c3./mic_HOac;
% HOacconc4=c4./mic_HOac; HOacconc5=c5./mic_HOac; HOacconc6=c6./mic_HOac;
% 
% pH1=-log(H3Oconc1);
% 
% %% Plot
% figure(1)
% hold on
% plot(t1,c1)
% plot(t2,c2)
% plot(t3,c3)
% plot(t4,c4)
% plot(t5,c5)
% plot(t6,c6)
% xlabel('time(s)')
% ylabel('Conductivity (mS)')
% %title('\circC') 
% legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','location','east')
% hold off
% 
% figure(2)
% hold on
% plot(t1,Naconc1)
% plot(t2,Naconc2)
% plot(t3,Naconc3)
% plot(t4,Naconc4)
% plot(t5,Naconc5)
% plot(t6,Naconc6)
% xlabel('time(s)')
% ylabel('Conductivity (mS)')
% %title('\circC') 
% legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','location','east')
% hold off
% 
% figure(3)
% hold on
% plot(t1,OHconc1)
% plot(t2,OHconc2)
% plot(t3,OHconc3)
% plot(t4,OHconc4)
% plot(t5,OHconc5)
% plot(t6,OHconc6)
% xlabel('time(s)')
% ylabel('Conductivity (mS)')
% %title('\circC') 
% legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','location','east')
% hold off
% 
% figure(4)
% hold on
% plot(t1,H3Oconc1)
% plot(t2,H3Oconc2)
% plot(t3,H3Oconc3)
% plot(t4,H3Oconc4)
% plot(t5,H3Oconc5)
% plot(t6,H3Oconc6)
% xlabel('time(s)')
% ylabel('Conductivity (mS)')
% %title('\circC') 
% legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','Best fit' ,'location','east')
% hold off
% 
% figure(5)
% hold on
% plot(t1,HOacconc1)
% plot(t2,HOacconc2)
% plot(t3,HOacconc3)
% plot(t4,HOacconc4)
% plot(t5,HOacconc5)
% plot(t6,HOacconc6)
% xlabel('time(s)')
% ylabel('Conductivity (mS)')
% %title('\circC') 
% legend('Dataset1', 'Dataset2','Dataset3','Dataset4','Dataset5','Dataset6','Best fit' ,'location','east')
% hold off