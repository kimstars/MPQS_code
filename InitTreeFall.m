function TreePlot=InitTreeFall(v_Image,v_Alpha)
global EnvironmentWidth;

axis([-EnvironmentWidth EnvironmentWidth -EnvironmentWidth EnvironmentWidth]);

img = imrotate(v_Image, 130);
alpha = imrotate(v_Alpha, 130);
TreePlot = image(-200, 200 , img);
TreePlot.AlphaData = alpha; 