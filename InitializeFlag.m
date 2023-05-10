function [BasesPlot] = InitializeFlag (v_Image,v_Alpha) 
    angle = 0;	% imrotate rotates ccw     
    img_i = imrotate(v_Image, angle);
    img_i = flip(img_i, 2);
    alpha_i = imrotate(v_Alpha, angle );
    alpha_i = flip(alpha_i, 2);
    BasesPlot= image(-200, -50, img_i);
    BasesPlot.AlphaData = alpha_i; 