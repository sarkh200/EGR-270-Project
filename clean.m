function [matrix, batteryLife, colorUnderBot]=clean(matrix, robotPosition, batteryLife)
    matrix(robotPosition(1), robotPosition(2))=5;
    batteryLife=batteryLife-1;
    colorUnderBot=5;
end
