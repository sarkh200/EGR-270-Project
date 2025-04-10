inFileName = input('Enter name of floor file: ', 's');
inFid = fopen(inFileName);
A = fscanf(inFid, '%i', [25 30])';
fclose(inFid);

drawFloorPlan(A);

userInput = '';

robotLocation = [2, 2];

colorUnderRobot = 2;

while strcmp(userInput, 'end') == false
    userInput = input('>', 's');
    newRobotLocation = robotLocation;

    switch userInput
        case 'w'
            newRobotLocation(1) = robotLocation(1) - 1;
        case 's'
            newRobotLocation(1) = robotLocation(1) + 1;
        case 'a'
            newRobotLocation(2) = robotLocation(2) - 1;
        case 'd'
            newRobotLocation(2) = robotLocation(2) + 1;
    end

    if (newRobotLocation(1) > 0 && newRobotLocation(1) < 31 && newRobotLocation(2) > 0 && newRobotLocation(2) < 26)
        A(robotLocation(1), robotLocation(2)) = colorUnderRobot;
        colorUnderRobot = A(newRobotLocation(1), newRobotLocation(2));
        A(newRobotLocation(1), newRobotLocation(2)) = 1;
        robotLocation = newRobotLocation;
    end

    drawFloorPlan(A);
end
