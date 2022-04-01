%% Generate datapoints for plots to determin reaction order:
for j=[1,3,5,6]
    for i=1:4
data(i).(datafields{j})(7:end,5)=1./(concNaOHi(i,j).*(1-data(i).(datafields{j})(7:end,4)));
data(i).(datafields{j})(7:end,6)=hampel(data(i).(datafields{j})(7:end,5));
    end
end

for i=1:4
  data(i).(datafields{2})(7:end,5)=-log(1-data(i).(datafields{2})(7:end,4));
  data(i).(datafields{4})(7:end,5)=-log(1-data(i).(datafields{4})(7:end,4));
%data(i).(datafields{2})(7:end,6)=hampel(data(i).(datafields{2})(7:end,5));
%data(i).(datafields{4})(7:end,6)=hampel(data(i).(datafields{4})(7:end,5));
end

%% Plot to test linearity hypothesis. K can be determines from the best fit line.
slope=ones(4,6);
Rsq=ones(4,6);
for k=[1,3,5,6]
    
   hold on
figure (k)
kin=sprintf('Group %d [1/(1-x)] vs. time',k);
sgtitle(kin)

    for l=1:4 
        
        subplot(2,2,l) %makes a 2x3 plot array where the "i" is designating which subplot
        
        scatter(data(l).(datafields{k})(7:end,1),data(l).(datafields{k})(7:end,6)) 
        hold on
        [P,S] = polyfit(data(l).(datafields{k})(7:end,1), data(l).(datafields{k})(7:end,6),1);
        slope(l,k) = P(1);
        Rsq(l,k)=1-(S.normr/norm(data(l).(datafields{k})(7:end,5)-mean(data(l).(datafields{k})(7:end,5))))^2;
        data(l).(datafields{k})(7:end,15)=data(l).(datafields{k})(7:end,1).*P(1)+P(2);
 if l==1
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [(l*.4)-.25 .875 .15 .03],'String', aaa,'FontSize',8);
 elseif l==2
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [(l*.4)-(.4/l) .875 .15 .03],'String', aaa,'FontSize',8);
 elseif l==3
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [((l-2)*.4)-.25 .4 .15 .03],'String', aaa,'FontSize',8);
  elseif l==4
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [((l-2)*.4)-.2 .4 .15 .03],'String', aaa,'FontSize',8);

 end
        plot(data(l).(datafields{k})(7:end,1),data(l).(datafields{k})(7:end,15))
hold off      
        xlabel('time [s]','FontSize',13,'FontWeight','bold');
        ylabel('[1/(1-x)]','FontSize',13,'FontWeight','bold');
        a= sprintf('Trial %d', l);
        aa= sprintf('Best fit line; R^2=%.2f', Rsq(l,k));
        legend([a],[aa],'location','southeast'); 
       
    end
hold off
end
%%
for k=[2,4]
    
   hold on
figure (k)
kin=sprintf('Group %d ln(1-x) vs. Time',k);
sgtitle(kin)

    for l=1:4 
        subplot(2,2,l) %makes a 2x3 plot array where the "i" is designating which subplot
        
        scatter(data(l).(datafields{k})(7:end,1),data(l).(datafields{k})(7:end,5));
        hold on
        [P,S] = polyfit(data(l).(datafields{k})(7:end,1), data(l).(datafields{k})(7:end,5),1);

slope(l,k) = 1/P(1);
        Rsq(l,k)=1-(S.normr/norm(data(l).(datafields{k})(7:end,5)-mean(data(l).(datafields{k})(7:end,5))))^2;
        data(l).(datafields{k})(7:end,15)=data(l).(datafields{k})(7:end,1).*P(1)+P(2);
%   % For group 2:
%         if l<=2
%         aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
%  hAnnot(l) = annotation('textbox', [(l*.4)-.1 .8 .15 .03],'String', aaa,'FontSize',8);
%   elseif l>=2
%         aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
%  hAnnot(l) = annotation('textbox', [(l-2)*.4-.1 .2 .15 .03],'String', aaa,'FontSize',8);
%   end
  % For group 4:
        if l<=2
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [(l*.4)-.2 .875 .13 .03],'String', aaa,'FontSize',8);
  elseif l==3
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [((l-2)*.4)-.25 .4 .13 .03],'String', aaa,'FontSize',8);
  elseif l==4
        aaa= sprintf('y=%.4f*x +%.2f',P(1),P(2));
 hAnnot(l) = annotation('textbox', [((l-2)*.4)-.2 .4 .13 .03],'String', aaa,'FontSize',8);

        end
  plot(data(l).(datafields{k})(7:end,1),data(l).(datafields{k})(7:end,15))
        

        hold off
        xlabel('time [s]','FontSize',13,'FontWeight','bold');
        ylabel('ln(1-x)','FontSize',13,'FontWeight','bold');
        a= sprintf('Trial %d', l);
        aa= sprintf('Best fit line; R^2=%.2f', Rsq(l,k));
%         % Group 2
%         if l==1
%         legend([a],[aa],'location','northeast'); 
%         elseif l==2
%         legend([a],[aa],'location','northeast');     
%         else
%          legend([a],[aa],'location','southeast');    
%         end
 % Group 4
 legend([a],[aa],'location','southeast','FontSize',8);   
      
            end
hold off
end
%%

for i=1:4
    x(i,1)=-1./mean(data(i).(datafields{1})(7:end,2));
    y(i,1)=log(slope(i,1));
        x(i,2)=-1./mean(data(i).(datafields{3})(7:end,2));
        y(i,2)=log(slope(i,3));
        x(i,3)=-1./mean(data(i).(datafields{5})(7:end,2));
        y(i,3)=log(slope(i,5));
        x(i,4)=-1./mean(data(i).(datafields{6})(7:end,2));
        y(i,4)=log(slope(i,6));
end
%%
X=reshape(x,[16,1]);
Y=reshape(y,[16,1]);
xvec1=[X(1,1) X(5,1) X(9,1) X(13,1)];
xvec2=[X(2,1) X(6,1) X(10,1) X(14,1)];
xvec3=[X(3,1) X(7,1) X(11,1) X(15,1)];
xvec4=[X(4,1) X(8,1) X(12,1) X(16,1)];
yvec1=[Y(1,1) Y(5,1) Y(9,1) Y(13,1)];
yvec2=[Y(2,1) Y(6,1) Y(10,1) Y(14,1)];
yvec3=[Y(3,1) Y(7,1) Y(11,1) Y(15,1)];
yvec4=[Y(4,1) Y(8,1) Y(12,1) Y(16,1)];
xvec=[[xvec1]' [xvec2]' [xvec3]' [xvec4]'];
yvec=[[yvec1]' [yvec2]' [yvec3]' [yvec4]'];
R=8.314;
for i=1:4
    
 figure (i)
scatter(xvec(:,i),yvec(:,i)) 
hold on
[P2,S] = polyfit(xvec(:,i),yvec(:,i),1);
    slope2 = P2(1);
    Rsq=1-(S.normr/norm(yvec-mean(yvec)))^2;
    y2=xvec(:,i).*P2(1)+P2(2);
    A(4)=exp(P2(2));
    Ea(4)=(P2(1)*R)/1000;
 plot(xvec(:,i),y2)
 aaa= sprintf('ln(k)= %.2f*-1/T + %.2f; R^2=%.2f', P2(1), P2(2),Rsq);
 annotation('textbox', [0.59, 0.75, 0.3, 0.1], 'String', aaa)   
        legend('Reaction rate constants','location','northeast'); 
xlabel('-1/T [1/k]','FontSize',13,'FontWeight','bold');
ylabel('ln(k)','FontSize',13,'FontWeight','bold'); 
title('Activation Energy determination')
hold off
end


%%
for j=[1,3,5,6]
    for i=1:4
       sprintf('The reaction rate constant is %.2f at %.2f', slope(i,j),mean(data(i).(datafields{j})(7:end,2))) 
    end
end
