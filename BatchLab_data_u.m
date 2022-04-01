close, clc, clear all

[Fn,Pn]=uigetfile('*.xlsx','Select Excel files to analyze:',...
    'MultiSelect','on');
% Drag down select ALL 6 excel files (each sheet is saved separately)
%%
Trials=['B:D' ;'F:H'; 'J:L'; 'N:P'] ;
data=struct('Group1',{},'Group2',{},'Group3',{},'Group4',{},'Group5',{},'Group6',{});
datafields=fieldnames(data);
Fni=char(Fn);
for q=1:length(datafields) %file names/sheets are fields
    for w=1:length(Trials) %trials are values
        data(w).(datafields{q})=xlsread(Fni(q,:),Trials(w,:));
         %data(w).(datafields{q})(7:end,1)=data(w).(datafields{q})(7:end,1)./60; %Convert t from s to min
         data(w).(datafields{q})(7:end,2)=data(w).(datafields{q})(7:end,2)+273.15; %Convert T from C to K
         %data(w).(datafields{q})(7:end,3)=data(w).(datafields{q})(7:end,3).*10e-3;
    end
end

%% data(TRIAL#).Group#(ROWS,COLUMNS)!!!!!!!!!!!!!!!!!!!!!!
%---Column1- time readings; Column2- Temperature; Column3- conductivity;
%Column4- Conversion(added inother file)
%%
mic_Na=50.9; mic_OH=192; mic_CH3COO=40.8;
A1=50.9; A2=192; A3=40.8;
T=ones(4,6);
%% Initial concentrations (calculated by groups):
for j=1:6
    for i=1:4
concNaOHi(i,j)=data(i).(datafields{j})(1,2)/2; %reported NaOH initial,(/2 since volume doubles upon mixing)
concEtOAci(i,j)=data(i).(datafields{j})(2,2)/2; %reported Ethyl Acetate initial
conc_diff(i,j)=concNaOHi(i,j)-concEtOAci(i,j);  
    end
end
%% Conversion vs time calculation:
for j=1:6
    for i=1:4
data(i).(datafields{j})(7:end,4)=c22c(concNaOHi(i,j)*2,concEtOAci(i,j)*2,A1,A2,A3,data(i).(datafields{j})(7:end,3));
    end
end
  
%% Estimate Tcoeffs - Using equations in conductivity handout
%  for i=1:4
%  Theta2530(i)= ((abs(data(i).(datafields{3})(8,3)-data(i).(datafields{1})(8,3))).*100)./((abs(data(i).(datafields{3})(8,2)-data(i).(datafields{1})(8,2))).*data(i).(datafields{1})(8,3));
%     end
%    Tcoeff1=mean(Theta2530);
%    
% %    for i=1:4
% %  Theta25302(i)= ((abs(data(i).(datafields{3})(8,3)-data(i).(datafields{2})(8,3))).*100)./((abs(data(i).(datafields{3})(8,2)-data(i).(datafields{2})(8,2))).*data(i).(datafields{2})(8,3));
% %     end
% %    Tcoeff12=mean(Theta25302);
% %    
% %    for i=1:4
% %  Theta30352(i)= ((abs(data(i).(datafields{5})(8,3)-data(i).(datafields{4})(8,3))).*100)./((abs(data(i).(datafields{5})(8,2)-data(i).(datafields{4})(8,2))).*data(i).(datafields{4})(8,3));
% %     end
% %    Tcoeff22=mean(Theta30352);
%    
%    for i=1:4
%  Theta3035(i)= ((abs(data(i).(datafields{5})(8,3)-data(i).(datafields{3})(8,3))).*100)./((abs(data(i).(datafields{5})(8,2)-data(i).(datafields{3})(8,2))).*data(i).(datafields{3})(8,3));
%     end
%    Tcoeff2=mean(Theta3035);
%    
% %    Tcoeff1=mean([Tcoeff11 Tcoeff12])
% %    Tcoeff2=mean([Tcoeff21 Tcoeff22])
%    
%    for i=1:4
%  Theta3540(i)= ((abs(data(i).(datafields{6})(8,3)-data(i).(datafields{5})(8,3))).*100)./((abs(data(i).(datafields{6})(8,2)-data(i).(datafields{5})(8,2))).*data(i).(datafields{5})(8,3));
%     end
%    Tcoeff3=mean(Theta3540);
%  Tcoeff=2;
%%
% %Adjusting molar ionic conductivities to T
% A11=A1.*ones(4,6);
% A22=A2.*ones(4,6);
% A33=A3.*ones(4,6);
% for j=3:4
%     hold on
%     for i=1:4 
%  
%   A11(i,j)=(A1.*((100+Tcoeff1.*((30+273.15)-(25+273.15)))./100));
%   A22(i,j)=(A2.*((100+Tcoeff1*((30+273.15)-(25+273.15)))./100));
%   A33(i,j)=(A3.*((100+Tcoeff1*((30+273.15)-(25+273.15)))./100));
%     end
% end
% 
% for i=1:4
%   
%    A11(i,5)=(A1.*((100+Tcoeff1.*((30+273.15)-(25+273.15)))./100)).*((100+Tcoeff2.*((35+273.15)-(30+273.15)))./100);
%    A22(i,5)=(A2.*((100+Tcoeff1.*((30+273.15)-(25+273.15)))./100)).*((100+Tcoeff2.*((35+273.15)-(30+273.15)))./100);
%    A33(i,5)=(A3.*((100+Tcoeff1.*((30+273.15)-(25+273.15)))./100)).*((100+Tcoeff2.*((35+273.15)-(30+273.15)))./100);
%    
%    A11(i,6)=(A11(i,5).*((100+Tcoeff3*((40+273.15)-(35+273.15)))./100));
%    A22(i,6)=(A22(i,5).*((100+Tcoeff3*((40+273.15)-(35+273.15)))./100));
%    A33(i,6)=(A33(i,5).*((100+Tcoeff3*((40+273.15)-(35+273.15)))./100));
% 
% end
% %
% %Adjusting conductivity readings to T
% for j=1:6
%     for i=1:4
% T(i,j)=mean(data(i).(datafields{j})(7:end,2));
%     end
% end
% 
% for j=1:2
%     hold on
%     for i=1:4 
%   data(i).(datafields{j})(7:end,10)=(data(i).(datafields{j})(7:end,3)).*((100+Tcoeff1.*((25+273.15)-data(i).(datafields{j})(7:end,2)))./100);
%       end
% end
% 
% for j=3:4
%     hold on
%     for i=1:4 
%    data(i).(datafields{j})(7:end,10)=(data(i).(datafields{j})(7:end,3)).*((100+Tcoeff2.*((30+273.15)-data(i).(datafields{j})(7:end,2)))./100);
%       end
% end
% 
% for i=1:4
%    data(i).(datafields{5})(7:end,10)=(data(i).(datafields{5})(7:end,3)).*((100+Tcoeff3.*((35+273.15)-data(i).(datafields{5})(7:end,2)))./100);  
%    data(i).(datafields{6})(7:end,10)=(data(i).(datafields{6})(7:end,3)).*((100+Tcoeff3.*((30+273.15)-data(i).(datafields{6})(7:end,2)))./100);
% end