function RedrawBlueHP()
global Blues;
global BluesNum;
global MaxBlueNum;
global BluesHP;
global BloodPos;
global SizeHPBar;

delete(BluesHP);

for i = 1 : BluesNum
    if(Blues(i,15)>0)
                    
        x1=Blues(i,1) - 2;
        x2=Blues(i,1)+Blues(i,15)/2 - 2;
        y1=Blues(i,2)+BloodPos + 60;
        y2=Blues(i,2)+BloodPos + 60;                  
        BluesHP(i)=plot([x1 x2],[y1 y2],'-','Color','b','LineWidth',SizeHPBar);%line([x1 x2],[y1 y2],'Color','Blue','LineStyle','-');  
    end
end
drawnow;
end