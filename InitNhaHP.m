function [HPPlot]=InitNhaHP(BoidsNum,MaxBoidNum,Boids)
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
        x1=Boids(i,1)+50;
        x2=Boids(i,1)+200+blood/40;
        y1=Boids(i,2)+BloodPos + 300;
        y2=Boids(i,2)+BloodPos + 300;            
        HPPlot(i)=plot([x1 x2],[y1 y2],'-','Color','b','LineWidth',1.5*SizeHPBar);            
    end