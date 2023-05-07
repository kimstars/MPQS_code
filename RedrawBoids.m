function RedrawBoids(Boids,BoidsNum,v_Image,v_Alpha,BoidsPlot)
global EnvironmentWidth;
global ImageWidth;
global TimeSteps;

for BoidIndex = 1 : BoidsNum
    if (Boids(BoidIndex, 15) > 0)  
    if(Boids(BoidIndex, 12) == 0)
        v_angle = - 180;
    else
        v_angle = -180 + Boids(BoidIndex, 12) - 90;
    end
    try
        img_i = imrotate(v_Image, v_angle );
        alpha_i = imrotate(v_Alpha, v_angle );
    catch Me
        disp(' hi')
        v_angle
    end
    
    BoidsPlot(BoidIndex).CData = img_i;
    BoidsPlot(BoidIndex).AlphaData = alpha_i;
    
    try
        BoidsPlot(BoidIndex).XData = Boids(BoidIndex,1)-ImageWidth/2;
        BoidsPlot(BoidIndex).YData = Boids(BoidIndex,2)-ImageWidth/2;
    catch Me
        disp('hi')
        [Boids(BoidIndex,1),Boids(BoidIndex,2)]
    end
    else
        
        [v_ImageE , v_AlphaE]	=      LoadImageBase('rip.png' , 60, 60, 0);
        BoidsPlot(BoidIndex).CData = v_ImageE;
        BoidsPlot(BoidIndex).AlphaData = v_AlphaE;
    end
end

drawnow;
