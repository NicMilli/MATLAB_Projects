%% Converts conductivity data to conversion as a function of time:
function c_c = c22c(concNaOHi,concEtOAci,A11,A22,A33,cond)
convt=ones(size(cond)); %Initialize conversion output vectore

if concNaOHi <= concEtOAci %Group 1,3,4,5,6
    for i=1:length(cond)
     func = @(Xt) A11*(concNaOHi/2) + A22*(concNaOHi/2*(1-Xt)) + A33*(concNaOHi/2*Xt) - cond(i);
     X = fsolve(func, 0.1);
     convt(i)=X;
    end
    
else concNaOHi > concEtOAci %Group 2
    for i=1:length(cond)
   func = @(Xt) A11*(concNaOHi/2) + A22*(concEtOAci/2*(concNaOHi/concEtOAci-Xt)) + A33*(concEtOAci/2*(1-Xt)) - cond(i);
   X = fsolve(func, 0.1); 
   convt(i)=X;
    end
end
c_c = [convt];
end
