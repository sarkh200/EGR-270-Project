function batteryLife=scottbot(matrix, maxBatteryLife)
    [y, Fs]=audioread('sounds/epic_music.mp3');
    sound(y, Fs, 16);
    batteryLife=maxBatteryLife;
    %Pulls the position of the charger based on the map matrix given
    [r, c]=find(matrix==2);
    %Variables
    charger=[r, c];
    robotPosition=charger;
    colorUnderBot=matrix(robotPosition(1), robotPosition(2));
    while ismember(3, matrix)
        if batteryLife<=0
            deadSpace=robotPosition;
            path=aStarPath(matrix, robotPosition, charger);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot, batteryLife);
            batteryLife=maxBatteryLife;
            colorUnderBot=2;
            path=aStarPath(matrix, robotPosition, deadSpace);
            [matrix, robotPosition, colorUnderBot]=moveAlongPath(matrix, path, robotPosition, colorUnderBot, batteryLife);
            [matrix, batteryLife]=clean(matrix, robotPosition, batteryLife);
        end
        if ismember(matrix(robotPosition(1)-1, robotPosition(2)), 3) %checks up for black
            newRobotPosition=[robotPosition(1)-1, robotPosition(2)];
            [matrix, robotPosition, colorUnderBot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true, batteryLife);
        elseif ismember(matrix(robotPosition(1), robotPosition(2)+1), 3) %checks right for black
            newRobotPosition=[robotPosition(1), robotPosition(2)+1];
            [matrix, robotPosition, colorUnderBot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true, batteryLife);
        elseif ismember(matrix(robotPosition(1)+1, robotPosition(2)), 3) %checks bottom for black
            newRobotPosition=[robotPosition(1)+1, robotPosition(2)];
            [matrix, robotPosition, colorUnderBot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true, batteryLife);
        elseif ismember(matrix(robotPosition(1), robotPosition(2) -1), 3) %checks left for black
            newRobotPosition=[robotPosition(1), robotPosition(2)-1];
            [matrix, robotPosition, colorUnderBot, batteryLife]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true, batteryLife);
        else
            [matrix, batteryLife, colorUnderBot]=clean(matrix, robotPosition, batteryLife);
            [r, c]=find(matrix==3); %looks for clean squares to go to if it gets stuck
            path=aStarPath(matrix, robotPosition, [r(1), c(1)]);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot, batteryLife);
            [matrix, batteryLife, colorUnderBot]=clean(matrix, robotPosition, batteryLife);
        end
    end

end
