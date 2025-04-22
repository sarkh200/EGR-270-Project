function noahbot(matrix)

    %Pulls the position of the charger based on the map matrix given
    [r, c]=find(matrix==2);
    %Variables
    charger=[r, c];
    robotPosition=charger;
    colorUnderRobot=matrix(robotPosition(1), robotPosition(2));
    valueOfGray=5;
    % ~isempty(find(matrix==3, 1))
    while ismember(3, matrix)||ismember(4, matrix)

        if ismember(matrix(robotPosition(1)-1, robotPosition(2)), [3, 4]) %checks up for black
            newRobotPosition=[robotPosition(1)-1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot, valueOfGray]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        elseif ismember(matrix(robotPosition(1), robotPosition(2)+1), [3, 4]) %checks right for black
            newRobotPosition=[robotPosition(1), robotPosition(2)+1];
            [matrix, robotPosition, colorUnderRobot, valueOfGray]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        elseif ismember(matrix(robotPosition(1)+1, robotPosition(2)), [3, 4]) %checks bottom for black
            newRobotPosition=[robotPosition(1)+1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot, valueOfGray]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        elseif ismember(matrix(robotPosition(1), robotPosition(2) -1), [3, 4]) %checks left for black
            newRobotPosition=[robotPosition(1), robotPosition(2)-1];
            [matrix, robotPosition, colorUnderRobot, valueOfGray]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, valueOfGray);
        else
            disp("Stuck!");
            break
        end

        drawFloorPlan(matrix);
        pause(0.01);
    end

end
