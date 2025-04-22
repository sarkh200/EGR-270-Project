function noahbot(matrix)

    %Pulls the position of the charger based on the map matrix given
    [r, c] = find(matrix == 2);
    %Variables
    charger = [r, c];
    robotPosition = charger;
    colorUnderRobot = matrix(robotPosition(1), robotPosition(2));
    valueOfGray = 5;

    while ~isempty(find(matrix == 3, 1))
        drawFloorPlan(matrix);
        pause(0.01);
        
        if matrix(robotPosition(1) - 1, robotPosition(2)) == 4 %checks up for black
            newRobotPosition = [robotPosition(1) - 1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot, valueOfGray] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        elseif matrix(robotPosition(1), robotPosition(2) + 1) == 4  %checks right for black
            newRobotPosition = [robotPosition(1), robotPosition(2) + 1];
            [matrix, robotPosition, colorUnderRobot, valueOfGray] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        elseif matrix(robotPosition(1) + 1, robotPosition(2)) == 4 %checks bottom for black
            newRobotPosition = [robotPosition(1) + 1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot, valueOfGray] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        elseif matrix(robotPosition(1), robotPosition(2) -1) == 4 %checks left for black
            newRobotPosition = [robotPosition(1), robotPosition(2) -1];
            [matrix, robotPosition, colorUnderRobot, valueOfGray] = moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        end
        valueOfGray
    end

end
