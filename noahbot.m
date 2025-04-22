function noahbot(matrix)

    %Pulls the position of the charger based on the map matrix given
    [r, c] = find(matrix == 2);
    %Variables
    charger = [r, c];
    robotPosition = charger;
    colorUnderRobot = matrix(robotPosition(1), robotPosition(2));

    while ~isempty(find(matrix == 3, 1))
        drawFloorPlan(matrix);
        pause(0.01);
        
        if matrix(robotPosition(1) - 1, robotPosition(2)) ~= 0 %checks up for black
            newRobotPosition = [robotPosition(1) - 1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true);
        elseif matrix(robotPosition(1), robotPosition(2) + 1) ~= 0 %checks right for black
            newRobotPosition = [robotPosition(1), robotPosition(2) + 1];
            [matrix, robotPosition, colorUnderRobot] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true);
        elseif matrix(robotPosition(1) + 1, robotPosition(2)) ~= 0 %checks bottom for black
            newRobotPosition = [robotPosition(1) + 1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true);
        elseif matrix(robotPosition(1), robotPosition(2) -1) ~= 0 %checks left for black
            newRobotPosition = [robotPosition(1), robotPosition(2) -1];
            [matrix, robotPosition, colorUnderRobot] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true);
        end

    end

end
