function [matrix, robotPosition, newColorUnderBot]=moveBot(matrix, robotPosition, newRobotPosition, colorUnderBot, doesClean)
    % moveBot moves the robot to the position specified
    % Inputs:
    %   matrix = the floor map in the form of a matrix
    %   robotPosition = the original position of the robot
    %   newRobotPosition = the position the robot wants to go to
    %   colorUnderBot = the color that is currently under the robot
    %   doesClean = should the robot clean the square it's going to
    % Outputs:
    %   matrix = the updated matrix
    %   robotPosition = the updated position of the robot
    %   newColorUnderBot = the updated color under the robot

    global time;

    %initializes newColorUnderBot
    newColorUnderBot=colorUnderBot;

    %   skips if the robot is trying to move to where it currently is
    if robotPosition==newRobotPosition
        return;
    end

    % get the dimensions of the matrix
    rows=size(matrix, 1);
    columns=size(matrix, 2);

    % make sure the Position the robot is trying to go to is within the bounds of the map [columns rows]
    %newRobotPosition(1) is y Position ; newRobotPosition(2) is x Position
    if newRobotPosition(1)>0&&newRobotPosition(1)<=rows&&newRobotPosition(2)>0&&newRobotPosition(2)<=columns&&matrix(newRobotPosition(1), newRobotPosition(2))~=0
        % change the Position under the robot back to what it was before robot went over it unless it's cleaning
        if doesClean&&(colorUnderBot==3||colorUnderBot==4)
            [matrix]=clean(matrix, robotPosition);
        else
            matrix(robotPosition(1), robotPosition(2))=colorUnderBot;
        end

        %change colorUnderBot to where the robot is going to go to
        newColorUnderBot=matrix(newRobotPosition(1), newRobotPosition(2));

        %change the Position of the robot in the map to the new Position
        matrix(newRobotPosition(1), newRobotPosition(2))=1;
        % change the Position of the robot to where is wants to go to
        robotPosition=newRobotPosition;
        % increase time
        time=time+1;
    end

    drawFloorPlan(matrix);
end
