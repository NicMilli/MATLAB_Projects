k=2;
l=4; %TRIAL #
    
   
figure ()
hold on
kin=sprintf('Group %d Trial %d Conversion of EtOAc vs. Time',k,l);
sgtitle(kin) 
         
        scatter(data(l).(datafields{k})(7:end,1),data(l).(datafields{k})(7:end,4));
%         hold on
%         [P,S] = polyfit(data(l).(datafields{k})(7:end,1), data(l).(datafields{k})(7:end,5),1);
% %         aaa= sprintf("t=5.2f*ln(x-1)+%.2f",P(1),P(2));
% %         annotation('textbox', [0.1, 0.9, 0.2, 0.2], 'String', "aaa")
%         slope(l,k) = -1/P(1);
%         Rsq(l,k)=1-(S.normr/norm(data(l).(datafields{k})(7:end,5)-mean(data(l).(datafields{k})(7:end,5))))^2;
%         data(l).(datafields{k})(7:end,15)=data(l).(datafields{k})(7:end,1).*P(1)+P(2);
%      
%         plot(data(l).(datafields{k})(7:end,1),data(l).(datafields{k})(7:end,15))

        hold off
        xlabel('time [s]','FontSize',13,'FontWeight','bold');
        ylabel('Conversion','FontSize',13,'FontWeight','bold');
        a= sprintf('Trial %d', l);
        aa= sprintf('Best fit line; R^2=%.2f', Rsq(l,k));
        legend([a],[aa],'location','southeast'); 
        
hold off
