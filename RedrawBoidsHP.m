function RedrawBoidsHP()
global Boids;
global BoidsNum;
global BoidsHP;
global BloodPos;
global SizeHPBar;

delete(BoidsHP);
for i = 1 : BoidsNum           
    if (Boids(i,15)>0)       
        x1=Boids(i,1)-25;
        x2=Boids(i,1)-25 + (Boids(i,15)/5)/2;
        y1=Boids(i,2)+BloodPos +60;
        y2=Boids(i,2)+BloodPos +60;                  
        BoidsHP(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);%line([x1 x2],[y1 y2],'Color','red','LineStyle','-');       
    end
end
drawnow;
end

