function scottbot(matrix, floorVars, maxBatteryLife)
    global batteryLife;
    if ismember(4, floorVars)
        [y, Fs]=audioread('sounds/epic_music.mp3');
    else
        [y, Fs]=audioread('sounds/classical.mp3');
    end
    sound(y, Fs, 16);
    batteryLife=maxBatteryLife;
    %Pulls the position of the charger based on the map matrix given
    [r, c]=find(matrix==2);
    %Variables
    charger=[r, c];
    robotPosition=charger;
    colorUnderBot=matrix(robotPosition(1), robotPosition(2));
    while ismember(floorVars(1), matrix)||ismember(floorVars(2), matrix)
        if batteryLife<=0
            path=aStarPath(matrix, robotPosition, charger);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
            batteryLife=maxBatteryLife;
            colorUnderBot=2;
            path=flip(path);
            [matrix, robotPosition, colorUnderBot]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
            [matrix]=clean(matrix, robotPosition);
        end
        if ismember(matrix(robotPosition(1)-1, robotPosition(2)), floorVars) %checks up for black
            newRobotPosition=[robotPosition(1)-1, robotPosition(2)];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        elseif ismember(matrix(robotPosition(1), robotPosition(2)+1), floorVars) %checks right for black
            newRobotPosition=[robotPosition(1), robotPosition(2)+1];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        elseif ismember(matrix(robotPosition(1)+1, robotPosition(2)), floorVars) %checks bottom for black
            newRobotPosition=[robotPosition(1)+1, robotPosition(2)];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        elseif ismember(matrix(robotPosition(1), robotPosition(2) -1), floorVars) %checks left for black
            newRobotPosition=[robotPosition(1), robotPosition(2)-1];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        else
            [matrix, colorUnderBot]=clean(matrix, robotPosition);
            [r, c]=find(matrix==floorVars(1)|matrix==floorVars(2)); %looks for clean squares to go to if it gets stuck
            path=aStarPath(matrix, robotPosition, [r(1), c(1)]);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
            [matrix, colorUnderBot]=clean(matrix, robotPosition);
        end
    end

end
