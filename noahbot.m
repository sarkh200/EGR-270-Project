function batteryLife=noahbot(matrix, maxBatteryLife)
    batteryLife = maxBatteryLife;
    %Pulls the position of the charger based on the map matrix given
    [r, c]=find(matrix==2);
    %Variables
    charger=[r, c];
    robotPosition=charger;
    colorUnderRobot=matrix(robotPosition(1), robotPosition(2));
    % ~isempty(find(matrix==3, 1))
    while ismember(3, matrix)||ismember(4, matrix)
        if batteryLife <= 0 %when noahbot dies, it A-stars back to the charger then A-stars back to he position it died at
            deadSpace = robotPosition;
            path = aStarPath(matrix, robotPosition, charger);
            [matrix, robotPosition, colorUnderRobot] = moveAlongPath(matrix, path, colorUnderRobot, batteryLife);
            batteryLife = maxBatteryLife;
            path = aStarPath(matrix, robotPosition, deadSpace);
            [matrix, robotPosition, colorUnderRobot] = moveAlongPath(matrix, path, colorUnderRobot, batteryLife);
            
        end
        if ismember(matrix(robotPosition(1)-1, robotPosition(2)), [3, 4]) %checks up for black
            newRobotPosition=[robotPosition(1)-1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, batteryLife);
        elseif ismember(matrix(robotPosition(1), robotPosition(2)+1), [3, 4]) %checks right for black
            newRobotPosition=[robotPosition(1), robotPosition(2)+1];
            [matrix, robotPosition, colorUnderRobot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, batteryLife);
        elseif ismember(matrix(robotPosition(1)+1, robotPosition(2)), [3, 4]) %checks bottom for black
            newRobotPosition=[robotPosition(1)+1, robotPosition(2)];
            [matrix, robotPosition, colorUnderRobot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, batteryLife);
        elseif ismember(matrix(robotPosition(1), robotPosition(2) -1), [3, 4]) %checks left for black
            newRobotPosition=[robotPosition(1), robotPosition(2)-1];
            [matrix, robotPosition, colorUnderRobot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderRobot, true, batteryLife);
        else
            [r, c]=find(matrix==4 | matrix==3); %looks for clean squares to go to if it gets stuck
            path = aStarPath(matrix, robotPosition, [r(1), c(1)]);
            [matrix, robotPosition, colorUnderRobot]=moveAlongPath(matrix, path, colorUnderRobot, 100); %moves to the clean squares after being stuck
            % clear sound
            % disp("Stuck!");
            % [y, Fs]=audioread('sounds/badunk.mp3');
            % badunk=audioplayer(y, Fs, 16);
            % playblocking(badunk);
            % break
        end
    end

end
