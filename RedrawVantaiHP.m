function RedrawVantaiHP()
    global Nhas;
    global Vantais;
    global MaxVantaiNum;
    global MaxRedNum;
    global VantaisHP;
    global BloodPos;
    global SizeHPBar;
    
    delete(VantaisHP);
    for i = 1 : MaxVantaiNum           
        if (Vantais(i,15)>0)       
            x1=Vantais(i,1)-25;
            x2=Vantais(i,1)-25 + Vantais(i,15)/40 - 2;
            y1=Vantais(i,2)+BloodPos;
            y2=Vantais(i,2)+BloodPos;                  
            VantaisHP(i)=plot([x1 x2],[y1 y2],'-','Color','b','LineWidth',1.5*SizeHPBar);%line([x1 x2],[y1 y2],'Color','red','LineStyle','-');       
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