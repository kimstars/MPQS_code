function RedrawNhaHP()
    global Nhas;
    global Vantais;
    global NhasNum;
    global MaxRedNum;
    global NhasHP;
    global BloodPos;
    global SizeHPBar;
    
    delete(NhasHP);
    for i = 1 : NhasNum           
        if (Nhas(i,15)>0)       
            x1=Nhas(i,1)-25;
            x2=Nhas(i,1)-25 + Nhas(i,15)/40 - 2;
            y1=Nhas(i,2)+BloodPos;
            y2=Nhas(i,2)+BloodPos;                  
            NhasHP(i)=plot([x1 x2],[y1 y2],'-','Color','b','LineWidth',SizeHPBar);%line([x1 x2],[y1 y2],'Color','blue','LineStyle','-');       
        end
    end

    % if (Vantais(i,15)>0)       
    %     x1=Vantais(i,1)-25;
    %     x2=Vantais(i,1)-25 + Vantais(i,15)/40 - 2;
    %     y1=Vantais(i,2)+BloodPos;
    %     y2=Vantais(i,2)+BloodPos;                  
    %     VantaisHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);%line([x1 x2],[y1 y2],'Color','red','LineStyle','-');       
    % end
    drawnow;