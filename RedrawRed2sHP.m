function RedrawRed2sHP()
global Red2s;
global Red2sNum;
global MaxRedNum;
global Red2sHP;
global BloodPos;
global SizeHPBar;

delete(Red2sHP);
for i = 1 : Red2sNum           
    if (Red2s(i,15)>0)       
        x1=Red2s(i,1)-25;
        x2=Red2s(i,1)-25 + Red2s(i,15)/2 - 2;
        y1=Red2s(i,2)+BloodPos;
        y2=Red2s(i,2)+BloodPos;                  
        Red2sHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);%line([x1 x2],[y1 y2],'Color','red','LineStyle','-');       
    end
end
drawnow;