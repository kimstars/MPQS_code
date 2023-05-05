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
global RedsHP;
global ObstaclesR ;
global ObstaclesB ;
global  DieRNum DieBNum;
global MaxRedNum;
global endCombat;
global conlai;
BoidsNum = 2; % Choose number of Boids to demo
Boids(1,10) = 1; % set max speed of 1-st Boid
Boids(2:BoidsNum, 10) = 1;
    
%% first draw
[fHandler] = InitializeGraphics();
BluesNum = 10 ;
SafeDistance = 20;
%Initialize the first positon of Goal
RandomPosition = [400 200 0 0 0 0];
titleStr = 'Nhom 09';
titleStr = [titleStr newline '(Mo cua danh chiem dau cau)'];
title(titleStr);
set(fHandler, 'WindowButtonDownFcn',@cursorClickCallback);
% tai hinh
[v_ImageFallTree, v_AlphaFallTree] =   LoadImageBase('tree.png', 150, 80, 0);
[v_ImageB, v_AlphaB]	=      LoadImageBase('SoldierB.png' , 60, 60, 0);
[v_ImageE , v_AlphaE]	=      LoadImageBase('rip.png' , 60, 60, 0);
[v_ImageVic, v_AlphaVic]	=      LoadImageBase('victory.png' , 300, 300, 0);

[v_ImageXT, v_AlphaXT]	=      LoadImageBase('xetang.png' , 100, 100, 0);
 % ve quan xanh
    [BluesPlot] = InitializeBoid(v_ImageB, v_AlphaB, v_ImageE, v_AlphaE, BluesNum, Blues);
    [BluesHP] = InitializeHP(BluesNum, MaxBlueNum, Blues);

RedsNum = 15 ;
BluesNum = 10 ;
SafeDistance = 20;
%Initialize the first positon of Goal
RandomPosition = [400 200 0 0 0 0];
titleStr = 'Nhom 09';
titleStr = [titleStr newline '(Kich ban mo cua danh chiem dau cau)'];
title(titleStr);
set(fHandler, 'WindowButtonDownFcn',@cursorClickCallback);
% tai hinh
[v_ImageFallTree, v_AlphaFallTree] =   LoadImageBase('tree.png', 150, 80, 0);
[v_ImageB, v_AlphaB]	=      LoadImageBase('SoldierB.png' , 60, 60, 0);
[v_ImageE , v_AlphaE]	=      LoadImageBase('rip.png' , 60, 60, 0);
[v_ImageVic, v_AlphaVic]	=      LoadImageBase('victory.png' , 300, 300, 0);
[v_ImageR, v_AlphaR]	=      LoadImageBase('SoldierR.png' , 60, 60, 0);
%% Load hinh anh cua hai hang rao
width1 = 100;
width2 = width1;
height1 = 240;
height2 = height1;
rotation1 = 0;
rotation2 = 0;

[v_ImageFence1, v_AlphaFence1] = LoadImageBase('hangrao.png', width1, height1, rotation1);
[v_ImageFence2, v_AlphaFence2] = LoadImageBase('hangraomocua.png', width2, height2, rotation2);

% Khoi tai vi tri cua 2 hang rao
Fence1Position = [-40, -40, 0, 210, 0, 0];
Fence2Position = [-50, -50, 0, 200, 0, 0];

% Khoi tao 2 hang rao
[Fence1Plot] = InitializeFence(v_ImageFence1, v_AlphaFence1, Fence1Position);
[Fence2Plot] = InitializeFence(v_ImageFence2, v_AlphaFence2, Fence2Position);

%% ve quan do
[RedsPlot]=InitializeBoid(v_ImageR,v_AlphaR,v_ImageE,v_AlphaE,RedsNum,Reds);
[RedsHP]=InitializeRedHP(RedsNum,MaxRedNum,Reds);

% ve quan xanh
[BluesPlot]=InitializeBoid(v_ImageB,v_AlphaB,v_ImageE,v_AlphaE,BluesNum,Blues);
[BluesHP]=InitializeHP(BluesNum,MaxBlueNum,Blues);

%% Chuyen quan ??ch den cac vi tri an nap
% Cac vi tri an nap
nup1 = [650 180 0];
nup2 = [70 310 0];
nup3 = [400 400 0];
nup4 = [330 150 0];
nup5 = [380 100 0];
TimeStick1 = 1;
while(TimeStick1 < 200)
    for ItemBlue = 1:BluesNum
        Blues = updateAtBoundary(Blues, ItemBlue);
        CurrentBlue = Blues(ItemBlue, :);
        if (ItemBlue <= 0.1*BluesNum)
            forceItem = steer_seek(CurrentBlue, nup1);
        end
        if (ItemBlue >= 0.2*BluesNum && ItemBlue <= 0.4*BluesNum)
            forceItem = steer_seek(CurrentBlue, nup2);
        end
        if (ItemBlue > 0.4*BluesNum && ItemBlue <= 0.6*BluesNum)
            forceItem = steer_seek(CurrentBlue, nup3);
        end
        if (ItemBlue > 0.6*BluesNum && ItemBlue <= 0.9*BluesNum)
            forceItem = steer_seek(CurrentBlue, nup4);
        end
        if (ItemBlue > 0.9*BluesNum)
            forceItem = steer_seek(CurrentBlue, nup5);
        end
        Blues(ItemBlue,:) = applyForce(CurrentBlue, forceItem);
    end
    RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
    RedrawBlueHP();
    TimeStick1 = TimeStick1 + 1;
end
%% Di chuy?n quan ta 
nupR1 = [-80 -210 0];
nupR2 = [-300 80 0];
nupR = [-870 -550 0];
%len goc cay
TimeStick2 = 1;
while(TimeStick2 < 120)
    for ItemRed = 1:3
        Reds = updateAtBoundary(Reds, ItemRed);
        CurrentRed = Reds(ItemRed, :);
        forceItem = steer_seek(CurrentRed, nupR);
        Reds(ItemRed,:) = applyForce(CurrentRed, forceItem);
    end
    RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
    RedrawRedHP();
    TimeStick2 = TimeStick2 + 1;
end
%len vi tri 2 cuc da 2 ben
TimeStick3=1
while(TimeStick3 < 225)
    for ItemRed = 1:3
        Reds = updateAtBoundary(Reds, ItemRed);
        CurrentRed = Reds(ItemRed, :);
        if (ItemRed <= 1)
            forceItem = steer_seek(CurrentRed, nupR1);
        end
        if (ItemRed >=2 )
            forceItem = steer_seek(CurrentRed, nupR2);
        end
        Reds(ItemRed,:) = applyForce(CurrentRed, forceItem);
    end
    RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
    RedrawRedHP();
    TimeStick3 = TimeStick3 + 1;
end
%di chuyen ra giua
dichuyenR1 = [-200 -100 0];
TimeStick4 = 1;
while(TimeStick4 < 50)
    for ItemRed = 1:3
        Reds = updateAtBoundary(Reds, ItemRed);
        CurrentRed = Reds(ItemRed, :);
        forceItem = steer_seek(CurrentRed, dichuyenR1);
        Reds(ItemRed,:) = applyForce(CurrentRed, forceItem);
    end
    RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
    RedrawRedHP();
    TimeStick4 = TimeStick4 + 1;
end
%di chuyen len dat boc pha
datbocphaR = [55 20 0];
TimeStick5 = 1;
while(TimeStick5 < 100)
    for ItemRed = 1:3
        Reds = updateAtBoundary(Reds, ItemRed);
        CurrentRed = Reds(ItemRed, :);
        forceItem = steer_seek(CurrentRed, datbocphaR);
        Reds(ItemRed,:) = applyForce(CurrentRed, forceItem);
    end
    RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
    RedrawRedHP();
    TimeStick5 = TimeStick5 + 1;
end
%hien boc pha
[v_ImageTNT, v_AlphaTNT]	=      LoadImageBase('tnt.png' , 90, 90, 0);
TNTPosition = [35 ,5 0, 180, 0, 0];
[TNTPlot] = InitializeFence(v_ImageTNT, v_AlphaTNT, TNTPosition);
%quay ve giua
TimeStick4 = 1;
while(TimeStick4 < 50)
    for ItemRed = 1:3
        Reds = updateAtBoundary(Reds, ItemRed);
        CurrentRed = Reds(ItemRed, :);
        forceItem = steer_seek(CurrentRed, dichuyenR1);
        Reds(ItemRed,:) = applyForce(CurrentRed, forceItem);
    end
    RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
    RedrawRedHP();
    TimeStick4 = TimeStick4 + 1;
end

%quay ve vi tri nup
TimeStick3=1
while(TimeStick3 < 100)
    for ItemRed = 1:3
        Reds = updateAtBoundary(Reds, ItemRed);
        CurrentRed = Reds(ItemRed, :);
        if (ItemRed <= 1)
            forceItem = steer_seek(CurrentRed, nupR1);
        end
        if (ItemRed >=2 )
            forceItem = steer_seek(CurrentRed, nupR2);
        end
        Reds(ItemRed,:) = applyForce(CurrentRed, forceItem);
    end
    RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
    RedrawRedHP();
    TimeStick3 = TimeStick3 + 1;
end
%hien bomb no xoa hang rao va boc pha
[v_ImageBMB, v_AlphaBMB]	=      LoadImageBase('boom.png' , 120, 300, 0);
BMBPosition = [-100 ,-80, 0, 210, 0, 0];
delete(TNTPlot);
[BMBPlot] = InitializeFence(v_ImageBMB, v_AlphaBMB, BMBPosition);
[y,Fs] = audioread('soundbomb.wav');
sound(y,Fs);
pause(4);
delete(Fence1Plot);
delete(Fence2Plot);
delete(BMBPlot);
%% ve xe tang
%Boids o day la xe (3 xe)
Boids(:,10) = 1;
Boids(1,1:3) = [-600 -500 0];
Boids(2,1:3) = [-800 -600 0];

Boids(1,:) = applyForce(Boids(1,:), 0);
Boids(1:BoidsNum, 15) = 1000;
AliveXT = ones(1,2);
[BoidsPlot]=InitializeBoid(v_ImageXT,v_AlphaXT,v_ImageE,v_AlphaE,BoidsNum,Boids);
[BoidsHP]=InitializaHPBoids(BoidsNum,MaxBlueNum,Boids);
%% Ve b41, ve dich xuat hien
b41(1,1:3) = [220 410 0];
 [v_Image41, v_Alpha41]	=      LoadImageBase('SoldierB_b41.png' , 100, 100, 0);
 %b41(1,:) = applyForce(b41(1,:), 0);
 b41(1,15)=1000;

b41Plot=InitializeBoid(v_Image41,v_Alpha41,v_ImageE,v_AlphaE,1,b41);
[b41HP]=InitializaHPBoids(BoidsNum,MaxBlueNum,Boids);
 %% daviation Bule // giá tr? ?? lêhch trong vi?c tính toán ???ng b?n c?a các ??i t??ng
    deviationXB = ShootDistanceB*(1-AccuracyB*(2*rand - 1));
    deviationYB = ShootDistanceB*(1-AccuracyB*(2*rand - 1));
    
    %% daviation Red
    deviationXR = ShootDistanceR*(1-AccuracyR*(2*rand - 1));
    deviationYR = ShootDistanceR*(1-AccuracyR*(2*rand - 1));

pause(1)
%% Tan cong xe tang
% tim xe tang gan nhat de ban

TimeStick6 = 1;
while(TimeStick6 < 200)
    [y, Fs] = audioread('Tieng_o_to.wav');
    sound(y, Fs);
    while(AliveXT(1,1)>0)
        CurrentBoid = Boids(1,:);
        forceBoid1 = steer_seek(CurrentBoid, b41(1,1:3));
        Boids(1,:) = applyForce(CurrentBoid, forceBoid1);
        forceBoid2 = steer_seek(Boids(2,:), Boids(1,:));
        Boids(2,:) = applyForce(Boids(2,:), forceBoid2);
        RedrawBoids(Boids, 2, v_ImageXT, v_AlphaXT, BoidsPlot);
        RedrawBoidsHP();
        if(pdist2(Boids(1,:), b41) < 500)
            
            while( Boids(1,15)>0)
            
                 c2=line([b41(1),Boids(1,1)], [b41(2), Boids(1, 2)], 'Color', 'blue','LineStyle','-.');
                Boids(1,15)= Boids(1,15)-334;
                pause(0.05);
                % xóa duong ??n c?
                delete(c2);
               
                if(Boids(1,15)>0)
                    pause(0.5)
                end
            end
            delete(BoidsPlot(1));
            AliveXT(1,1)=0;
        end
        
    end
    forceBoid3 = steer_seek(Boids(2,:), b41(1,1:3));
    Boids(2,:) = applyForce(Boids(2,:), 1.3*forceBoid3);
    RedrawBoid(Boids, 2, v_ImageXT, v_AlphaXT, BoidsPlot);
    RedrawBoidsHP();
    
    if( pdist2(Boids(2,:), b41) < 520)
        
            while(b41(1,15) > 0)
            
        
                 c2=line([Boids(2,1),b41(1)], [Boids(2,2),b41(2)], 'Color', 'red','LineStyle','-.');
            
                pause(0.02);
                % xóa duong ??n c?
                delete(c2);
                b41(1,15) = b41(1,15)-500;
                if(b41(1,15)>0)
                    pause(0.5)
                end
            end
            radius = 100;
            % tính khoang cah giua b41 va cac quan xanh
            dists = sqrt(sum((Blues - b41).^2,2));
            % tim cac quan xanh o trong ban kinh 10 so voi b41
            indices = find(dists<=radius);
            
            delete(b41Plot);
            delete(Blues(indices));
            
    end
    TimeStick6 =TimeStick6 +1;
end
