function [matrix, robotLocation, newColorUnderBot] = moveBot(matrix, robotLocation, newRobotLocation, colorUnderBot, doesClean, valueOfGray)
    newColorUnderBot = colorUnderBot;

    if robotLocation == newRobotLocation
        return;
    end

    rows = size(matrix, 1);
    columns = size(matrix, 2);

    % make sure the location the robot is trying to go to is within the bounds of the map [columns rows]
    %newRobotLocation(1) is y location ; newRobotLocation(2) is x location
    if newRobotLocation(1) > 0 && newRobotLocation(1) <= rows && newRobotLocation(2) > 0 && newRobotLocation(2) <= columns && matrix(newRobotLocation(1), newRobotLocation(2)) ~= 0
        % change the location under the robot back to what it was before robot went over it unless it's cleaning
        if doesClean && (colorUnderBot == 3 || colorUnderBot == 4)
            matrix(robotLocation(1), robotLocation(2)) = valueOfGray;
        else
            matrix(robotLocation(1), robotLocation(2)) = colorUnderBot;
        end

        %change colorUnderRobot to where the robot is going to go to
        newColorUnderBot = matrix(newRobotLocation(1), newRobotLocation(2));
        %newColorUnderBot = 5;

        %change the location of the robot in the map to the new location
        matrix(newRobotLocation(1), newRobotLocation(2)) = 1;
        % change the location of the robot to where is wants to go to
        robotLocation = newRobotLocation;
    end

end
