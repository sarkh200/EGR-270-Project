function [total_area, ratio_clean_to_dirty, cleaned_squares]=scottbot(matrix, floorVars, maxBatteryLife)
    % Input Arguments:
    % matrix = the matrix used to find the nodes around it
    % floorVars = passes the values of the dirty tiles on the floor, such as 3 and/or 4
    % maxBatteryLife = the total battery life that is passed into function (varies by roomba model)
    % Output Arguments:
    % total_area = the total area of the map excluding the walls
    % ratio_clean_to_dirty = the percentage of the dirty floor compared to the clean floor
    % cleaned_squares = the total amount of cleaned squares that the roomba has already gone over
    global batteryLife rechargeAmount time;
    batteryLife=maxBatteryLife;
    %Pulls the position of the charger based on the map matrix given
    [dirtRow, dirtCol]=find(matrix==2);
    % Variables
    charger=[dirtRow, dirtCol];
    robotPosition=charger;
    colorUnderBot=matrix(robotPosition(1), robotPosition(2));
    [total_area, ratio_clean_to_dirty]=gather_data(matrix);

    % loop while there are still "dirty" squares
    while ismember(floorVars(1), matrix)||ismember(floorVars(2), matrix)
        % recharges if battery is too low
        if batteryLife<=0
            deadPosition=robotPosition; % saves where it died
            path=aStarPath(matrix, robotPosition, charger); % find the path to the charger
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot); % go along calculated path
            % recharge
            batteryLife=maxBatteryLife;
            [y, Fs]=audioread('sounds/recharge.mp3');
            playblocking(audioplayer(y, Fs, 16)); % play recharge sound
            time=time+60;
            rechargeAmount=rechargeAmount+1;
            colorUnderBot=2;
            path=[flip(path); deadPosition]; % go along path backwards to get back to where it died
            [matrix, robotPosition, colorUnderBot]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
        end
        % check surroundings for available squares
        if ismember(matrix(robotPosition(1)-1, robotPosition(2)), floorVars) %checks up for dirt and goes there if available
            newRobotPosition=[robotPosition(1)-1, robotPosition(2)];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        elseif ismember(matrix(robotPosition(1), robotPosition(2)+1), floorVars) %checks right for dirt and goes there if available
            newRobotPosition=[robotPosition(1), robotPosition(2)+1];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        elseif ismember(matrix(robotPosition(1)+1, robotPosition(2)), floorVars) %checks bottom for dirt and goes there if available
            newRobotPosition=[robotPosition(1)+1, robotPosition(2)];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        elseif ismember(matrix(robotPosition(1), robotPosition(2) -1), floorVars) %checks left for dirt and goes there if available
            newRobotPosition=[robotPosition(1), robotPosition(2)-1];
            [matrix, robotPosition, colorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, true);
        else % find and go to nearest dirty spot
            [matrix, colorUnderBot]=clean(matrix, robotPosition);
            [dirtRow, dirtCol]=find(matrix==floorVars(1)|matrix==floorVars(2));
            closestPosition=findClosestPosition(robotPosition, [dirtRow, dirtCol]); %looks for clean squares to go to if it gets stuck
            path=aStarPath(matrix, robotPosition, closestPosition);
            [matrix, robotPosition, ~]=moveAlongPath(matrix, path, robotPosition, colorUnderBot);
            [matrix, colorUnderBot]=clean(matrix, robotPosition);
        end
    end

    cleaned_squares=length(find(matrix>=5)); % find amount of cleaned squares
end
