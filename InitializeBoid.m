function [BoilsPlot]=InitializeBoid(v_Image,v_Alpha,v_ImageE,v_AlphaE,OBJNum,OBJs)
global EnvironmentWidth;
global ImageWidth;

axis([-EnvironmentWidth EnvironmentWidth -EnvironmentWidth EnvironmentWidth]);

for i=1:OBJNum
    angle = -180;	% imrotate rotates ccw  
        if (OBJs(i,15)>=0)
            img_i = imrotate(v_Image, angle);
            alpha_i = imrotate(v_Alpha, angle); 
        else
        img_i = imrotate(v_ImageE, angle);
        alpha_i = imrotate(v_AlphaE, angle);                
        end  
    BoilsPlot(i) = image(OBJs(i, 1), OBJs(i, 2) , img_i);
    BoilsPlot(i).AlphaData = alpha_i; 
  
    
end
