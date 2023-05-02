function action()
%% global variables
global TimeSteps;
global BoidsNum BluesHP BoidsHP;
global Boids Reds;
global Targets Target1 Target2;
global SaveMousePosition;
global Obstacles;
global ObstaclesNum;
global BluesNum DieRNum DieBNum;
global Blues;
global MaxBlueNum;
global ShootDistanceB ShootDistanceR;
global deviationXB deviationYB deviationXR deviationYR ;
global AccuracyB AccuracyR;
global RandomPosition SafeDistance Flights FlightsNum ObstaclesF RedsNum DieRNum DieBNum goToAttack DameOfBlue DameOfRed;
global  RedsHP;
global ObstaclesR ;
global ObstaclesB ;
global  DieRNum DieBNum;
global MaxRedNum;
global endCombat;

BoidsNum = 3; % Choose number of Boids to demo
Boids(1,10) = 1; % set max speed of 1-st Boid
Boids(2:BoidsNum, 10) = 1;
    
%% first draw
[v_Image,v_Alpha,fHandler] = InitializeGraphics();
BluesNum = 10 ;
SafeDistance = 20;
%Initialize the first positon of Goal
RandomPosition = [400 200 0 0 0 0];
titleStr = 'Nhom 00';
titleStr = [titleStr newline '(Kich ban van chuyen va tiep te VK ra chien truong)'];
title(titleStr);
set(fHandler, 'WindowButtonDownFcn',@cursorClickCallback);
% tai hinh
[v_ImageFallTree, v_AlphaFallTree] =   LoadImageBase('tree.png', 150, 80, 0);
[v_ImageB, v_AlphaB]	=      LoadImageBase('SoldierB.png' , 60, 60, 0);
[v_ImageE , v_AlphaE]	=      LoadImageBase('rip.png' , 60, 60, 0);
[v_ImageVic, v_AlphaVic]	=      LoadImageBase('victory.png' , 300, 300, 0);

 % ve quan xanh
    [BluesPlot] = InitializeBoid(v_ImageB, v_AlphaB, v_ImageE, v_AlphaE, BluesNum, Blues);
    [BluesHP] = InitializeHP(BluesNum, MaxBlueNum, Blues);

%% ve cay do
    nup0 = [-200 200 0];
    TimeStick0 = 1;

    while (TimeStick0 < 300)

        for ItemBlue = 1:BluesNum
            Blues = updateAtBoundary(Blues, ItemBlue);
            CurrentBlue = Blues(ItemBlue, :);
            forceItem = steer_seek(CurrentBlue, nup0);
            Blues(ItemBlue, :) = applyForce(CurrentBlue, forceItem);
        end

        RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
        RedrawBlueHP();
        TimeStick0 = TimeStick0 + 1;
    end
    
    TreePlot = InitTreeFall(v_ImageFallTree, v_AlphaFallTree);

