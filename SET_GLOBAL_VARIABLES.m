function SET_GLOBAL_VARIABLES()
    global EnvironmentWidth ImageWidth SafeDistance AlignmentRange CohesionRange ...
        wanderAngle FleeDistance SpeedCorrection ...
        BoidsNum Boids TargetsNum Targets D_BehindLeader ObstaclesNum Obstacles ObstaclesF ...
        ShootDistanceB ShootDistanceR ...
        Target1 Target2 ...
        DameOfBlue DameOfRed ...
        MaxRedNum MaxBlueNum Reds Red2s Blues b41Num Flights BloodPos SizeHPBar FlightsNum ...
        AccuracyB AccuracyR;
    global Nhas Vantais MaxNhaNum NhaNum NhasHP VantaisHP VantaiNum MaxVantaiNum;

    NhaNum = 2;
    MaxNhaNum = 2;

    VantaiNum = 1;
    MaxVantaiNum = 1;
    % nha
    Nhas = zeros(MaxNhaNum, 15);

    Nhas(1, 1) = -250;
    Nhas(1, 2) = 220;

    Nhas(2, 1) = 250;
    Nhas(2, 2) = 400;

    Nhas(:, 15) = 4000;

    Vantais = zeros(1, 15);
    Vantais(1, 1) = 300;
    Vantais(1, 2) = 50;
    Vantais(:, 15) = 4000;


    %% Accuracy
    AccuracyB = 0.9; % do chinh xac
    AccuracyR = 0.99;
    %% change global variables here (use user input or something)
    EnvironmentWidth = 1000;
    ImageWidth = EnvironmentWidth / 10;
    SafeDistance = EnvironmentWidth / 20; % set separation range
    AlignmentRange = EnvironmentWidth / 5; % set alignment range
    CohesionRange = EnvironmentWidth / 4; % set cohesion range
    wanderAngle = 5;
    FleeDistance = 10;
    SpeedCorrection = 100;
    %Number of Boids
    BoidsNum = 300;
    %Number of Targets
    TargetsNum = 1;
    D_BehindLeader = 15;

    BloodPos = -25;

    DameOfBlue = 5;
    DameOfRed = 5;
    MaxBlueNum = 20;
    ShootDistanceB = 250;
    ShootDistanceR = 250;
    Target1 = [-400 -400 0];
    Target2 = [100 100 0];
    SizeHPBar = 1;
    b41Num = 1;
    TanksNum = 2;
    ObstaclesF = zeros(TanksNum, 4);

    %% List of Reds
    Reds = zeros(MaxRedNum, 15); % initialize boids matrix
    %{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
    % 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
    Reds(:, 1) = -1000; % set random position
    Reds(:, 2) = -1000; % set random position
    %Reds(:,1:2) = 2; % set random position EnvironmentWidth*(2*rand([RedsNum,2])-1)
    Reds(:, 4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
    Reds(:, 10) = 9; %*(rand([BoidsNum,1]) + 0.2); % set maxspeed
    Reds(:, 11) = 0.8; % set maxforce
    Reds(:, 13) = 200; % set max see ahead
    Reds(:, 14) = 10; % set max avoid force
    Reds(:, 15) = 100; % set blood

    %% List of Red2s
    Red2s = zeros(MaxRedNum, 15); % initialize boids matrix
    %{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
    % 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
    Red2s(:, 1) = 150 * (rand([MaxRedNum, 1])) + 800; % set random position
    Red2s(:, 2) = 150 * (rand([MaxRedNum, 1])) -950; % set random position
    Red2s(:, 4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
    Red2s(:, 10) = 8; %*(rand([BoidsNum,1]) + 0.2); % set maxspeed
    Red2s(:, 11) = 0.8; % set maxforce
    Red2s(:, 13) = 200; % set max see ahead
    Red2s(:, 14) = 10; % set max avoid force
    Red2s(:, 15) = 100; % set blood

    %% List of Blues
    Blues = zeros(MaxBlueNum, 15); % initialize boids matrix
    %{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
    % 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
    %Blues(:,1:2) = EnvironmentWidth*(2*rand([BluesNum,2])-1); % set random positionB
    Blues(:, 1) = 50 * (rand([MaxBlueNum, 1])) + 350; % set random position
    Blues(:, 2) = 50 * (rand([MaxBlueNum, 1])) + 100; % set random position
    Blues(:, 4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
    Blues(:, 10) = 5; %*(rand([BoidsNum,1]) + 0.2); % set maxspeed
    Blues(:, 11) = 0.4; % set maxforce
    Blues(:, 13) = 200; % set max see ahead
    Blues(:, 14) = 10; % set max avoid force
    Blues(:, 15) = 100; % set blood
    %% Boids data
    %List of Boids
    Boids = zeros(BoidsNum, 15); % initialize boids matrix
    %{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
    % 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
    Boids(:, 1:2) = EnvironmentWidth * (2 * rand([BoidsNum, 2]) - 1); % set random position
    Boids(:, 4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
    Boids(:, 10) = 10; %*(rand([BoidsNum,1]) + 0.2); % set maxspeed
    Boids(:, 11) = 1; % set maxforce
    Boids(:, 13) = 200; % set max see ahead
    Boids(:, 14) = 1; % set max avoid force
    Boids(:, 15) = 5000;

    %% Set static Obstacle data
    % ObstaclesNum = 1;
    % Obstacles = [0 0 0 0];

    %  ObstaclesNum = 3;
    %
    % Obstacles = [ 50 50 0 20 1.5 1.5 0;
    %                -200  -50 0 20 1.5 0 0;
    %                300 200 0 20 0 1.5 0];

    %Predefined Obstacles
    % Obstacles = [300 200 0 30;
    %              -100 200 0 45;
    %              200 -200 0 50];

    %{1-3 position of obstacle, 4: radius
