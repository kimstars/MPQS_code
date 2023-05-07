function AddObstacles(p1,p2)
    global Obstacles;
    global ObstaclesNum;

    delta_p = (p2 - p1) / 10; % chia ?o?n t? p1 ??n p2 thành 10 ph?n b?ng nhau
    disp(delta_p)
    points = [p1];

    for i = 1:10
        points = vertcat(points, p1 + delta_p * i);

    end 


    % v? các v?t c?n
   
    for i = 1:size(points, 1)
        p = points(i, :);
        ObstaclesNum = ObstaclesNum + 1;
        cursorPosition(1:2) = p(1,1:2);
        cursorPosition(3) = 0;
        cursorPosition(4) = 40;
        MousePosition = cursorPosition;
        Obstacles(ObstaclesNum, 1:4) = MousePosition(1:4);
    end

end