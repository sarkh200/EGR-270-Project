function [matrix, currentPosition, colorUnderBot]=moveAlongPath(matrix, path, currentPosition, colorUnderBot)
    % moveAlongPath moves the robot along a specified path
    % Inputs:
    %   matrix = floor plan in the form of a matrix
    %   path = path that the robot has to follow
    %   currentPosition = the current position of the robot
    %   colorUnderBot = the current color under the robot
    % Outputs:
    %   matrix = the updated floor plan
    %   currentPosition = the updated position of the robot
    %   colorUnderBot = the updated color under the robot

    % loop through entire path and move the robot to each position
    for i=1:size(path, 1)
        [matrix, currentPosition, colorUnderBot]=moveBot(matrix, currentPosition, path(i, :), colorUnderBot, false);
    end

end
