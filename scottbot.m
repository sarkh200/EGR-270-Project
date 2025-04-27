function [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(matrix, floorVars, maxBatteryLife)
    global batteryLife rechargeAmount;
    batteryLife=maxBatteryLife;
    %Pulls the position of the charger based on the map matrix given
    [r, c]=find(matrix==2);
    %Variables
    charger=[r, c];
    robotPosition=charger;
    colorUnderBot=matrix(robotPosition(1), robotPosition(2));
    [total_area, ratio_clean_to_dirty]=gather_data(matrix);
    while ismember(floorVars(1), matrix)||ismember(floorVars(2), matrix)
        if batteryLife<=0
            deadPosition=robotPosition;
            path=aStarPath(matrix, robotPosition, charger);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
            batteryLife=maxBatteryLife;
            [y, Fs]=audioread('sounds/recharge.mp3');
            playblocking(audioplayer(y, Fs, 16));
            time=time+60;
            rechargeAmount=rechargeAmount+1;
            colorUnderBot=2;
            path=[flip(path); deadPosition];
            [matrix, robotPosition, colorUnderBot]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
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
            [r, c]=find(matrix==floorVars(1)|matrix==floorVars(2));
            closestPosition=findClosestPosition(robotPosition, [r, c]); %looks for clean squares to go to if it gets stuck
            path=aStarPath(matrix, robotPosition, closestPosition);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
            [matrix, colorUnderBot]=clean(matrix, robotPosition);
        end
    end

    cleaned_squares=length(find(matrix>=5));
end
