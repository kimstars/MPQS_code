function [v_Image,v_Alpha,fHandler]=InitializeGraphics()
global EnvironmentWidth;
global ImageWidth;
global BoidsNum;
global Boids;
global Obstacles;
global ObstaclesNum;
global Reds RedsNum MaxRedNum RedsHP DieRNum;
global Blues BluesNum MaxBlueNum BluesHP DieBNum;
global noti;

[v_ImageBF, v_AlphaBF]	= LoadImageBase('baseko2000.png' , 2000, 2000, 0);

[v_Image, v_Alpha]	=      LoadImageBase('xetang.png' , 120, 120, 0);
fHandler = figure;
fHandler.Color = 'white';
fHandler.MenuBar =  'none';
fHandler.ToolBar = 'none';
fHandler.Name = 'UNSW - Boids implementation';
fHandler.NumberTitle = 'off';
rectangle('position',[-EnvironmentWidth -EnvironmentWidth 2*EnvironmentWidth 2*EnvironmentWidth],'EdgeColor','b','LineWidth',1);
hold on
xlabel('X axis')
ylabel('Y axis')
axis manual;
%axis off;
%axis([-EnvironmentMargin EnvironmentWidth+EnvironmentMargin -EnvironmentMargin EnvironmentWidth+EnvironmentMargin]);
axis([-EnvironmentWidth EnvironmentWidth -EnvironmentWidth EnvironmentWidth]);
angle = -180;
%BackGround
img_i = imrotate(v_ImageBF, angle);
alpha_i = imrotate(v_AlphaBF, angle );
BasesPlot= image(-1000, -1000, img_i);
BasesPlot.AlphaData = alpha_i;
  


ObstaclesNum =0 ;

p = [-20 -300 -1, -300 -200 1];
    ObstaclesNum = ObstaclesNum + 1;
        cursorPosition(1:2) = p(1,1:2);
        cursorPosition(3) = 0;
        cursorPosition(4) = 50;
        MousePosition = cursorPosition;
    Obstacles(ObstaclesNum, 1:4) = MousePosition(1:4);

p = [-420 -50 -1, -300 -200 1];
    ObstaclesNum = ObstaclesNum + 1;
        cursorPosition(1:2) = p(1,1:2);
        cursorPosition(3) = 0;
        cursorPosition(4) = 50;
        MousePosition = cursorPosition;
    Obstacles(ObstaclesNum, 1:4) = MousePosition(1:4);


p = [-700 -750 -1, -300 -200 1];
    ObstaclesNum = ObstaclesNum + 1;
        cursorPosition(1:2) = p(1,1:2);
        cursorPosition(3) = 0;
        cursorPosition(4) = 50;
        MousePosition = cursorPosition;
    Obstacles(ObstaclesNum, 1:4) = MousePosition(1:4);
 
p = [-790 -740 -1, -300 -200 1];
    ObstaclesNum = ObstaclesNum + 1;
        cursorPosition(1:2) = p(1,1:2);
        cursorPosition(3) = 0;
        cursorPosition(4) = 50;
        MousePosition = cursorPosition;
    Obstacles(ObstaclesNum, 1:4) = MousePosition(1:4);
    
    
    
p1 = [-300 0 -1, 200 -200 0];
p2 = [-410 180 -1, 200 -200 0];
AddObstacles(p1,p2);

p1 = [-410 180 -1, 200 -200 0];
p2 = [-370 570 -1, 200 -200 0];
AddObstacles(p1,p2);

p1 = [-370 570 -1, 200 -200 0];
p2 = [360 750 -1, 200 -200 0];
AddObstacles(p1,p2);

p1 = [360 750 -1, 200 -200 0];
p2 = [840 410 -1, 200 -200 0];
AddObstacles(p1,p2);

p1 = [840 410 -1, 200 -200 0];
p2 = [800 90 -1, 200 -200 0];
AddObstacles(p1,p2);

p1 = [800 90 -1, 200 -200 0];
p2 = [350 -20 -1, 200 -200 0];
AddObstacles(p1,p2);

p1 = [350 -20 -1, 200 -200 0];
p2 = [100 0 -1, 200 -200 0];
AddObstacles(p1,p2);
   
noti = [-400 800 -1, 200 -200 0];


for i = 1:ObstaclesNum
    obstacle = Obstacles(i,:);
    %p_obstacle = plot(obstacle(1), obstacle(2), 'o','MarkerFaceColor','r','Color','r');
    plot(obstacle(1), obstacle(2), 'o','MarkerSize',5, 'MarkerFaceColor','green','Color','green');
    
end


BluesNum = 5; % Choose number of Boids to demo
RedsNum = 5; % Choose number of Boids to demo
