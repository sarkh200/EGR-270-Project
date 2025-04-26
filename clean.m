function [matrix, colorUnderBot]=clean(matrix, robotPosition)
    global time batteryLife;
    
    colorUnderBot = matrix(robotPosition(1), robotPosition(2));
    if colorUnderBot ~= 2
        matrix(robotPosition(1), robotPosition(2))=5;
        batteryLife=batteryLife-1;
        colorUnderBot=5;
        time = time + 5;
    end
end
