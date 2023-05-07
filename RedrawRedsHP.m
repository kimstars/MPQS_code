function RedrawRedsHP()
global Reds;
global RedsNum;
global MaxRedNum;
global RedsHP;
global BloodPos;
global SizeHPBar;

delete(RedsHP);
for i = 1 : RedsNum           
    if (Reds(i,15)>0)       
        x1=Reds(i,1)-25;
        x2=Reds(i,1)-25 + Reds(i,15)/2;
        y1=Reds(i,2)+BloodPos;
        y2=Reds(i,2)+BloodPos;                  
        RedsHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);%line([x1 x2],[y1 y2],'Color','red','LineStyle','-');       
    end
end
drawnow;