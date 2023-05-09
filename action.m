function Action()
    %% global variables
    global TimeSteps;
    global BoidsNum BluesHP BoidsHP;
    global Boids Reds Red2s;
    global Targets Target1 Target2;
    global SaveMousePosition;
    global Obstacles;
    global ObstaclesNum;
    global BluesNum DieRNum DieBNum;
    global Blues;
    global MaxBlueNum;
    global ShootDistanceB ShootDistanceR;
    global deviationXB deviationYB deviationXR deviationYR;
    global AccuracyB AccuracyR;
    global RandomPosition SafeDistance Flights FlightsNum ObstaclesF RedsNum Red2sNum DieRNum DieBNum goToAttack DameOfBlue DameOfRed;
    global RedsHP;
    global Red2sHP;
    global ObstaclesR;
    global ObstaclesB;
    global DieRNum DieBNum;
    global MaxRedNum;
    global endCombat;

    BoidsNum = 15; % Choose number of Boids to demo(3xe)
    Boids(1, 10) = 1; % set max speed of 1-st Boid
    Boids(2:BoidsNum, 10) = 1;

    %% first draw
    [v_Image, v_Alpha, fHandler] = InitializeGraphics();

    RedsNum = 15;
    Red2sNum = 5;
    BluesNum = 10;
    SafeDistance = 20;
    %Initialize the first positon of Goal
    RandomPosition = [400 200 0 0 0 0];
    titleStr = 'Nhom 09';
    titleStr = [titleStr newline '(Kich ban mo cua danh chiem dau cau)'];
    title(titleStr);
    set(fHandler, 'WindowButtonDownFcn', @cursorClickCallback);
    % tai hinh
    [v_ImageFallTree, v_AlphaFallTree] = LoadImageBase('tree.png', 150, 80, 0);
    [v_ImageB, v_AlphaB] = LoadImageBase('SoldierB.png', 60, 60, 0);
    [v_ImageE, v_AlphaE] = LoadImageBase('rip.png', 60, 60, 0);
    [v_ImageVic, v_AlphaVic] = LoadImageBase('victory.png', 300, 300, 0);
    [v_ImageR, v_AlphaR] = LoadImageBase('SoldierR.png', 60, 60, 0);

    % Load hinh anh cua hai hang rao
    width1 = 100;
    width2 = width1;
    height1 = 240;
    height2 = height1;
    rotation1 = 0;
    rotation2 = 0;

    [v_ImageFence1, v_AlphaFence1] = LoadImageBase('hangrao.png', width1, height1, rotation1);
    [v_ImageFence2, v_AlphaFence2] = LoadImageBase('hangraomocua.png', width2, height2, rotation2);

    % Khoi tai vi tri cua 2 hang rao
    Fence1Position = [-85, -190, 0, 200, 0, 0];
    Fence2Position = [-95, -200, 0, 190, 0, 0];

    % Khoi tao 2 hang rao
    [Fence1Plot] = InitializeFence(v_ImageFence1, v_AlphaFence1, Fence1Position);
    [Fence2Plot] = InitializeFence(v_ImageFence2, v_AlphaFence2, Fence2Position);

    %ve quan do
    [RedsPlot] = InitializeBoid(v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsNum, Reds);
    [RedsHP] = InitializeRedHP(RedsNum, MaxRedNum, Reds);

    %ve quan do 2
    [Red2sPlot] = InitializeBoid(v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, Red2sNum, Red2s);
    [Red2sHP] = InitializeRedHP(Red2sNum, MaxRedNum, Red2s);

    %% Chuyen quan den cac vi tri an nap
    % Cac vi tri an nap
    nup1 = [650 180 0];
    nup2 = [70 310 0];
    nup3 = [400 400 0];
    nup4 = [330 150 0];
    nup5 = [380 100 0];

    % TimeStick1 = 1;

    % while (TimeStick1 < 200)

    %     for ItemBlue = 1:BluesNum
    %         Blues = updateAtBoundary(Blues, ItemBlue);
    %         CurrentBlue = Blues(ItemBlue, :);

    %         if (ItemBlue <= 0.1 * BluesNum)
    %             forceItem = steer_seek(CurrentBlue, nup1);
    %         end

    %         if (ItemBlue >= 0.2 * BluesNum && ItemBlue <= 0.4 * BluesNum)
    %             forceItem = steer_seek(CurrentBlue, nup2);
    %         end

    %         if (ItemBlue > 0.4 * BluesNum && ItemBlue <= 0.6 * BluesNum)
    %             forceItem = steer_seek(CurrentBlue, nup3);
    %         end

    %         if (ItemBlue > 0.6 * BluesNum && ItemBlue <= 0.9 * BluesNum)
    %             forceItem = steer_seek(CurrentBlue, nup4);
    %         end

    %         if (ItemBlue > 0.9 * BluesNum)
    %             forceItem = steer_seek(CurrentBlue, nup5);
    %         end

    %         Blues(ItemBlue, :) = applyForce(CurrentBlue, forceItem);
    %     end

    %     RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
    %     RedrawBlueHP();
    %     TimeStick1 = TimeStick1 + 1;
    % end

    %hoa luc chuan bi
    [v_ImageBMB0, v_AlphaBMB0] = LoadImageBase('boom.png', 100, 100, 0);
    TimeStick2 = 1;

    while (TimeStick2 < 10)

        for ItemBmb = 1

            if (ItemBmb == 1)
                x = 600 * rand();
                y = 300 * rand();
                c1 = line([900, x], [-900, y], 'Color', 'red', 'LineStyle', '-.');
                c2 = line([900, x - 2], [-900, y - 2], 'Color', 'red', 'LineStyle', '-.');
                c3 = line([900, x - 1], [-900, y - 1], 'Color', 'red', 'LineStyle', '-.');
                c4 = line([900, x - 4], [-900, y - 4], 'Color', 'red', 'LineStyle', '-.');
                c5 = line([900, x - 3], [-900, y - 3], 'Color', 'red', 'LineStyle', '-.');
                BMBPosition = [y - 50, x - 50, 0, 200, 300, 0];
                [BMBPlot] = InitializeFence(v_ImageBMB0, v_AlphaBMB0, BMBPosition);
                [y, Fs] = audioread('soundbomb.wav');
                sound(y, Fs);
                pause(1);
                delete(c1);
                delete(c2);
                delete(c3);
                delete(c4);
                delete(c5);
                delete(BMBPlot);
            end

        end

        TimeStick2 = TimeStick2 + 1;
    end

    % ve quan xanh
    [BluesPlot] = InitializeBoid(v_ImageB, v_AlphaB, v_ImageE, v_AlphaE, BluesNum, Blues);
    [BluesHP] = InitializeHP(BluesNum, MaxBlueNum, Blues);

    %quan dich ra sat hang rao
    nupB = [400 0 0];
    nupB1 = [650 100 0];
    TimeStick2 = 1;

    while (TimeStick2 < 300)

        for ItemBlue = 7:8
            Blues = updateAtBoundary(Blues, ItemBlue);
            CurrentBlue = Blues(ItemBlue, :);
            forceItem = steer_seek(CurrentBlue, nupB1);
            Blues(ItemBlue, :) = applyForce(CurrentBlue, forceItem);
        end

        for ItemBlue = 9:10
            Blues = updateAtBoundary(Blues, ItemBlue);
            CurrentBlue = Blues(ItemBlue, :);
            forceItem = steer_seek(CurrentBlue, nupB);
            Blues(ItemBlue, :) = applyForce(CurrentBlue, forceItem);
        end

        RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
        RedrawBlueHP();
        TimeStick2 = TimeStick2 + 1;
    end

    %len goc cay
    nupR1 = [-20 -300 0];
    nupR2 = [-420 -80 0];
    nupR = [-870 -550 0];
    TimeStick2 = 1;

    while (TimeStick2 < 110)

        for ItemRed = 1:3
            Reds = updateAtBoundary(Reds, ItemRed);
            CurrentRed = Reds(ItemRed, :);
            forceItem = steer_seek(CurrentRed, nupR);
            Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
        end

        RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
        RedrawRedHP();
        TimeStick2 = TimeStick2 + 1;
    end

    %len vi tri HLCB
    nupR3 = [500 -370 0];
    nupR5 = [450 -600 0];
    nupR4 = [900 -300 0];
    TimeStick3 = 1;

    while (TimeStick3 < 225)

        for ItemRed2 = 1:4
            Red2s = updateAtBoundary(Red2s, ItemRed2);
            CurrentRed = Red2s(ItemRed2, :);

            if (ItemRed2 <= 1)
                forceItem = steer_seek(CurrentRed, nupR3);
                c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                [y, Fs] = audioread('soundgun.wav');
                sound(y, Fs);
                pause(0.03);
                delete(c1);
            end

            if (ItemRed2 >= 2 && ItemRed2 <= 3)
                forceItem = steer_seek(CurrentRed, nupR4);
                c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                [y, Fs] = audioread('soundgun.wav');
                sound(y, Fs);
                pause(0.03);
                delete(c1);
            end

            if (ItemRed2 == 4)
                forceItem = steer_seek(CurrentRed, nupR5);
                c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                [y, Fs] = audioread('soundgun.wav');
                sound(y, Fs);
                pause(0.03);
                delete(c1);
            end

            Red2s(ItemRed2, :) = applyForce(CurrentRed, forceItem);
        end

        RedrawGraphics(Red2s, Red2sNum, v_ImageR, v_AlphaR, Red2sPlot);
        RedrawRed2sHP();

        %len vi tri 2 cuc da 2 ben

        for ItemRed = 1:3
            Reds = updateAtBoundary(Reds, ItemRed);
            CurrentRed = Reds(ItemRed, :);

            if (ItemRed <= 1)
                forceItem = steer_seek(CurrentRed, nupR1);
            end

            if (ItemRed >= 2)
                forceItem = steer_seek(CurrentRed, nupR2);
            end

            Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
        end

        RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
        RedrawRedHP();
        TimeStick3 = TimeStick3 + 1;
    end

    %di chuyen ra giua
    dichuyenR1 = [-200 -100 0];
    TimeStick4 = 1;

    while (TimeStick4 < 50)

        for ItemRed = 1:3
            Reds = updateAtBoundary(Reds, ItemRed);
            CurrentRed = Reds(ItemRed, :);
            forceItem = steer_seek(CurrentRed, dichuyenR1);
            Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
        end

        for ItemRed2 = 1:4
            Red2s = updateAtBoundary(Red2s, ItemRed2);
            c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
            [y, Fs] = audioread('soundgun.wav');
            sound(y, Fs);
            pause(0.03);
            delete(c1);
        end

        RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
        RedrawRedHP();
        TimeStick4 = TimeStick4 + 1;
    end

    %di chuyen len dat boc pha
    datbocphaR = [-170 -45 0];
    TimeStick5 = 1;

    while (TimeStick5 < 100)

        for ItemRed = 1:3
            Reds = updateAtBoundary(Reds, ItemRed);
            CurrentRed = Reds(ItemRed, :);
            forceItem = steer_seek(CurrentRed, datbocphaR);
            Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
        end

        for ItemRed2 = 1:4
            Red2s = updateAtBoundary(Red2s, ItemRed2);
            c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
            [y, Fs] = audioread('soundgun.wav');
            sound(y, Fs);
            pause(0.03);
            delete(c1);
        end

        RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
        RedrawRedHP();
        TimeStick5 = TimeStick5 + 1;
    end

    %hien boc pha
    [v_ImageTNT, v_AlphaTNT] = LoadImageBase('tnt.png', 90, 90, 0);
    TNTPosition = [-40, -165 0, 180, 0, 0];
    [TNTPlot] = InitializeFence(v_ImageTNT, v_AlphaTNT, TNTPosition);
    %quay ve giua
    TimeStick4 = 1;

    while (TimeStick4 < 30)

        for ItemRed = 1:3
            Reds = updateAtBoundary(Reds, ItemRed);
            CurrentRed = Reds(ItemRed, :);
            forceItem = steer_seek(CurrentRed, dichuyenR1);
            Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
        end

        for ItemRed2 = 1:4
            Red2s = updateAtBoundary(Red2s, ItemRed2);
            c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
            [y, Fs] = audioread('soundgun.wav');
            sound(y, Fs);
            pause(0.03);
            delete(c1);
        end

        RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
        RedrawRedHP();
        TimeStick4 = TimeStick4 + 1;
    end

    %quay ve vi tri nup
    TimeStick3 = 1

    while (TimeStick3 < 100)

        for ItemRed = 1:3
            Reds = updateAtBoundary(Reds, ItemRed);
            CurrentRed = Reds(ItemRed, :);

            if (ItemRed <= 1)
                forceItem = steer_seek(CurrentRed, nupR1);
            end

            if (ItemRed >= 2)
                forceItem = steer_seek(CurrentRed, nupR2);
            end

            Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
        end

        for ItemRed2 = 1:4
            Red2s = updateAtBoundary(Red2s, ItemRed2);
            c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
            [y, Fs] = audioread('soundgun.wav');
            sound(y, Fs);
            pause(0.03);
            delete(c1);
        end

        RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
        RedrawRedHP();
        TimeStick3 = TimeStick3 + 1;
    end

    %hien bomb no xoa hang rao va boc pha
    [v_ImageBMB, v_AlphaBMB] = LoadImageBase('boom.png', 120, 300, 0);
    BMBPosition = [-130, -220, 0, 200, 0, 0];
    delete(TNTPlot);
    [BMBPlot] = InitializeFence(v_ImageBMB, v_AlphaBMB, BMBPosition);
    [y, Fs] = audioread('soundbomb.wav');
    sound(y, Fs);
    pause(2);
    delete(Fence1Plot);
    delete(Fence2Plot);
    delete(BMBPlot);
    %qun ra ra huong cua mo

    RedsNum = 10;
    MaxRedNum = 9;
    Reds(:, 15) = 150;
    % for i = 1:RedsNum
    %     Reds(i, 1) = Boids(2, 1) + rand * 20;
    %     Reds(i, 2) = Boids(2, 2) + rand * 20;
    % end
    % ve quan do
    [v_ImageR, v_AlphaR] = LoadImageBase('SoldierR.png', 60, 60, 0);
    [v_ImageE, v_AlphaE] = LoadImageBase('rip.png', 60, 60, 0);
    [RedsPlot] = InitializeBoid(v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsNum, Reds);
    [RedsHP] = InitializeHP(RedsNum, MaxRedNum, Reds);

    RedrawBoid(Reds, RedsNum, v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsPlot);
    RedrawRedsHP();

    %red tim F ban

    for i = 1:RedsNum
        Reds = updateAtBoundary(Reds, i);
        CurrentRed = Reds(i, :);

        force = steer_wander(CurrentRed) + 2 * steer_collision_avoidance1(CurrentRed, 1, Obstacles, ObstaclesNum);

        Reds(i, :) = applyForce(CurrentRed, force);

    end

    endCombat = 0;

    while (endCombat == 0)
        deviationXB = ShootDistanceB * (1 - AccuracyB * (2 * rand - 1));
        deviationYB = ShootDistanceB * (1 - AccuracyB * (2 * rand - 1));

        %% deviation Red
        deviationXR = ShootDistanceR * (1 - AccuracyR * (2 * rand - 1));
        deviationYR = ShootDistanceR * (1 - AccuracyR * (2 * rand - 1));

        killB = 0;
        killR = 0;

        %  blue tim red gan nhat de ban

        timeTick1 = 0;
        DieRNum = 0;
        DieBNum = 0;

        while (timeTick1 < TimeSteps)
            %% Blues
            AttackRed = zeros(1, RedsNum);

            for i = 1:BluesNum
                %J chỉ số mục tiêu gần nhất
                if (Blues(i, 15) > 0)
                    Blues = updateAtBoundary(Blues, i);
                    CurrentBlue = Blues(i, :);
                    [J, tmpDist] = findTarget(Blues(i, :), RedsNum, Reds);

                    if (J > 0 && dist(Blues(i, :), Reds(J, :)) < ShootDistanceB)
                        % Shoot
                        c2 = line([Reds(J, 1), Blues(i, 1) - 2], [Reds(J, 2), Blues(i, 2)], 'Color', 'blue', 'LineStyle', '-.');
                        pause(0.2);
                        delete(c2);

                        if (sqrt(deviationXB * deviationXB + deviationYB * deviationYB) < 800)
                            AttackRed(1, J) = AttackRed(1, J) + DameOfBlue;
                        end

                    else
                        wander_force = steer_wander(CurrentBlue);
                        avd_force = steer_collision_avoidance1(CurrentBlue, 1, Obstacles, ObstaclesNum);

                        force = avd_force * 1 + wander_force * 1 + steer_wander(CurrentBlue);
                        Blues(i, :) = applyForce(CurrentBlue, force);

                    end

                end

            end

            AttackBlue = zeros(1, BluesNum);
            Target1 = [200 400 0]

            if (DieRNum < RedsNum - 3)

                for i = 1:RedsNum

                    if (Reds(i, 15) > 0)
                        Reds = updateAtBoundary(Reds, i);
                        CurrentBoid = Reds(i, :);
                        [J, tmpDist] = findTarget(Reds(i, :), BluesNum, Blues);

                        if (J > 0 && dist(Reds(i, :), Blues(J, :)) < ShootDistanceR)
                            c1 = line([Reds(i, 1), Blues(J, 1)], [Reds(i, 2), Blues(J, 2)], 'Color', 'red', 'LineStyle', '-.');

                            pause(0.2);
                            delete(c1);
                            % cach nhau 800 va ban
                            % nhau thi ghi Blue vao
                            % bang lu dame dang
                            % phai ganh chiu
                            if (sqrt(deviationXR * deviationXR + deviationYR * deviationYR) < 800)
                                AttackBlue(1, J) = AttackBlue(1, J) + DameOfRed;
                            end

                        else
                            steer_force = steer_wander(CurrentBoid);
                            avd_force = steer_collision_avoidance1(CurrentBoid, 1, Obstacles, ObstaclesNum);

                            if (J > 0)
                                arr_force = steer_arrival(CurrentBoid, Blues(J, :));
                            else
                                arr_force = 0;
                            end

                            force = arr_force * 1 + steer_force * 1 + avd_force * 0.7;
                            Reds(i, :) = applyForce(CurrentBoid, force);

                        end

                    end

                end

            end

            %% Update Blues
            [BluesNum, Blues] = UpdateBoid(AttackBlue, BluesNum, Blues);
            %% Update Reds
            [RedsNum, Reds] = UpdateBoid(AttackRed, RedsNum, Reds);

            RedrawBoid(Reds, RedsNum, v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsPlot);
            RedrawBoid(Blues, BluesNum, v_ImageB, v_AlphaB, v_ImageE, v_AlphaE, BluesPlot);
            RedrawRedsHP();
            RedrawBlueHP();

            timeTick1 = timeTick1 + 1;

            for i = 1:RedsNum

                if (Reds(i, 15) <= 0)
                    DieRNum = DieRNum +1;
                end

            end

            for i = 1:BluesNum

                if (Blues(i, 15) <= 0)
                    DieBNum = DieBNum +1;
                end

            end

        end

    end

end
