function RedrawBoid(Boids,Num_Boid,v_Image,v_Alpha,BoidsPlot)
global EnvironmentWidth;
global ImageWidth;
global TimeSteps;


    if (Boids(Num_Boid, 15) > 0)  
        v_angle = - 180;
    try
        img_i = imrotate(v_Image, v_angle );
        alpha_i = imrotate(v_Alpha, v_angle );
    catch Me
        disp(' hi')
        v_angle
    end
    
    BoidsPlot(Num_Boid).CData = img_i;
    BoidsPlot(Num_Boid).AlphaData = alpha_i;
    
    try
        BoidsPlot(Num_Boid).XData = Boids(Num_Boid,1)-ImageWidth/2;
        BoidsPlot(Num_Boid).YData = Boids(Num_Boid,2)-ImageWidth/2;
    catch Me
        disp('hi')
        [Boids(Num_Boid,1),Boids(Num_Boid,2)]
    end
    else
        
        [v_ImageE , v_AlphaE]	=      LoadImageBase('rip.png' , 60, 60, 0);
        BoidsPlot(Num_Boid).CData = v_ImageE;
        BoidsPlot(Num_Boid).AlphaData = v_AlphaE;
    end


drawnow;
