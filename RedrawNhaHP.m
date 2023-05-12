function RedrawNhaHP(Nhas, NhaNum)
    %global Nhas;
    global Vantais;
    %global NhasNum;
    global MaxRedNum;
    global NhasHP;
    global BloodPos;
    global SizeHPBar;
    
    delete(NhasHP);
    for i = 1 : NhaNum           
        if (Nhas(i,15)>0)       
            x1=Nhas(i,1)-25;
            x2=Nhas(i,1)-25 + Nhas(i,15)/40 - 2;
            y1=Nhas(i,2)+BloodPos;
            y2=Nhas(i,2)+BloodPos;                  
            NhasHP(i)=plot([x1 x2],[y1 y2],'-','Color','b','LineWidth',1.5*SizeHPBar);%line([x1 x2],[y1 y2],'Color','blue','LineStyle','-');       
        end
    end
    drawnow;
end