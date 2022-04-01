clc

%% pH vs. Conductivity calibration
% Parameters
time = xlsread('Calibration Lab Data Groups (1, 3, 5, 7, 9)', 'Set 6', 'B85:B2067');
M_NaOH = 0.1; % mol/L
M_Acetic = 0.2; % mol/L
Ka = .000018; 
Kw = 1e-14; % assuming water is inactive
Kb = 1e-14/Ka;
pKa = -log10(Ka);
flowrate = 35.6/60/1000; % L/s, 35.6 comes from flow rate calibration when set point flowrate is 40 L/min

% Calculation of total volume of liquid inside the reactor for all time.
volume = 0.333*ones(size(time));
for i = 1:length(time)
    volume(i) = volume(i) + flowrate*time(i);% no liquid leaving the reactor
end

% Concentration initailization
mol_Na = zeros(size(time)); 
for i = 1:length(time)-1
    mol_Na(i+1) = mol_Na(i) + M_NaOH*flowrate*1;
end
C_Acetate = zeros(size(time));
C_Acetic = 0.2*ones(size(time));
C_Na = mol_Na./volume;
C_OH = zeros(size(time));
C_H3O = zeros(size(time));
pH = zeros(size(time));
x_concentration = fzero(@(x) x^2/(0.2-x) - Ka, 0.001);
C_Acetate(1) = x_concentration;
C_H3O(1) = x_concentration;
C_OH(1) = Kw/x_concentration;
pH(1) = -log10(C_H3O(1));

% equivalence point time 
teq = floor(0.666*60*1000/35.6);

% before equivalence point situation 
for t = 2:teq+1
    mol_Acetic = 0.333*0.2 - M_NaOH*flowrate*time(t);
    C_Acetic(t) = mol_Acetic/volume(t);
    
    mol_Acetate = C_Acetate(1)*0.333 + M_NaOH*flowrate*time(t);
    C_Acetate(t) = mol_Acetate/volume(t);
    
    pH(t) = pKa + log10(C_Acetate(t)/C_Acetic(t));
    C_H3O(t) = 10^(-pH(t));
    C_OH(t) = Kw/C_H3O(t);
end

% after equivalence point situation.
for t = teq+2:length(time)
    C_Acetate(t) = C_Acetate(teq + 1);
    mol_OH = M_NaOH*flowrate*time(t) - M_NaOH*(.666*60*1000/35.6)/1000/60*35.6;
    pH(t) = 14+log10(mol_OH/volume(t));
    C_OH(t) = mol_OH/volume(t);
    C_H3O(t) = Kw/C_OH(t);
end

%% Conductivity Calculations
% parameters
LMC_Na = 50.1; % S cm^2/mol
LMC_OH = 198.6;
LMC_Acetate = 40.9;
LMC_H3O = 349.8;

% conductivity initialization
total_conductivity = xlsread('Calibration Lab Data Groups (1, 3, 5, 7, 9)', 'Set 6', 'C85:C2067');
total_conductivity = total_conductivity(55:end);
calculated_conductivity = zeros(size(total_conductivity));
for i = 1:length(time)-54
    calculated_conductivity(i) = LMC_Na*C_Na(i) + LMC_Acetate*C_Acetate(i) + LMC_H3O*C_H3O(i) + LMC_OH*C_OH(i);
end

%% Error Analysis
pH_err = zeros(size(time));
C_Na_err = zeros(size(time));
C_OH_err = zeros(size(time));
C_Acetate_err = zeros(size(time));
C_H3O_err = zeros(size(time));
delta_Flowrate = 2.17/60/1000; % comes from 40ml/min set flowrate deviation data
delta_Volume = 0.005; % from data given

%% before equivalence point situation
% C_Na
dNa_dV = @(F, V, t) -F/(10*(V + F*t)^2);
dNa_dF = @(F, V, t) 1/(10*(V + F*t)) - (F*t)/(10*(V + F*t)^2);
for i = 2:teq+1
    C_Na_err(i) = ((dNa_dV(flowrate, 0.333, time(i))*delta_Volume)^2 + (dNa_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5;
end

% C_Acetate
dAcetate_dV = @(F, V, t) -(F*t)/(10*(V + F*t)^2);
dAcetate_dF = @(F, V, t) t/(10*(V + F*t)) - (F*t^2)/(10*(V + F*t)^2);
for i = 2:teq + 1
    C_Acetate_err(i) = ((dAcetate_dV(flowrate, 0.333, time(i))*delta_Volume)^2 + (dAcetate_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5;
end

% C_H3O
dH3O_dV = @(F, V, t) -1/(50*log(10)*(V/5 - (F*t)/10));
dH3O_dF = @(F, V, t) ((V/5 - (F*t)/10)*(t/(10*(V/5 - (F*t)/10)) + (F*t^2)/(100*(V/5 - (F*t)/10)^2)))/(F*t*log(10));
for i = 2:teq + 1
    C_H3O_err(i) = ((dH3O_dV(flowrate, 0.333, time(i))*delta_Volume)^2 + (dH3O_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5;
end

% Error in C_OH
for i = 1:teq+1 
 C_OH_err(i) = Kw/C_H3O_err(i);
end

% pH
dpH_dV = @(F, V, t) -1/(5*log(10)*(V/5 - (F*t)/10));
dpH_dF = @(F, V, t) (10*(V/5 - (F*t)/10)*(t/(10*(V/5 - (F*t)/10)) + (F*t^2)/(100*(V/5 - (F*t)/10)^2)))/(F*t*log(10));
for i = 2:teq+1
    pH_err(i) = ((dpH_dV(flowrate, 0.333, time(i))*delta_Volume)^2 + (dpH_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5; 
end

%% after equivalence point situation
% C_Na
dNa_dV = @(F, V, t) -F/(10*(V + F*t)^2);
dNa_dF = @(F, V, t) 1/(10*(V + F*t)) - (F*t)/(10*(V + F*t)^2);
for i = teq+2:length(time)
    C_Na_err(i) = ((dNa_dV(flowrate, 0.333, time(i))*delta_Volume)^2 + (dNa_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5;
end

% C_Acetate   
for i = teq+2:length(time)
    C_Acetate_err(i) = C_Acetate_err(teq+1);
end

% C_OH
dOH_dV = @(F, V, t) ((1332*F)/11 - (F*t)/10)/(V + F*t)^2;
dOH_dF = @(F, V, t) (t/10 - 1332/11)/(V + F*t) + (t*((1332*F)/11 - (F*t)/10))/(V + F*t)^2;
for i = teq+2:length(time)
    C_OH_err(i) = ((dOH_dV(flowrate, 0.333, time(i))*delta_Volume)^2 + (dOH_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5;
end

% pH
dpH_dV = @(F, V, t)-1/(log(10)*(V+F*t));
dpH_dF = @(F, V, t)-(((t/10-1332/11)/(V + F*t)+(t*((1332*F)/11-(F*t)/10))/(V + F*t)^2)*(V + F*t))/(log(10)*((1332*F)/11 - (F*t)/10));
for i = teq+2:length(time)
    pH_err(i) = ((dpH_dV(flowrate, 0.333, time(i))*delta_Volume)^2+(dpH_dF(flowrate, 0.333, time(i))*delta_Flowrate)^2)^.5; 
end

%% Plots
% conductivity vs. time
figure
plot(time(1:1929), total_conductivity(1:1929), time(1:1929), calculated_conductivity(1:1929));
title('conductivity vs time');
xlabel('time (s)');
ylabel('conductivity (mS/cm)');
legend('experimental conductivity', 'theoritcal Conductivity');

% concentration of sodium ion vs. time
figure
errorbar(time(1:50:end), C_Na(1:50:end), C_Na_err(1:50:end))
title('concentration of Na^{+} vs time');
xlabel('time (s)');
ylabel('concentration (mol/L)');

% concentration of acetate ion vs. time
figure
errorbar(time(1:50:end), C_Acetate(1:50:end), C_Acetate_err(1:50:end));
title('concnetration of CH_{3}COO^{-} vs time');
xlabel('time (s)');
ylabel('concentration (mol/L)');

% concentration of hydronium ion vs. time
figure
subplot(1,2,1)
plot(time, C_H3O, 'b-')
xlabel('time (s)')
ylabel('concentration (mol/L)')
subplot(1,2,2)
errorbar(time(1:25:1982), C_H3O(1:25:1982), C_H3O_err(1:25:1982), 'r.')
title('concentration of H^{+} Ions vs Time')
xlabel('time (s)')
ylabel('concentration (mol/L)')

% concentration of hydroxide ion vs. time
figure
plot(time, C_OH, 'b-');
errorbar(time(1:50:end), C_OH(1:50:end), C_OH(1:50:end), 'b.');
title('concnetration of OH^{-} vs. Time');
xlabel('time (s)');
ylabel('concentration (mol/L)');

% pH vs. time
figure
subplot(1,2,1);
plot(time, pH);
xlabel('time (s)');
ylabel('pH');
title('theoretical pH vs.time');
subplot(1,2,2);
errorbar(time(1:25:end), pH(1:25:end), pH_err(1:25:end), '.');
title('experimental pH vs. time');
xlabel('time (s)');
ylabel('pH');