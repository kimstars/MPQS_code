    function action()
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
        global Nhas Vantais MaxNhaNum NhaNum NhasHP VantaisHP VantaiNum MaxVantaiNum;

        BoidsNum = 2; % so luong xe tang
        RedsNum = 10;
        MaxRedNum = 10;
        Red2sNum = 5;
        %% first draw
        [v_Image, v_Alpha, fHandler] = InitializeGraphics();
        BluesNum = 5;
        SafeDistance = 20;

        D_Behind = 50;
        D_BehindLeader = 15;
        FleeDistance = 4;

        %Initialize the first positon of Goal
        RandomPosition = [400 200 0 0 0 0];
        titleStr = 'Nhom 09';
        titleStr = [titleStr newline '(Kich ban danh chiem dau cau)'];
        title(titleStr);
        set(fHandler, 'WindowButtonDownFcn', @cursorClickCallback);
        % tai hinh
        [v_ImageFallTree, v_AlphaFallTree] = LoadImageBase('tree.png', 150, 80, 0);
        [v_ImageB, v_AlphaB] = LoadImageBase('SoldierB.png', 60, 60, 0);
        [v_ImageE, v_AlphaE] = LoadImageBase('rip.png', 60, 60, 0);
        [v_ImageD, v_AlphaD] = LoadImageBase('destroy.png', 60, 60, 0);
        [v_ImageVic, v_AlphaVic] = LoadImageBase('victory.png', 300, 300, 0);
        [v_ImageXT, v_AlphaXT] = LoadImageBase('xetang.png', 100, 100, 0);
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

        % Load hinh anh doanh trai
        [v_ImageDef1, v_AlphaDef1] = LoadImageBase('dtNhaO.png', 400, 300, rotation1);
        [v_ImageDef2, v_AlphaDef2] = LoadImageBase('dtVanTai.png', 400, 300, rotation2);

        [NhasPlot] = InitializeBoid(v_ImageDef1, v_AlphaDef1, v_ImageE, v_AlphaE, 2, Nhas);
        [NhasHP] = InitNhaHP(NhaNum, MaxNhaNum, Nhas);

        [VantaisPlot] = InitializeBoid(v_ImageDef2, v_AlphaDef2, v_ImageE, v_AlphaE, 1, Vantais);
        [VantaisHP] = InitNhaHP(VantaiNum, MaxVantaiNum, Vantais);

        %ve quan do
        [RedsPlot] = InitializeBoid(v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsNum, Reds);
        [RedsHP] = InitializeRedHP(RedsNum, MaxRedNum, Reds);

        %ve quan do 2
        [Red2sPlot] = InitializeBoid(v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, 5, Red2s);
        [Red2sHP] = InitializeRedHP(5, 5, Red2s);

        %% MO CUA DANH CHIEN DAU CAU
        text_object = text(-800, 400, 'GD1: HOA LUC CHUAN BI', 'FontSize', 20, 'Color', 'red');
        pause(3);
        delete(text_object);

        %hoa luc chuan bi /ok
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
                    pause(0.5);
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
        nupB = [400 70 0];
        nupB1 = [580 130 0];
        TimeStick2 = 1;

        while (TimeStick2 < 70)

            for ItemBlue = 1:2
                Blues = updateAtBoundary(Blues, ItemBlue);
                CurrentBlue = Blues(ItemBlue, :);
                forceItem = steer_seek(CurrentBlue, nupB1);
                avd_force = steer_collision_avoidance1(CurrentBlue, 1, Obstacles, ObstaclesNum);

                Blues(ItemBlue, :) = applyForce(CurrentBlue, forceItem);
            end

            for ItemBlue = 3:5
                Blues = updateAtBoundary(Blues, ItemBlue);
                CurrentBlue = Blues(ItemBlue, :);
                forceItem = steer_seek(CurrentBlue, nupB)
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

        text_object = text(-800, 400, 'GD2: NGHI BINH + DAT BOC PHA MO CUA', 'FontSize', 20, 'Color', 'red');
        pause(3);
        delete(text_object);
        %len vi tri HLCB   / lay

        nupR3 = [500 -370 0];
        nupR5 = [450 -600 0];
        nupR4 = [900 -300 0];
        [y, Fs] = audioread('gun.wav');
        sound(y, Fs);
        TimeStick3 = 1

        while (TimeStick3 < 150)

            for ItemRed2 = 1:4
                Red2s = updateAtBoundary(Red2s, ItemRed2);
                CurrentRed = Red2s(ItemRed2, :);

                if (ItemRed2 <= 1)
                    forceItem = steer_seek(CurrentRed, nupR3);
                    c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                end

                if (ItemRed2 >= 2 && ItemRed2 <= 3)
                    forceItem = steer_seek(CurrentRed, nupR4);
                    c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                end

                if (ItemRed2 == 4)
                    forceItem = steer_seek(CurrentRed, nupR5);
                    c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                end

                pause(0.01);
                delete(c1);
                Red2s(ItemRed2, :) = applyForce(CurrentRed, forceItem);
            end

            for ItemBlue = 1:5
                c2 = line([Blues(ItemBlue, 1), 400 + 600 * rand()], [Blues(ItemBlue, 2), -400 - 300 * rand()], 'Color', 'blue', 'LineStyle', '-.');
                pause(0.01);
                delete(c2);
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

                forceItem = forceItem;

                Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
            end

            RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
            RedrawRedHP();
            TimeStick3 = TimeStick3 + 1;
        end

        %di chuyen ra giua / ??

        dichuyenR1 = [-200 -100 0];
        TimeStick4 = 1;
        disp("di chuyen ra giua");

        while (TimeStick4 < 50)

            for ItemRed = 1:3
                Reds = updateAtBoundary(Reds, ItemRed);
                CurrentRed = Reds(ItemRed, :);
                forceItem = steer_seek(CurrentRed, dichuyenR1);
                Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
            end

            for ItemRed2 = 1:4
                c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                pause(0.01);
                delete(c1);
            end

            for ItemBlue = 1:5
                c2 = line([Blues(ItemBlue, 1), 400 + 600 * rand()], [Blues(ItemBlue, 2), -400 - 300 * rand()], 'Color', 'blue', 'LineStyle', '-.');
                pause(0.01);
                delete(c2);
            end

            RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
            RedrawRedHP();
            TimeStick4 = TimeStick4 + 1;
        end

        %di chuyen len dat boc pha / ok lay
        datbocphaR = [-100 -25 0];
        TimeStick5 = 1;

        while (TimeStick5 < 10)
            disp("di chuyen dat buoc pha");

            for ItemRed = 1:3
                Reds = updateAtBoundary(Reds, ItemRed);
                CurrentRed = Reds(ItemRed, :);
                forceItem = steer_seek(CurrentRed, datbocphaR);
                Reds(ItemRed, :) = applyForce(CurrentRed, forceItem);
            end

            for ItemRed2 = 1:4
                c1 = line([Red2s(ItemRed2, 1), 600 * rand()], [Red2s(ItemRed2, 2), 300 * rand()], 'Color', 'red', 'LineStyle', '-.');
                pause(0.01);
                delete(c1);
            end

            for ItemBlue = 1:5
                c2 = line([Blues(ItemBlue, 1), 400 + 600 * rand()], [Blues(ItemBlue, 2), -400 - 300 * rand()], 'Color', 'blue', 'LineStyle', '-.');
                pause(0.01);
                delete(c2);
            end

            RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
            RedrawRedHP();
            TimeStick5 = TimeStick5 + 1;

            % end

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

                for ItemBlue = 1:5
                    c2 = line([Blues(ItemBlue, 1), 400 + 600 * rand()], [Blues(ItemBlue, 2), -400 - 300 * rand()], 'Color', 'blue', 'LineStyle', '-.');
                    pause(0.01);
                    delete(c2);
                end

                RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
                RedrawRedHP();
                TimeStick4 = TimeStick4 + 1;
            end

            %quay ve vi tri nup
            TimeStick3 = 1

            while (TimeStick3 < 90)

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
                    pause(0.01);
                    delete(c1);
                end

                for ItemBlue = 1:5
                    c2 = line([Blues(ItemBlue, 1), 400 + 600 * rand()], [Blues(ItemBlue, 2), -400 - 300 * rand()], 'Color', 'blue', 'LineStyle', '-.');
                    pause(0.01);
                    delete(c2);
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

            %% MO CUA DANH CHIEN DAU CAU

            % ve xe tang
            Boids(1, 1:3) = [-900 -900 0];
            Boids(2, 1:3) = [-1000 -1000 0];
            Boids(1, :) = applyForce(Boids(1, :), 0);
            Boids(1:BoidsNum, 15) = 1000;

            [BoidsPlot] = InitializeBoid(v_ImageXT, v_AlphaXT, v_ImageE, v_AlphaE, BoidsNum, Boids);
            [BoidsHP] = InitializaHPBoids(BoidsNum, 2, Boids);

            % % ve quan do
            % [v_ImageR, v_AlphaR] = LoadImageBase('SoldierR.png', 60, 60, 0);
            % [v_ImageE, v_AlphaE] = LoadImageBase('rip.png', 60, 60, 0);
            % [RedsPlot] = InitializeBoid(v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsNum, Reds);
            % [RedsHP] = InitializeRedHP(RedsNum, MaxRedNum, Reds);

            RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
            RedrawBlueHP();

            %% Ve b41, ve dich xuat hien
            b41(1, 1:3) = [220 410 0];
            [v_Image41, v_Alpha41] = LoadImageBase('BlueB41.png', 100, 100, 0);
            b41(1, 15) = 100;

            b41Plot = InitializeBoid(v_Image41, v_Alpha41, v_ImageE, v_AlphaE, 1, b41);
            [b41HP] = InitializeHP(1, 1, b41);

            %% Chuyen quan den cac vi tri an nap
            % Cac vi tri an nap
            nup1 = [-200 200 0];
            nup2 = [200 550 0];
            nup3 = [650 250 0];
            nup4 = [250 0 0];
            nup5 = [-120 300 0];

            TimeStick1 = 1;

            %% kiet code
            % trien khai doi hinh
            TargetReds = [300 500 0];
            TargetStop = [200 200 0];
            TargetXT = [10 420 0];
            TimeStick1 = 1;
            startcombat = 0;

            Leader = Boids(1, :);
            BehindPosition = Leader;
            Leader2 = Boids(2, :);
            BehindPosition2 = Leader2;

            %% di chuyen vao can cu f
            while (dist(Boids(2, 1:3), b41(1, 1:3)) > 50)
                disp(dist(Boids(2, 1:3), b41(1, 1:3)));
                distance_target = (dist(Reds(:, 1:3), TargetReds));
                AttackRed = zeros(1, RedsNum);
                AttackBlue = zeros(1, BluesNum);
                Target1 = [200 400 0];

                CurrentBoid = Boids(1, :);
                forceBoid1 = steer_arrival(CurrentBoid, b41(1, 1:3));
                avd_force = steer_collision_avoidance1(CurrentBoid, 1, Obstacles, ObstaclesNum);
                force1 = forceBoid1 + 5 * avd_force;

                Boids(1, :) = applyForce(CurrentBoid, force1);

                CurrentBoid = Boids(2, :);
                forceBoid2 = steer_arrival(CurrentBoid, b41(1, 1:3));
                avd_force = steer_collision_avoidance1(CurrentBoid, 1, Obstacles, ObstaclesNum);
                force2 = forceBoid2 + 5 * avd_force;
                Boids(2, :) = applyForce(Boids(2, :), force2);

                AttackRed = zeros(1, RedsNum);

                %% daviation Bule //
                deviationXT = ShootDistanceB * (1 - AccuracyB * (2 * rand - 1));
                deviationYT = ShootDistanceB * (1 - AccuracyB * (2 * rand - 1));

                AttackBlue = zeros(1, BluesNum);
                % xe tang 1 ban nha

                Nha = [Nhas(1, :); Nhas(2, :); Vantais(1, :)];

                if (Boids(1, 15) > 0)

                    AttackNha = zeros(1, 3);
                    [J, tmpDist] = findTarget(Boids(1, :), 3, Nha);

                    if (J > 0 && dist(Boids(1, 1:3), Nha(J, 1:3)) < 520)

                        c1 = line([Boids(1, 1), Nha(J, 1)], [Boids(1, 2), Nha(J, 2)], 'Color', 'red', 'LineStyle', '-.');
                        [y, Fs] = audioread('soundbomb.wav');
                        sound(y, Fs);
                        pause(0.2);

                        delete(c1);

                        if (sqrt(deviationXT * deviationXT + deviationYT * deviationYT) < 520)
                            AttackNha(1, J) = AttackNha(1, J) + 100;
                        end

                    end

                end

                [NhaNum, Nhas] = UpdateBoid(AttackNha(1:2), 2, Nhas);
                [VantaiNum, Vantais] = UpdateBoid(AttackNha(3), 1, Vantais);
                RedrawNha(Nhas, NhaNum, v_ImageDef1, v_AlphaDef1, NhasPlot);
                RedrawNha(Vantais, 1, v_ImageDef2, v_AlphaDef2, VantaisPlot);
                RedrawNhaHP(Nhas, NhaNum);
                RedrawVantaiHP(Vantais, VantaiNum);

                % b41 ban tang
                if (dist(Boids(1, :), b41) < 300)

                    while (Boids(1, 15) > 0)
                        disp("b41 ban ..........")
                        c2 = line([b41(1), Boids(1, 1)], [b41(2), Boids(1, 2)], 'Color', 'blue', 'LineStyle', '-.');
                        Boids(1, 15) = Boids(1, 15) - 500;
                        [y, Fs] = audioread('rocket.wav');
                        sound(y, Fs);
                        pause(0.5);
                        % x?a duong ??n c?
                        delete(c2);

                        if (Boids(1, 15) == 0)
                            RedrawBoid(Boids, 1, v_ImageXT, v_AlphaXT, v_ImageE, v_AlphaE, BoidsPlot);
                            RedrawBoidsHP();
                        end

                    end

                end

                % xe tang 2 ban b41

                if (dist(Boids(2, :), b41) < 300)
                    disp("xt2 ban b41..........");

                    while (b41(1, 15) > 0)
                        disp("kiet ban..........");
                        disp(b41(1, 15));
                        c2 = line([Boids(2, 1), b41(1)], [Boids(2, 2), b41(2)], 'Color', 'red', 'LineStyle', '-.');
                        [y, Fs] = audioread('soundbomb.wav');
                        sound(y, Fs);
                        pause(0.2);

                        delete(c2);
                        b41(1, 15) = b41(1, 15) - 50;

                        if (b41(1, 15) > 0)
                            pause(0.1)
                        else
                            RedrawBoid(b41, 1, v_Image41, v_Alpha41, v_ImageE, v_AlphaE, b41Plot)
                            delete(b41HP);
                            break;
                        end

                    end

                end

                tankfire = 0;

                for i = 1:RedsNum

                    if (tankfire == 0)

                        if (i == 1)

                            if (Boids(1, 15) > 0)
                                Leader = Boids(1, :);
                            else
                                Leader = Boids(2, :);
                            end

                        else
                            Leader = Reds(i - 1, :);
                        end

                    end

                    Reds = updateAtBoundary(Reds, i);
                    CurrentRed = Reds(i, :);

                    avd_force = steer_collision_avoidance1(CurrentRed, 1, Obstacles, ObstaclesNum);

                    leader_foll_force = steer_leader_following(CurrentRed, Leader, FleeDistance, D_BehindLeader);

                    force = avd_force * 4 + leader_foll_force * 2;
                    Reds(i, :) = applyForce(CurrentRed, force);

                    % den gan target, tim F ban
                    if (Reds(i, 15) > 0 && distance_target < 200)

                        Reds = updateAtBoundary(Reds, i);
                        CurrentBoid = Reds(i, :);
                        [J, tmpDist] = findTarget(Reds(i, :), BluesNum, Blues);
                        tankfire = 1;

                        if (J > 0 && dist(Reds(i, :), Blues(J, :)) < ShootDistanceR)
                            c1 = line([Reds(i, 1), Blues(J, 1)], [Reds(i, 2), Blues(J, 2)], 'Color', 'red', 'LineStyle', '-.');

                            pause(0.2);
                            delete(c1);

                            if (sqrt(deviationXR * deviationXR + deviationYR * deviationYR) < 800)
                                AttackBlue(1, J) = AttackBlue(1, J) + DameOfRed;
                            end

                        end

                    end

                end

                %dich di chuyen
                for ItemBlue = 1:BluesNum
                    Blues = updateAtBoundary(Blues, ItemBlue);
                    CurrentBlue = Blues(ItemBlue, :);

                    if (ItemBlue <= 2)
                        forceItem = steer_seek(CurrentBlue, nup1);
                    end

                    if (ItemBlue >= 3 && ItemBlue <= 5)
                        forceItem = steer_seek(CurrentBlue, nup2);
                    end

                    if (ItemBlue > 5)
                        forceItem = steer_seek(CurrentBlue, nup3);
                    end

                    % if (ItemBlue > 0.6 * BluesNum && ItemBlue <= 0.9 * BluesNum)
                    %     forceItem = steer_seek(CurrentBlue, nup4);
                    % end

                    % if (ItemBlue > 0.9 * BluesNum)
                    %     forceItem = steer_seek(CurrentBlue, nup5);
                    % end

                    steer_force = steer_flock(CurrentBlue, Blues, BluesNum);
                    avd_force = steer_collision_avoidance1(CurrentBlue, 1, Obstacles, ObstaclesNum);

                    force = steer_force * 0.4 + forceItem * 3 + avd_force * 2;

                    Blues(ItemBlue, :) = applyForce(CurrentBlue, force);
                end

                % ve lai vi tri cho moi frame
                RedrawBoid(Boids, BoidsNum, v_ImageXT, v_AlphaXT, v_ImageE, v_AlphaE, BoidsPlot);
                RedrawBoidsHP();

                RedrawBoid(Reds, RedsNum, v_ImageR, v_AlphaR, v_ImageE, v_AlphaE, RedsPlot);
                RedrawRedsHP();

                RedrawBoid(Blues, BluesNum, v_ImageB, v_AlphaB, v_ImageE, v_AlphaE, BluesPlot);
                RedrawBlueHP();

                % Update Blues
                [BluesNum, Blues] = UpdateBoid(AttackBlue, BluesNum, Blues);
                % Update Reds
                [RedsNum, Reds] = UpdateBoid(AttackRed, RedsNum, Reds);

                TimeStick1 = TimeStick1 + 1;

            end

            disp("di chuyen xong -------------------------------");

            % test di chuyen
            Cong = [-200 -180 0]
            TargetXT = [100 200 0];
            TimeStick1 = 1;

            endCombat = 0;
            tam = [300 300 0];
            done = 0

            while (done == 0)
                disp(dist(Reds(5, 1:3), tam));

                for i = 1:RedsNum

                    if (dist(Reds(RedsNum - 2, 1:3), tam) < 150)
                        done = 1;
                    end

                    Reds = updateAtBoundary(Reds, i);
                    CurrentRed = Reds(i, :);

                    arr_force = steer_arrival(CurrentRed, TargetXT);
                    steer_force = steer_wander(CurrentRed);
                    avd_force = steer_collision_avoidance1(Reds, i, Obstacles, ObstaclesNum);
                    force = arr_force * 1 + steer_force * 0.4 + avd_force * 2;

                    Reds(i, :) = applyForce(CurrentRed, force);
                end

                RedrawGraphics(Reds, RedsNum, v_ImageR, v_AlphaR, RedsPlot);
                RedrawRedHP();
                disp("di chuyen red")

            end

            p1 = [-300 0 -1, 200 -200 0];
            p2 = [100 0 -1, 200 -200 0];
            AddObstacles(p1, p2, 10);

            for i = 1:ObstaclesNum
                obstacle = Obstacles(i, :);
                %p_obstacle = plot(obstacle(1), obstacle(2), 'o','MarkerFaceColor','r','Color','r');
                plot(obstacle(1), obstacle(2), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'red', 'Color', 'red');

            end

            text_object = text(-800, 400, 'GD3: LUC SUC TIEU DIET DICH TRONG DOANH TRAI', 'FontSize', 20, 'Color', 'red');
            pause(3);
            delete(text_object);

            while (endCombat == 0)

                disp("random combat .............");
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

                %% Blues
                AttackRed = zeros(1, RedsNum);

                for i = 1:BluesNum
                    %blue tim red
                    if (Blues(i, 15) > 0)
                        Blues = updateAtBoundary(Blues, i);
                        CurrentBoid = Blues(i, :);
                        [J, tmpDist] = findTarget(Blues(i, :), RedsNum, Reds);

                        if (J > 0 && dist(Blues(i, :), Reds(J, :)) < ShootDistanceB)
                            % Shoot
                            c2 = line([Reds(J, 1), Blues(i, 1) - 2], [Reds(J, 2), Blues(i, 2)], 'Color', 'blue', 'LineStyle', '-.');
                            pause(0.2);
                            delete(c2);
                            [y, Fs] = audioread('ban1s.wav');
                            sound(y, Fs);

                            if (sqrt(deviationXB * deviationXB + deviationYB * deviationYB) < 800)
                                AttackRed(1, J) = AttackRed(1, J) + DameOfBlue;
                            end

                            steer_force = steer_wander(CurrentBoid);
                            Blues(i, :) = applyForce(CurrentBoid, steer_force * 0.4);

                        else
                            steer_force = steer_wander(CurrentBoid);
                            avd_force = steer_collision_avoidance1(CurrentBoid, 1, Obstacles, ObstaclesNum);

                            if (J > 0)
                                arr_force = steer_arrival(CurrentBoid, Reds(J, :));
                            else
                                arr_force = 0;
                            end

                            force = arr_force * 1 + steer_force * 1 + avd_force * 0.7;
                            Blues(i, :) = applyForce(CurrentBoid, force);

                        end

                    end

                end

                AttackBlue = zeros(1, BluesNum);
                Target1 = [200 400 0]

                %red tim blue

                for i = 1:RedsNum
                    tam = [300 300 0];

                    if (Reds(i, 15) > 0)
                        Reds = updateAtBoundary(Reds, i);
                        CurrentRed = Reds(i, :);
                        inCamp = dist(CurrentRed(1:3), tam)

                        if (inCamp < 560)
                            [J, tmpDist] = findTarget(Reds(i, :), BluesNum, Blues);

                            if (J > 0 && dist(Reds(i, :), Blues(J, :)) < ShootDistanceR)
                                c1 = line([Reds(i, 1), Blues(J, 1)], [Reds(i, 2), Blues(J, 2)], 'Color', 'red', 'LineStyle', '-.');
                                [y, Fs] = audioread('ban1s.wav');
                                sound(y, Fs);
                                pause(0.2);
                                delete(c1);

                                if (sqrt(deviationXR * deviationXR + deviationYR * deviationYR) < 800)
                                    AttackBlue(1, J) = AttackBlue(1, J) + DameOfRed;
                                end

                            else
                                steer_force = steer_wander(CurrentRed);
                                avd_force = steer_collision_avoidance1(CurrentRed, 1, Obstacles, ObstaclesNum);

                                if (J > 0)
                                    arr_force = steer_arrival(CurrentRed, Blues(J, :));
                                else
                                    arr_force = 0;
                                end

                                force = arr_force * 1 + steer_force * 1 + avd_force * 0.7;
                                Reds(i, :) = applyForce(CurrentRed, force);

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

                if (DieRNum == RedsNum)
                    [v_ImageFB, v_AlphaFB] = LoadImageBase('FlagB.png', 400, 400, 0);
                    InitializeFlag(v_ImageFB, v_AlphaFB);
                    return;
                end

                if (DieBNum == BluesNum)
                    [v_ImageFB, v_AlphaFB] = LoadImageBase('FlagR.png', 400, 400, 0);
                    InitializeFlag(v_ImageFB, v_AlphaFB);
                    return;
                end

            end

        end
