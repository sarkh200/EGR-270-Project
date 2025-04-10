[model, plan] = main_menu();

floorMap = getFloorPlans(plan);

drawFloorPlan(floorMap);

userInput = '';

robotLocation = [2, 2]; %the starting location of our roomba

colorUnderRobot = floorMap(robotLocation(1), robotLocation(2)); %color under initial location (bound to change after loop)

while strcmp(userInput, 'end') == false %Pseudocode practice: direct input of movement (WASD)
    userInput = input('>', 's');
    newRobotLocation = robotLocation;

    switch userInput
        case 'w'
            newRobotLocation(1) = robotLocation(1) - 1;
        case 's'
            newRobotLocation(1) = robotLocation(1) + 1;
        case 'a'
            newRobotLocation(2) = robotLocation(2) - 1;
        case 'd'
            newRobotLocation(2) = robotLocation(2) + 1;
    end

    % make sure the location the robot is trying to go to is within the bounds of the map [25 30]
    %newRobotLocation(1) is y location ; newRobotLocation(2) is x location
    if (newRobotLocation(1) > 0 && newRobotLocation(1) < 31 && newRobotLocation(2) > 0 && newRobotLocation(2) < 26)
        floorMap(robotLocation(1), robotLocation(2)) = colorUnderRobot; % change the location under the robot back to what it was before robot went over it
        %colorUnderRobot = floorMap(newRobotLocation(1), newRobotLocation(2)); %change colorUnderRobot to where the robot is going to go to
        colorUnderRobot = 5;
        floorMap(newRobotLocation(1), newRobotLocation(2)) = 1; %change the location of the robot in the map to the new location
        robotLocation = newRobotLocation; % change the location of the robot to where is wants to go to
    end

    clc();
    drawFloorPlan(floorMap);
end
