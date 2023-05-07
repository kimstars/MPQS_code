function SET_GLOBAL_VARIABLES()
global EnvironmentWidth ImageWidth SafeDistance AlignmentRange CohesionRange...
    wanderAngle FleeDistance SpeedCorrection ...
    BoidsNum Boids TargetsNum Targets D_BehindLeader ObstaclesNum Obstacles ObstaclesF...
    ShootDistanceB ShootDistanceR  ...
    Target1  Target2 ...
    DameOfBlue DameOfRed...
    MaxRedNum MaxBlueNum  Reds  Blues Flights BloodPos SizeHPBar FlightsNum...
    AccuracyB AccuracyR;

%% Accuracy
AccuracyB =0.9; % do chinh xac
AccuracyR =0.99;
%% change global variables here (use user input or something)
EnvironmentWidth = 1000;
ImageWidth = EnvironmentWidth/10;
SafeDistance = EnvironmentWidth/20; % set separation range
AlignmentRange = EnvironmentWidth/5; % set alignment range
CohesionRange = EnvironmentWidth/4; % set cohesion range
wanderAngle = 5;
FleeDistance = 80;
SpeedCorrection = 100;
%Number of Boids
BoidsNum = 300;
%Number of Targets
TargetsNum = 1;
D_BehindLeader = 130;

BloodPos=25;

DameOfBlue = 5;
DameOfRed=5;
MaxBlueNum = 20;
ShootDistanceB = 200; 
ShootDistanceR = 300; 
Target1 = [-400 -400 0];
Target2 = [100 100 0];
SizeHPBar=1;

TanksNum = 2;
ObstaclesF=zeros(TanksNum,4);

%% List of tank
Tank = zeros(2,15);
% BlueOBJ(:,1:2) = EnvironmentWidth/4*(2*rand([BlueNum,2])-1)+300; % set random position
% Tank(1,1) = -400; Tank(1,2) = -0; 
Tank(1,1) = 400; Tank(1,2) = 400;
Tank(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Tank(:,10) = 10;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Tank(:,11) = 0.2; % set maxforce
Tank(:,13) = 200; % set max see ahead
Tank(:,14) = 10; % set max avoid force
Tank(:,15) = 100;
%% List of Reds
Reds = zeros(MaxRedNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
Reds(:,1) = EnvironmentWidth/4*(rand([MaxRedNum,1]))+200; % set random position
Reds(:,2) = EnvironmentWidth/4*(rand([MaxRedNum,1]))+200; % set random position
%Reds(:,1:2) = 2; % set random position EnvironmentWidth*(2*rand([RedsNum,2])-1)
Reds(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Reds(:,10) = 4;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Reds(:,11) = 0.2; % set maxforce
Reds(:,13) = 200; % set max see ahead
Reds(:,14) = 10; % set max avoid force
Reds(:,15) = 100; % set blood

%% List of Blues
Blues = zeros(MaxBlueNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
%Blues(:,1:2) = EnvironmentWidth*(2*rand([BluesNum,2])-1); % set random positionB
Blues(:,1) = 50*(rand([MaxBlueNum,1])) + 350; % set random position
Blues(:,2) = 50*(rand([MaxBlueNum,1])) + 100; % set random position
Blues(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Blues(:,10) = 2;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Blues(:,11) = 0.2; % set maxforce
Blues(:,13) = 200; % set max see ahead
Blues(:,14) = 10; % set max avoid force
Blues(:,15) = 100; % set blood
%% Boids data
%List of Boids
Boids = zeros(BoidsNum,15); % initialize boids matrix
%{1-3 position, 4-6 velocity, 7-9 accelaration, 10 maxspeed, 11 maxforce, 12 angle,
% 13 max see ahead (for collision avoidance), 14 max avoid force (collision avoidance)
%}
Boids(:,1:2) = EnvironmentWidth*(2*rand([BoidsNum,2])-1); % set random position
Boids(:,4:5) = 200; %200*(2*rand([BoidsNum,2])-1); % set random velocity
Boids(:,10) = 1;%*(rand([BoidsNum,1]) + 0.2); % set maxspeed
Boids(:,11) = 0.2; % set maxforce
Boids(:,13) = 100; % set max see ahead
Boids(:,14) = 100; % set max avoid force
Boids(:,15) = 5000;

%% Targets data. The targets may be leaders, persuaders... that the flock of agents want to follow.
%List of targets
Targets = zeros(TargetsNum,14);
Targets(:,1:2) = rand([TargetsNum,2])-1; % set random position
Targets(:,4:5) = 2*(2*rand([TargetsNum,2])-1); % set random velocity
Targets(:,10) = 2; % set maxspeed
Targets(:,11) = 20; % set maxforce
Targets(:,13) = 160; % set max see ahead
Targets(:,14) = 2; % set max avoid force

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
