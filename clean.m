function [matrix, batteryLife, colorUnderBot]=clean(matrix, robotPosition, batteryLife)
    colorUnderBot = matrix(robotPosition(1), robotPosition(2));
    if colorUnderBot ~= 2
        matrix(robotPosition(1), robotPosition(2))=5;
        batteryLife=batteryLife-1;
        disp(batteryLife);
        colorUnderBot=5;
    end
end
