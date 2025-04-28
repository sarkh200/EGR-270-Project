function [matrix, colorUnderBot]=clean(matrix, robotPosition)
    % clean cleans the current tile the robot is on
    % Inputs:
    %   matrix = the floor plan (in the form of a matrix)
    %   robotPosition = the position of the robot (in the form of [row, column])
    % Outputs:
    %   matrix = the updated floor plan (in the form of a matrix)
    %   colorUnderBot = a number that represents what color the robot is currently standing on
    global time batteryLife;

    colorUnderBot=matrix(robotPosition(1), robotPosition(2));
    if colorUnderBot~=2
        matrix(robotPosition(1), robotPosition(2))=5;
        batteryLife=batteryLife-1;
        colorUnderBot=5;
        time=time+5;
    end
end
