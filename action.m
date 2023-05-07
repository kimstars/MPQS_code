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
        global deviationXB deviationYB deviationXR deviationYR;
        global AccuracyB AccuracyR;
        global RandomPosition SafeDistance Flights FlightsNum ObstaclesF RedsNum DieRNum DieBNum goToAttack DameOfBlue DameOfRed;
        global RedsHP;
        global ObstaclesR;
        global ObstaclesB;
        global DieRNum DieBNum;
        global MaxRedNum;
        global endCombat;
        global FleeDistance;
        global D_BehindLeader;

        BoidsNum = 3; % Choose number of Boids to demo
        Boids(1, 10) = 1; % set max speed of 1-st Boid
        Boids(2:BoidsNum, 10) = 1;

        %% first draw
        [v_Image, v_Alpha, fHandler] = InitializeGraphics();
        BluesNum = 15;
        SafeDistance = 20;
        %Initialize the first positon of Goal
        RandomPosition = [400 200 0 0 0 0];
        titleStr = 'Nhom 00';
        titleStr = [titleStr newline '(Kich ban danh chiem dau cau)'];
        title(titleStr);
        set(fHandler, 'WindowButtonDownFcn', @cursorClickCallback);
        % tai hinh
        [v_ImageFallTree, v_AlphaFallTree] = LoadImageBase('tree.png', 150, 80, 0);
        [v_ImageB, v_AlphaB] = LoadImageBase('SoldierB.png', 60, 60, 0);
        [v_ImageE, v_AlphaE] = LoadImageBase('rip.png', 60, 60, 0);
        [v_ImageVic, v_AlphaVic] = LoadImageBase('victory.png', 300, 300, 0);

        % ve quan xanh
        [BluesPlot] = InitializeBoid(v_ImageB, v_AlphaB, v_ImageE, v_AlphaE, BluesNum, Blues);
        [BluesHP] = InitializeHP(BluesNum, MaxBlueNum, Blues);

        RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
        RedrawBlueHP();
        %% ve xe ta
        %     %Boids o day la xe (3 xe)
        %     Boids(:, 10) = 1;
        %     Boids(1, 1:3) = [-450 -300 0];
        %     Boids(2, 1:3) = [-550 -300 0];
        %     Boids(3, 1:3) = [-650 -300 0];
        %     Boids(1, :) = applyForce(Boids(1, :), 0);
        %     Boids(1:BoidsNum, 15) = 1000;
        %
        %     [BoidsPlot] = InitializeBoid(v_Image, v_Alpha, v_ImageE, v_AlphaE, BoidsNum, Boids);
        %     [BoidsHP] = InitializaHPBoids(BoidsNum, MaxBlueNum, Boids);
        %
        %     TargetBoid1 = [200 0 0];
        %
        %     while (Boids(1, 1) < 0)
        %         CurrentBoid = Boids(1, :);
        %         forceBoid1 = steer_seek(CurrentBoid, TargetBoid1);
        %         Boids(1, :) = applyForce(CurrentBoid, forceBoid1);
        %         forceBoid2 = steer_seek(Boids(2, :), Boids(1, :));
        %         Boids(2, :) = applyForce(Boids(2, :), forceBoid2);
        %         forceBoid3 = steer_seek(Boids(3, :), Boids(2, :));
        %         Boids(3, :) = applyForce(Boids(3, :), forceBoid3);
        %         Boids(1, 12) = 0;
        %         Boids(2, 12) = 0;
        %         Boids(3, 12) = 0;
        %         RedrawBoids(Boids, 3, v_Image, v_Alpha, BoidsPlot);
        %         RedrawBoidsHP();
        %     end

        %% Chuyen quan den cac vi tri an nap
        % Cac vi tri an nap
        nup1 = [-200 200 0];
        nup2 = [200 550 0];
        nup3 = [650 250 0];
        nup4 = [250 0 0];
        nup5 = [-120 300 0];

        TimeStick1 = 1;

        while (TimeStick1 < 350)

            for ItemBlue = 1:BluesNum
                Blues = updateAtBoundary(Blues, ItemBlue);
                CurrentBlue = Blues(ItemBlue, :);

                if (ItemBlue <= 0.1 * BluesNum)
                    forceItem = steer_seek(CurrentBlue, nup1);
                end

                if (ItemBlue >= 0.2 * BluesNum && ItemBlue <= 0.4 * BluesNum)
                    forceItem = steer_seek(CurrentBlue, nup2);
                end

                if (ItemBlue > 0.4 * BluesNum && ItemBlue <= 0.6 * BluesNum)
                    forceItem = steer_seek(CurrentBlue, nup3);
                end

                if (ItemBlue > 0.6 * BluesNum && ItemBlue <= 0.9 * BluesNum)
                    forceItem = steer_seek(CurrentBlue, nup4);
                end

                if (ItemBlue > 0.9 * BluesNum)
                    forceItem = steer_seek(CurrentBlue, nup5);
                end

                Blues(ItemBlue, :) = applyForce(CurrentBlue, forceItem);
            end

            RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
            RedrawBlueHP();
            TimeStick1 = TimeStick1 + 1;
        end

        % test di chuyen toi vi tri nao do
        % TargetBoid1 = [-600 -200 0];
        % TimeStick1 = 1;

        % while (dist(Blues(:, 1:3), TargetBoid1) > 60)
        %     disp(dist(Blues(:, 1:3), TargetBoid1));

        %     for i = 1:BluesNum
        %         Blues = updateAtBoundary(Blues, i);
        %         CurrentBlue = Blues(i, :);

        %         arr_force = steer_arrival(CurrentBlue, TargetBoid1);
        %         flk_force = steer_flock(CurrentBlue, Blues, BluesNum);
        %         avd_force = steer_collision_avoidance1(CurrentBlue, 1, Obstacles, ObstaclesNum);
        %         force = arr_force * 1 + flk_force * 2 + avd_force * 7;
        %         Blues(i, :) = applyForce(CurrentBlue, force);

        %     end

        %     RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
        %     RedrawBlueHP();
        %     TimeStick1 = TimeStick1 + 1;
        % end

        % leader following
        %     Target = [-200 -200 0 ];
        %
        %    timeTick = 1;
        %    while(timeTick < 400)
        %
        %        for i = 1:BluesNum
        %             Leader = Blues(1, :);
        %             Blues = updateAtBoundary(Blues,i);
        %             CurrentBlue = Blues(i, :);
        %             arr_force = steer_arrival(CurrentBlue, Target);
        %
        %             avd_force = steer_collision_avoidance1(CurrentBlue, 1, Obstacles, ObstaclesNum);
        %             leader_force = steer_leader_following(CurrentBlue, Leader, FleeDistance, D_BehindLeader);
        %             force = arr_force + leader_force*3 + 2*avd_force;
        %
        %             Blues(i,:) = applyForce(CurrentBlue, force);
        %     end
        %     % redraw
        %     RedrawGraphics(Blues, BluesNum, v_ImageB, v_AlphaB, BluesPlot);
        %     RedrawBlueHP();
        %     TimeStick1 = TimeStick1 + 1;
        %    end


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
                        CurrentBoid = Blues(i, :);
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
