function [HPPlot]=InitializaHPBoids(BoidsNum,MaxBoidNum,Boids)
global EnvironmentWidth;
global BloodPos
global SizeHPBar;

%axis off;
%axis([-EnvironmentMargin EnvironmentWidth+EnvironmentMargin -EnvironmentMargin EnvironmentWidth+EnvironmentMargin]);
axis([-EnvironmentWidth EnvironmentWidth -EnvironmentWidth EnvironmentWidth]);

for i=1:MaxBoidNum    
    if (i<=BoidsNum)        
        blood=Boids(i,15);
    else      
        blood=0;
    end       
    x1=Boids(i,1);
    x2=Boids(i,1)+(blood/2)/5;
    y1=Boids(i,2)+BloodPos + 60;
    y2=Boids(i,2)+BloodPos + 60;            
    HPPlot(i)=plot([x1 x2],[y1 y2],'-','Color','r','LineWidth',SizeHPBar);            
end
